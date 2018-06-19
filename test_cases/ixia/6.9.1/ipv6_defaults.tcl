# Set the defaults(2.4GHz IPv6 off, 5GHz IPv6 on)
if {![info exists ipv6_24]} {set ipv6_24 0}
if {![info exists ipv6_5]} {set ipv6_5 1}
if {$ipv6_24 == 1 && $ipv6_5 == 1} {set ipv6_db 1} else {set ipv6_db 0}

if {$ipv6_24 == 1} {set ipv6_24_dhcp Disable} else {set ipv6_24_dhcp Enable}
if {$ipv6_5 == 1} {set ipv6_5_dhcp Disable} else {set ipv6_5_dhcp Enable}
if {$ipv6_db == 1} {set ipv6_db_dhcp Disable} else {set ipv6_db_dhcp Disable}

if {$ipv6_24 == 1} {set ipv6_24_dhcp6 Enable} else {set ipv6_24_dhcp6 Disable}
if {$ipv6_5 == 1} {set ipv6_5_dhcp6 Enable} else {set ipv6_5_dhcp6 Disable}
if {$ipv6_db == 1} {set ipv6_db_dhcp6 Enable} else {set ipv6_db_dhcp6 Disable}

# IPv6 needs 88 minimum frame size
if {$ipv6_24 == 1} {set ipv6_24_min_frame_size 88} else {set ipv6_24_min_frame_size 64}
if {$ipv6_5 == 1} {set ipv6_5_min_frame_size 88} else {set ipv6_5_min_frame_size 64}
# If at least one band is IPv6, then we'll set the frame size to 88
if {$ipv6_24 == 1 || $ipv6_5 == 1} {set ipv6_db_min_frame_size 88} else {set ipv6_db_min_frame_size 64}

proc ipv6_interface {obj band} {
    global $obj
    
    global ipv6_24 ipv6_24_dhcp ipv6_24_dhcp6
    global ipv6_5 ipv6_5_dhcp ipv6_5_dhcp6

    if {$band == 5} {
        set ipv6 $ipv6_5
        set dhcp $ipv6_5_dhcp
        set dhcp6 $ipv6_5_dhcp6
    } else {
        set ipv6 $ipv6_24
        set dhcp $ipv6_24_dhcp
        set dhcp6 $ipv6_24_dhcp6
    }    
    
    # Set these flags accordingly
    keylset $obj Dhcp $dhcp
    keylset $obj Dhcpv6 $dhcp6
    # keylset $obj EnableIpv6 $ipv6
    keylset $obj Ipv6Flag $ipv6
    keylset $obj Ipv6PrefFlag $ipv6
    
    # Fetch real values
    
    # In case keylget fails
    set gateway 10.0.0.1
    set base_ip 10.0.0.10
    
    keylget $obj Gateway gateway
    keylget $obj BaseIp base_ip
    # If Gateway exists, we now have Gateway
    # If BaseIp exists, we now have BaseIp
    
    keylget $obj _original_gateway gateway
    keylget $obj _original_base_ip base_ip
    
    # At this point, we have the original Gateway and real BaseIp
    
    if {$ipv6 == 1} {
        
        # save the original values
        keylset $obj _original_gateway $gateway
        keylset $obj _original_base_ip $base_ip
        
        # i.e. 192.168.[xxx.xxx]
        set newbaseip [string range $base_ip 8 end]
        
        # set gateway 10.0.0.1
        # set base_ip 10.0.$newbaseip
        
    }
        
    keylset $obj Gateway $gateway
    keylset $obj BaseIp $base_ip
}
