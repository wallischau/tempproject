import React from 'react';

import './style.css'

class Terminal extends React.Component {
  
  constructor(props) {
    
    super(props);

    if (props.chamber) {
      
      window.socket.emit('get-test-output', props.chamber, true);
      window.socket.on('get-test-output', this.onData.bind(this));
      
    }
    
    this.tty = {
      "color": '#ccc', 
      "background": '#000', 
      "bright": 0,
      "hcursor": 0
    };
    
    this.state = {
      "active": false,
      "lines": [],
      "buf": "",
    };
    
  }
  
  componentWillUnmount() {
    window.socket.emit('get-test-output', this.props.chamber, false);
    window.socket.off('get-test-output');
  }
  
  addTTYBuffer(buf) {
    
    //
    // Adds a single tty chunk with a color attribute
    //
    
    let tty = this.tty;  
    let color = tty.color;
    let background = tty.background;
    let bright = tty.bright;
    
    if (bright) {
      color = color.replace(/c/gi, 'f');
    }
    
    return `<font style="background: ${background}; color: ${color}">` + buf + `</font>`;
    
  }
  
  setTTYColor(colors) {
    
    //
    // Sets current TTY color
    //
    
    let tty = this.tty;
    
    colors.forEach( color => {
      if (color === 1) {
        tty.bright = 1;
      } else if (color === 30) {
        tty.color = '#000';
      } else if (color === 31) {
        tty.color = '#c00';
      } else if (color === 32) {
        tty.color = '#0c0';
      } else if (color === 33) {
        tty.color = '#cc0';
      } else if (color === 34) {
        tty.color = '#00c';
      } else if (color === 35) {
        tty.color = '#c0c';
      } else if (color === 36) {
        tty.color = '#0cc';
      } else if (color === 37) {
        tty.color = '#ccc';
      } else if (color === 0) {
        tty.color = '#ccc';
        tty.background = '#000';
        tty.bright = 0;
      }
    });
    
  }
  
  parseTTYColors(buf) {
    
    //
    // Parses and returns a parsed version of "buf" with HTML colors
    //
    
    let htmlbuf = '';
    
    // while(buf.includes('\x1b[')) {
      
    //   let start = buf.indexOf('\x1b[');
    //   let end = 0;
    //   let colors = null;
      
    //   // console.log(buf, start);
    //   htmlbuf += this.addTTYBuffer(buf.substr(0, start));
    //   buf = buf.substr(start);
      
    //   start = 0;
    //   end = buf.indexOf('m');
    //   if (end === -1) {
    //     break;
    //   }
      
    //   colors = buf.substr(start, end + 1);
    //   colors = colors.substr(2, end - 2);
    //   colors = colors.split(';');
    //   buf = buf.substr(end + 1);
      
    //   this.setTTYColor(colors);
    // }
    
    // if (buf.length) {
    //   // Add remaining buffer. Should keep color
    //   htmlbuf += this.addTTYBuffer(buf);
    // }

    // Remove all ANSI colors and styles
    let textOnly = buf.replace(
      /[\u001b\u009b][[()#;?]*(?:[0-9]{1,4}(?:;[0-9]{0,4})*)?[0-9A-ORZcf-nqry=><]/g,
      ''
    );

    htmlbuf += textOnly;
    
    return htmlbuf;
    
  }
  
  insertTTYBuffer(oldBuf, newBuf) {
    
    //
    // Returns a new buffer, dependent on tty cursor position
    //
    
    let tty = this.tty;
    let hcursor = tty.hcursor;
    
    let slice1 = oldBuf.substr(0, hcursor);
    let slice2 = oldBuf.substr(hcursor + newBuf.length);
    let result = slice1 + newBuf + slice2;
    
    tty.hcursor += newBuf.length;
    
    return result;
  }
  
  parseData(newState, incomingBuf) {
    
    //
    // Parses WebSocket data
    //
    
    let buf = newState.buf;
    let lines = newState.lines;
    
    while(incomingBuf.includes('\r') || incomingBuf.includes('\n')) {
      
      let start = incomingBuf.search(/\r|\n/);
      let cmd = incomingBuf[start];
      
      if (start) {
        buf = this.insertTTYBuffer(buf, incomingBuf.substr(0, start));
      }
      
      incomingBuf = incomingBuf.substr(start + 1);
      
      if (cmd === '\r') {
        this.tty.hcursor = 0;
      } else if (cmd === '\n') {
        lines.push( this.parseTTYColors(buf) );
        buf = '';
        this.tty.hcursor = 0;
      }
      
    }
    
    newState.buf = this.insertTTYBuffer(buf, incomingBuf);
    
  }
  
  onData(data) {
    
    //
    // Websocket receiver
    //
    // This is the function that will be used to receive data from the 
    // SocketIO platform
    //
    // The data should look like:
    // data = {
    //   "active": <true/false>,
    //   "stdout": "text stream"
    // }
    //
    
    let active = data.active;
    let buf = data.stdout;
    
    this.setState((prevState, props) => {
      
      let newState = Object.assign(prevState, {
        "active": active
      });
      
      this.parseData(newState, buf);
      
      return newState;
      
    });
    
  }
  
  scrollToBottom() {
    
    //
    // "scrollIntoView" is an HTMLElement method
    //
    this.messagesEnd.scrollIntoView({ behavior: "smooth" });
    
  }
  
  componentDidMount() {
    this.scrollToBottom();
  }

  componentDidUpdate() {
    this.scrollToBottom();
  }
  
  render() {
    return (
      <div>
        <pre className="console-window">
          {
            this.state.lines.map((line, index) => 
              (
                <div  key={index}>{line}
                </div>
              )
            )
          }
          {
            <span>{this.parseTTYColors(this.state.buf)}
            </span>
          }
          {
            this.state.active && (<span className="cursor">&nbsp;</span>)
          }
          <span ref={(el) => { this.messagesEnd = el; }}></span>
        </pre>
      </div>
    );
  }
  
}

export default Terminal;
