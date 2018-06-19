IXIA_RESULT_HEADERS = {
  
  # Packet Loss test
  "^(test_)?unicast_packet_loss.wml": {
  
    # CSV result file
    "^Results_unicast_packet_loss.csv": {
      "results@@^Frame Size, ILOAD": []
    }
    
  },
  
  # Rate versus Range test
  "^(test_)?rate_vs_range_s2.wml": {
  
    # CSV result file
    "^Results_rate_vs_range_s2.csv": {
      "results@@^Frame Size, Total ILOAD": []
    }
    
  },
  
  # Max Client
  "^(test_)?unicast_max_client_capacity.wml": {
  
    # CSV result file
    "^Results_unicast_maximum_client_capacity.csv": {
      "results@@^Frame Size, ILOAD": []
    }
    
  },
  
  # UDP Throughput
  "^(test_)?unicast_unidirectional_throughput.wml": {
  
    # CSV result files(for both unidirectional and bidirectional)
    "^(Results_unicast_throughput|BidirResults).csv": {
      "results@@^Frame Size, Trial": []
    }
    
  },
  
  # TCP Goodput
  "^tcp_goodput.wml": {
  
    # CSV result file
    "^Results_tcp_goodput.csv": {
      
      # The top-most result table
      "results@@^Trial, TCP MSS": [],
      
      "runs@@^TCP MSS, (?P<mss>[0-9]+), TCP Payload Size, (?P<payload>[0-9]+), Trial, (?P<trial>[0-9]+)": {
        "data@@^src_port, src_client": []
      }
      
    }
    
  },
  
  # Latency 
  "^unicast_latency.wml": {
  
    # CSV result file
    "^Results_unicast_latency.csv": {
      "results@@^Frame Size, ILOAD": []
    }
    
  },
  
  # Mixed Client / Triple Play 
  "^(test_)?wimix_script.wml": {
  
    # CSV "detailed" result file. This is needed to map client names into 
    # configurations because we're not given client names or any unique 
    # identifiers in the regular results files. The assumption that the 
    # clients are in order is false- client order is random
    "^Detailed_Results_WaveQoE_[0-9]+_clients.csv": {
      "results@@^Flow Name, src_port": []
    },
    
    "^Results_WaveQoE_over_time_[0-9]+_clients.csv": {
      "results@@^Flow Name, Metric": []
    },
  
    # CSV result file
    "^Results_WaveQoE_[0-9]+_clients.csv": {
    
      "trials@@^Trial (?P<trial>[0-9]+).+for (?P<clients>[0-9]+) clients per AP\/Port$": {
        "table1@@^Type, Flow Direction": [],
        "table2@@^Flow Type, Num Flows": [],
        "table3@@^Flow Type, SLA Requirement": [],
        "table4@@^Client Type, Number of Clients": []
      }
      
    }
    
  }
  
}
