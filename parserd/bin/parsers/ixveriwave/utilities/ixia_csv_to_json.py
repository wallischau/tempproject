import platform
import argparse
import os
import csv
import json
import re
import xml.etree.ElementTree

from .ixia_headers import IXIA_RESULT_HEADERS

class ParserException:
  
  class All(Exception):
    pass
    
  class TestTypeNotFound(All):
    pass

NAS_DRIVE_ADDRESS = '96.37.189.6'

def determine_result_files(path, result_type):
  
  filelist = []
  
  file_patterns = IXIA_RESULT_HEADERS[result_type[0]].keys()
  path_files = os.listdir(path)
  
  for file in path_files:
    for pattern in file_patterns:
      result = re.match(pattern, file)
      if result:
        filelist.append((file, pattern))

  return filelist
  
def convert(data):
  
  try:
    return int(data)
  except:
    try:
      return float(data)
    except:
      if data:
        if data[0] == '[' and data[-1] == ']':
          data = eval(data)
      return data
  
def normalize(list_or_dict):
  
  new_item = list_or_dict
  
  if isinstance(list_or_dict, dict): 
    new_item = {}
    for key, value in list_or_dict.items():
      new_item[key] = convert(value)
    
  elif isinstance(list_or_dict, list):
    new_item = []
    for value in list_or_dict:
      new_item.append(convert(value))
  
  return new_item
  
def parse_recursive(results, lines, lineno, pattern_obj):
  
  if lineno >= len(lines):
    return
  
  cols = []
  cols_pattern = ""
  
  while lineno < len(lines):
  
    line = lines[lineno]
    line_split = []
    
    ready_to_insert = False
    for pattern, obj in pattern_obj.items():
      
      pattern_split = pattern.split('@@')
      pattern_key = pattern_split[0]
      pattern_regex = pattern_split[1]
      
      pattern_result = re.search(pattern_regex, line)
      line_split = [l.strip() for l in line.split(',')]
      
      
      if pattern_result:
      
        # Line matches pattern
      
        if isinstance(obj, dict):
          
          # This is another dictionary to define parsing rules
          
          if pattern_key not in results:
            results[pattern_key] = []
          
          ret = {}
          
          arrinfo = pattern_result.groups()
          keyinfo = pattern_result.groupdict()
          
          if keyinfo:
            # Insert regex groups
            keyinfo = normalize(keyinfo)
            ret.update(keyinfo)
          
          lineno = parse_recursive(ret, lines, lineno, obj)
          
          results[pattern_key].append(ret)
          
          ready_to_insert = False
          break
          
        else:
        
          # These are table rows. Save keys for later use
          cols = line_split
          cols_pattern = pattern_key
          ready_to_insert = False
          break
      
      
      elif cols:
      
        # Pattern did not match, but we may have more patterns to check
        # Signal that we are ready to insert entry
        ready_to_insert = True
        
    # Outside of for-loop 
    
    if ready_to_insert:
    
      # Signals result row(no patterns match)
      if len(cols) == len(line_split):
      
        # Line has same column width as saved columns
        
        # Normalize
        line_split = normalize(line_split)
      
        # Add entry
        new_entry = dict(zip(cols, line_split))
        if cols_pattern not in results:
          results[cols_pattern] = []
        
        # Save the entry
        results[cols_pattern].append(new_entry)
          
      elif line:
      
        # End of function
        return lineno - 1
    
    # Increment the line number; we'll be iterating again
    lineno += 1
    
  return lineno
  
def parse_html_log(html_log):

  errors = []

  DELIMITERS = ['<span class=MSG_ERROR>', '</span>']
  delimiter = 0
  
  with open(html_log) as html:
  
    error = ''
  
    for line in html:
      
      # The search and replace has to be done because there are two different
      # versions of the error log file
      line = line. \
        strip(). \
        replace('<font ', '</span><font '). \
        replace('<font color=red>', '<span class=MSG_ERROR>')
      
      index = 0
      while True:
        
        look_for = DELIMITERS[delimiter]
        index = line.find(look_for)
        
        if index >= 0:
          
          if delimiter == 0:
            # This is the starting tag. Slice out the tag from rest of line
            line = line[(index + len(look_for)):]
            
          else:
            # This is the ending tag
            error += line[:index]
            line = line[(index + len(look_for)):]
          
            # We'll add the error to the errors list
            errors.append(error)
            error = '' 
          
          # Switch the delimiter
          delimiter ^= 1
          
          # Continue the while loop. We may have more tags in the line
          continue
        
        elif delimiter == 1:
          # We're scanning for a closing tag, so add the line
          error += line
          
        # Exit the while loop. Nothing else to scan in the current line
        break
        
  return errors
  
