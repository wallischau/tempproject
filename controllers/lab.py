###############################
# LAB EQUIPMENT CLASS IMPORTS #
###############################
from ata import ATA
from chamber import Chamber
from controller import Controller
from dut.ap import AP
from mobile import MobileClient
from power import PowerController

################
# MISC IMPORTS #
################
import json
import os
import sys

class Lab(Controller):

  def __init__(self, config):
    Controller.__init__(self)

    self.log.debug("[__init__]: Initializing Lab...")

    self.chambers = []
    self.equipment = []
       
    # Initialize the Lab 
    self.config(config)

  def config(self, config):
    try:
      self.log.debug("[config]: Configuring Lab...")
      dict_config = None

      # Support either JSON file or JSON string input
      if os.path.isfile(config):
        self.log.debug('[config]: Found {0}'.format(config))
        with open(config) as json_file:
          dict_config = json.load(json_file)
      else:
        self.log.debug('[config]: Processing JSON as string...\n{0}'.format(config))
        dict_config = json.loads(config)
            
        self.log.info("*** LAB CONFIG ***")
        self.log.info(json.dumps(dict_config, indent=2))

      if not dict_config:
        self.log.error('[Lab::config]: No configuration generated!')
        sys.exit(1)      

      # Parse config parts from full configa
      for key, config_item in dict_config.items():
        self.log.debug('config_item: \n{0}\n'.format(config_item))
     
      self.log.debug('CHAMBERS: \n{0}'.format(dict_config['chambers']))
 
      ############
      # CHAMBERS #
      ############
      for chamber in dict_config['chambers']:
        box = Chamber(chamber['label'])

        for router in chamber['routers']:
          self.log.debug('Found 1 AP')
          ap = AP(chamber['label'], router['make'], router['model'])
          box.routers.append(ap)

        box.chassis = chamber['chassis']
        box.card_5GHz = chamber['5GHz_card']
        box.port_5GHz = chamber['5GHz_port']

        self.chambers.append(box)

      #######################
      # IXIA TEST EQUIPMENT #
      #######################
      for equip in dict_config['ixia_equipment']:

        #######
        # ATA #
        #######
        if equip['type'] == 'ata':
          self.log.debug('Found 1 ATA')
          ata = ATA(equip['host'])
          self.ata = ata

        #############
        # IxChariot #
        #############
        if equip['type'] == 'ix_chariot':
          self.log.debug('Found 1 IxChariot')

      #############
      # OCTOSCOPE #
      #############
      for equip in dict_config['octo_equipment']:

        ########
        # iGen #
        ########
        if equip['type'] == 'igens':
          self.log.debug('Found 1 iGen')

        #######
        # PAL #
        #######
        if equip['type'] == 'pal':
          self.log.debug('Found 1 PAL')

        ##################
        # QuadAttenuator #
        ##################
        if equip['type'] == 'quad_atten':
          self.log.debug('Found 1 QuadAtten')

    except Exception as ex:
      self.log.error('Exception [Lab::config]: {0}'.format(ex))
      sys.exit(1)

  def get_lab_info(self):
    try:
      lab_info = ''
      for chamber in self.chambers:
        lab_info = '{0}*** Chamber {1} ***\n'.format(lab_info, chamber.name)
            
        for ap in chamber.ap:
          lab_info = '{0}AP: {1} {2}'.format(lab_info, ap.make, ap.model)

        for power in chamber.power:
          lab_info = '{0}Power: {1}'.format(lab_info, 'Undefined')

      return lab_info
    except Exception as ex:
      self.log.error('Exception [Lab::get_lab_info]: {0}'.format(ex))
      sys.exit(1)

