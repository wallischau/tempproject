802.11ac Wave 2 Phase 2 Vendor Automation Scripts

    The PRD states multiple test cases that dig into a wide variety of technologies and implementations.
    Within this test suite, each of those test cases is represented with their own automation script. 
    The python wrapper will execute your desired inputs with the intention of standardization of all 
    testing automation for this initiative.

Prerequisites
    
    * TCL version 8.4 or equivalent
    * Python version 2.4.5.14 or equivalent

Installing
    
    * Unzip automation folder
    * Place Automation folder in a directory of your choosing. Note: This is where all test data and templates
    will be produced and data will be written to.

Running
    
    * Ensure connectivity to IxVeriwave chassis
    * Run main.py
        * Follow prompts
        * Navigate to Test_Logs and your desired chamber to view real-time logs
    * The first time running the script, you will be prompted for the location of IxVeriwave API.
        * This must be the location of the TOP LEVEL directory (the one containing "apps", "automation", "lib", and "shared" directories)
        * This should be the ABSOLUTE path to this directory appropriate for your OS (e.g. C:\... or /usr/lib/...)
        * If you need to change this later, you can edit the file config/user_settings.conf, or simply remove the file to be prompted again next time the script is run

Deployment

    Triple Play
        Due to a known issue with IxVeriwave not setting QoS setting correctly on clients, use the
        automation to create the wmls first. Then go into the directory of the test in question
        and manually change the QoS settings to the correct configuration and rerun.
    Near Far
        Due to a known issue with IxVeriwave management frames, turn the RSSI of the AP down to
        around -18dB. This will ensure that the Far client will connect and the test will run
        correctly.
    Multicast Video
        The WAN port on the DUT will be used for ethernet connections. The Ethernet card/port
        used by automation will be the "Ethernet 1" card specified in the CLI.
    Realworld QOE
        Due to a known issue with IxVeriwave not setting QoS setting correctly on clients, use the
        automation to create the wmls first. Then go into the directory of the test in question
        and manually change the QoS settings to the correct configuration and rerun.

Versioning
    
    3.0
    * overhauled old implementation for additional flexibility for future development
    * tcl files, test log files, and test result files are now saved in subdirectories of this directory, regardless of the current working directory
    * Added config file to save user inputs between test runs
    * Various test configuration changes

    3.1
    * added Multicast Video and Power Save tests
    * Triple Play - loads have been increased. Dual Band tests have been added.
    * now using one tcl per test config - template find/replace has changed
    * output.log files not longer saved. instead, tclsh process's stdout is written to the wrapper script's stdout. the only log written to disk is in the logs/ directory, which is cleared between executions of this script. be sure to save any logs you do not wish to lose to another location.

    3.2
    * added tests for Airtime Fairness Requirements (PRD section 4.8). Split into two test types
        * Mixed Clients (MC) - section 4.8.1. Tests that clients have equal access to the medium.
        * Reuse of Airtime (ROA) - sectino 4.8.2. Tests the AP's ability to schedult and reuse airtime

    3.3
    * updated for new 7.3.3 scripts as well as the 7.3.3 api

Authors
    Connor Thiret (Python)
    Taren McCullough, Joel Benitez (Tcl)
