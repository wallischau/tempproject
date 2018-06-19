import random

class TclWriter:

    def __init__(self, result_dir, dut_company, dut_model, dut_firmware, **kwargs):
        self.result_dir = result_dir
        self.vendor_name = dut_company
        self.model_name = dut_model
        self.firmware = dut_firmware

        # card, ssid, ss come from keyword args
        self.cards = {}
        self.ssids = {}
        self.ss = {}

        # pull out all card, ssid, ss info from kwargs
        for key, value in kwargs.items():
            if key.startswith('card_'):
                self.cards[key] = value

            elif key.startswith('ssid_'):
                self.ssids[key] = value

            elif key.startswith('ss_'):
                self.ss[key] = value

    def build_tcl(self, in_file, out_file, type_name, testlist):
        # need the ip of the chassis. pull out of eth card
        ip = self.cards['card_eth'].split(':')[0]

        replacements = (
            # things we need to replace in the template
            ('card24ipaddress', self.cards.get('card_24')),
            ('card5ipaddress', self.cards.get('card_5')),
            ('cardethipaddress', self.cards.get('card_eth')),
            ('cardeth2ipaddress', self.cards.get('card_eth2')),
            ('cardeth2ipaddress', self.cards.get('card_eth3')),
            ('ssid24ssid', self.ssids.get('ssid_24')),
            ('ssid5ssid', self.ssids.get('ssid_5')),
            ('namevendorname', self.vendor_name.replace(' ','_')),
            ('modelvendormodel', self.model_name.replace(' ', '_')),
            ('firmwarevendorfirmware', self.firmware.replace(' ', '_')),
            ('logsdirectory', '[file join "%s" %s %s %s %s]' % (
                self.result_dir.replace('\\', '\\\\'),
                self.vendor_name.replace(' ','_'),
                self.model_name.replace(' ', '_'),
                self.firmware.replace(' ', '_'),
                type_name,
            )),
            ('testlist', ' '.join(testlist)),
            ('numOf24Antennas', self.ss.get('ss_24', 0)),
            ('numOf5Antennas', self.ss.get('ss_5', 0)),
            ('vw_server_names', ip)
        )

        file_r = None
        file_w = None

        try:
            # write the file
            file_r = open(in_file, 'r')
            file_w = open(out_file, 'w')
            for line in file_r:
                # write it line for line, replacing template items with proper values
                for search, repl, in replacements:
                    line = line.replace(search, str(repl))

                file_w.write(line)

        finally:
            if file_r:
                file_r.close()
            if file_w:
                file_w.close()