def parse_errors(path, file):
  
  files = os.listdir(path)
  html_files = [file for file in files if file[-5:] == '.html']
  
  html_log = None
  
  if len(html_files) > 1:
    # We have multiple HTML files. Some tests may have multiple results and 
    # log files, but are not consistent with the name of the result file. To
    # generalize the solution, we will compare all the '_' delimited pieces 
    # between .html and .csv and pair the HTML file with the most matches
    
    # Remove the '.csv' portion and split
    file_delimited = file[:-4].split('_')
    
    highest = 0
    for html_file in html_files:
    
      counter = 0
      html_delimited = html_file[:-5].split('_')
      
      for element in file_delimited:
        if element in html_delimited:
          counter += 1
      
      if counter > highest:
        html_log = html_file
      
  else:
    # Since we only have 1 HTML file, we'll assume this is the log
    html_log = html_files[0]
    
  html_log = os.path.join(path, html_log)
  results = parse_html_log(html_log)
  
  return results
  
  
def parse_result_by_file(path, file, result_type):
  
  ret = {}
  lines = []
  
  filename = os.path.join(path, file[0])
  
  with open(filename) as csv_file:
    for line in csv_file:
      lines.append(line.strip())
  
  pattern_obj = IXIA_RESULT_HEADERS[result_type[0]][file[1]]
  parse_recursive(ret, lines, 0, pattern_obj)
  
  if ret:
    # No error
    ret['errors'] = None
  
  else:
    # There was probably an error... Let's find out!
    ret['errors'] = parse_errors(path, file[0])
  
  return ret
  
def parse_result_by_type(path, result_type):
  
  results = {}
  files = determine_result_files(path, result_type)
  
  for file in files:
    key = file[0][:-4]
    results[key] = parse_result_by_file(path, file, result_type)
  
  return results
  
def determine_test_type(path):
  
  filelist = os.listdir(path)
  
  for file in filelist:
    for file_pattern in IXIA_RESULT_HEADERS.keys():
    
      if re.search(file_pattern, file):
        return (file_pattern, file)
  
  return None
    
def parse_ixia_wml_recursion(wml):
  
  if len(wml) == 0:
    return convert(wml.text)
  
  ret = {}
  
  for child in wml:
    
    tag = child.tag
    parsed_child = parse_ixia_wml_recursion(child)
    
    if isinstance(parsed_child, dict) and child.text:
      text_node = child.text.strip()
      if text_node:
        parsed_child['TextNode'] = text_node
      
    if tag in ret:
      if not isinstance(ret[tag], list):
        ret[tag] = [ret[tag]]
      ret[tag].append(parsed_child)
    else:
      ret[tag] = parsed_child
    
  return ret
    
def xml_to_json(path, wml_file=None):

  ret = {}

  if not wml_file:
    print('I have to find the WML file by path...')
  
  filename = os.path.join(path, wml_file)
  
  wml = xml.etree.ElementTree.parse(filename).getroot()
  ret[wml.tag] = parse_ixia_wml_recursion(wml)
  
  return {wml_file[:-4]: ret}
    
def ixia_csv_to_json(path, csv=True, wml=True):
  
  # If windows, replace "/mnt/wifi_vol" with NAS drive directory
  if platform.system() == 'Windows':
    path = path.replace('/mnt/', '\\\\{}\\'.format(NAS_DRIVE_ADDRESS))
    path = path.replace('/', '\\')
  
  result_type = determine_test_type(path)
  
  if not result_type:
    raise ParserException.TestTypeNotFound('Test Type was not found')
  
  csv_results = parse_result_by_type(path, result_type) if csv else None
  wml_results = xml_to_json(path, result_type[1]) if wml else None
  
  result = {}
  
  if csv:
    result['csv'] = csv_results
  
  if wml:
    result['wml'] = wml_results
  
  return result

def main(args):
  
  path = args.path
  indent = args.indent
  csv = True
  wml = True
  
  if args.csv or args.wml:
    
    csv = bool(args.csv)
    wml = bool(args.wml)
  
  try:
    result = ixia_csv_to_json(path, csv, wml)
    
    if indent:
      result = json.dumps(result, indent=2)
    else:
      result = json.dumps(result)
      
    print(result)  
      
  except ParserException.All as e:
    print('PARSER|ERROR|{}'.format(str(e)))
    
if __name__ == '__main__':
  
  parser = argparse.ArgumentParser(
    description='Convert CSV and WML into JSON'
  )
  
  parser.add_argument(
    'path', metavar='/path/to/results', type=str,
    help='Result directory'
  )
  
  parser.add_argument(
    '--indent', 
    help='Indent the JSON output', 
    action='store_true'
  )
  
  parser.add_argument(
    '--wml', 
    help='Include the WML only', 
    action='store_true'
  )
  
  parser.add_argument(
    '--csv', 
    help='Include the CSV only', 
    action='store_true'
  )
  
  args = parser.parse_args()
  
  if args:
    main(args)
  