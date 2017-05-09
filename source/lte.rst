LTE
=================

1.Basics
----------
At the beggining, you will see how to connect and use the LTE testbed. You'll also see how to develop and run a simple experiment where the LTE interface is properly configured and how to generate traffic between two nodes.

2.Prerequisties
-----------------------
*Accessing/Provisioning Resources*
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

| **Accessing a Resource at NITOS**
|
| Initially, you have to reserve a node at NITOS: :ref:`getting-slice`

| In order to use the LTE testbed resources offered by the NITOS facility, you will have to reserve one of the LTE eNBs and the nodes
  with LTE connectivity, offered by the testbed.
  
| There are a number of different LTE dongles available in the testbed, with different capabilities, but they roughly come down to the following configurations:
|
| 1. Dongles with IMSIs for the PLMNID 46099 (NITOS PLMN)
| 2. Dongles with IMSIs for the PLMNID 20398 (Default PLMN for OpenAirInterface - OAI)
|
| The available dongles in the testbed are the following:
|
| 1. Huawei E392, configurable with AT Commands
| 2. Huawei E3272, configurable with AT Commands
| 3. Huawei E3372, configurable with AT Commands
| 4. ZTE MF831, configurable with the ZTE REST interface
|
| Generally, the E392, E3272 and E3372 dongles support connecting to the network and direct bridging with the network interface available in the dongle (wwan0 interface).
| This means that the nodes can be configured to ping each other, or do downlink experiments directly on the network interface of the node.
|
| The nodes with such interface and the NITOS PLMN are (**node054, node058, node067, node074, node076, node077, node083, node084**), whereas with the OAI PLMN are (**node050, node052**).
|
| For the HiLink/ZTE nodes, you will be able to conect to the LTE network and generate traffic, but a NAT process is running on the LTE stick.
| In order to run downlink experiments, you will need to initiate traffic from the node (e.g. using dual test with iperf), whereas running experiments where traffic is exchanged between two nodes is not feasible with them.
|
#| The nodes with HiLink/ZTE interface and the NITOS PLMN are (**node057, node065, node069, node079, node085, node089, node092**), whereas with the OAI PLMN are (**node059, node063, node068, node071, node086**).
|
.. warning:: Always know what nodes you are reserving and what their capabilities are! You can check the characteristics of each dongle by expanding each "node" tab at the NITOS portal **http://nitos.inf.uth.gr**!

| Here is a detailed list with the types of dongles, configuration method, nodes and IMSIs that they have: 
|

  +----------------+-------------------+---------------+-----------------+
  | Testbed Node   | LTE Dongle Type   | Config Method | IMSI            |
  +================+===================+===============+=================+
  | node050        | HW - E392         | AT-Commands   | 208930000000001 |
  +----------------+-------------------+---------------+-----------------+
  | node052        | HW - E392         | AT-Commands   | 460990010001078 |
  +----------------+-------------------+---------------+-----------------+
  | node054        | HW - E3272        | AT-Commands   | 460990010001009 |
  +----------------+-------------------+---------------+-----------------+
  | node057        | HW - E3272        | AT-Commands   | 460990010001006 |
  +----------------+-------------------+---------------+-----------------+
  | node058        | HW - E3272        | AT-Commands   | 460990010001013 |
  +----------------+-------------------+---------------+-----------------+
  | node059        | ZTE - MF831       | ZTE-REST      | 208930000000003 |
  +----------------+-------------------+---------------+-----------------+
  | node063        | ZTE - MF831       | ZTE-REST      | 460990010001079 |
  +----------------+-------------------+---------------+-----------------+
  | node065        | HW - E3372        | AT-Commands   | 460990010001042 |
  +----------------+-------------------+---------------+-----------------+
  | node068        | HW - E3372        | AT-Commands   | 208930000000005 |
  +----------------+-------------------+---------------+-----------------+
  | node069        | HW - E3372        | AT-Commands   | 460990010001045 |
  +----------------+-------------------+---------------+-----------------+
  | node071        | HW - E3372        | AT-Commands   | 208930000000006 |
  +----------------+-------------------+---------------+-----------------+
  | node074        | HW - E3272        | AT-Commands   | 460990010001011 |
  +----------------+-------------------+---------------+-----------------+
  | node076        | HW - E3272        | AT-Commands   | 460990010001014 |
  +----------------+-------------------+---------------+-----------------+
  | node079        | HW - E3372        | AT-Commands   | 460990010001046 |
  +----------------+-------------------+---------------+-----------------+
  | node083        | HW - E3272        | AT-Commands   | 460990010001008 |
  +----------------+-------------------+---------------+-----------------+
  | node085        | HW - E3372        | AT-Commands   | 460990010001047 |
  +----------------+-------------------+---------------+-----------------+
  | node086        | HW - E3372        | AT-Commands   | 208930000000007 |
  +----------------+-------------------+---------------+-----------------+
  | node087        | HW - E3272        | AT-Commands   | 460990010001007 |
  +----------------+-------------------+---------------+-----------------+
  | node089        | HW - E3272        | AT-Commands   | 460990010001010 |
  +----------------+-------------------+---------------+-----------------+
  | node091        | HW - E3372        | AT-Commands   | 460990010001018 |
  +----------------+-------------------+---------------+-----------------+
  | node092        | HW - E3372        | AT-Commands   | 460990010001003 |
  +----------------+-------------------+---------------+-----------------+


| Reserving a node configured for using the OpenAirInterface PLMNID does not mean that you will not be able to connect it to the NITOS network. You will need to add the client to the EPC, and the dongle will connect as a "Roaming" client, or you can completely change the configurations of the EPC and Base Stations in order to provision this network. 
| If you need any help in setting up this process, please consult the NITlab team or raise a ticket at **http://repo.nitlab.inf.uth.gr/tickets**

| Reserving the eNBs will render rights to the experimenter to access the LTErf service of the NITOS facility, used to configure and setup the eNBs and the EPC at the experimenter's will.

| *After your reservation has started, login to Server.*
|

.. warning:: You have to connect to **NITOS Server 3 nitlab3.inf.uth.gr**!

.. warning:: This section of the documentation is based in OMF 5.4!

You can use your NITOS account to access the NITOS Server 3. Just open a secure shell and write:

.. code-block:: bash

   ssh slice_name@nitlab3.inf.uth.gr

:Example: *i.e syiordan@nitlab3.inf.uth.gr*

| **Provisioning a Resource at NITOS**
|
| Once you have logged in, you have to load the image **baseline_icarus_lte.ndz** on your reserved nodes. You can use the method described on :ref:`loading-omf` for instructions on how to load images on resources at NITOS. You can find `here <_images/NITOS_base_imgs.pdf>`_ all the available baseline images provided by NITlab.



3.Check which Base Station you are using
-----------------------------------------

In order to start experimenting with the LTE components in NITOS, you have first to find out which eNodeB you will be using. In general, node 1 is the indoor eNB and node 2 is the femtocell in the NITOS Outdoor deployment (currently offline for maintenance). Other entries might exist for test purposes with OAI.

In order to check the available eNodeBs and their IP addresses, you have to send the following command to the service:

.. code-block:: bash

	wget -qO- http://lterf:5054/lterf/bs/list

which should reply something like the following:

.. code-block:: bash

	AP Number : 1 | Type of BS : ipaccess | Ip : 192.168.200.1 | Management Iterface : eth0
	AP Number : 2 | Type of BS : ipaccess | Ip : 10.64.44.52 | Management Iterface : eth1
	AP Number : 3 | Type of BS : oai | Ip : 10.64.44.56 | Management Iterface : eth1
 
The Indoor testbed is using the 192.168.200.0/24 network for the network between the eNodeB and the EPC network. For the indoor testbed, AP number = 1 should be used for altering the base station components, by appending node=1 to all the commands sent to the LTErf service.


4.Restart Base Station
----------------------------------
As a first step, you should turn on the base station. By default, the base station is turned off when not used. To do so, issue the following command:

.. code-block:: bash

	omf tell -a on -t e_node_b_001


It is important to setup the eNBs to the default settings, as their configuration might have been altered from their normal behavior by any previous experimenter. In order to setup the eNB to the default settings you issue the following commands:

.. code-block:: bash

	wget -qO- 'http://lterf:5054/lterf/bs/default?node=1'

Since not all of the changes take place immediately, you will need to restart the eNB for some of the changes to take effect. You can restart the eNB with the following command:

.. code-block:: bash

	wget -qO- 'http://lterf:5054/lterf/bs/restart?node=1'

Which will return you the message:

.. code-block:: bash

	... has been restarted

5.Restart EPC
--------------

In order to setup the EPC to the default settings you issue the following command:

.. code-block:: bash

	wget -qO- 'http://lterf:5054/lterf/epc/default'

.. warning:: As NITOS is currently upgrading to control multiple remote femtocells, please issue the following command to switch using the indoor testbed before restarting it. You can do this with the following command:

	  wget -qO- http://lterf:5054/lterf/epc/config/testbed?name=indoor

You will need to restart the EPC twice in order for some of the changes to take effect. You can restart the EPC with the following command:

.. code-block:: bash

	wget -qO- 'http://lterf:5054/lterf/epc/restart'

Which will return you the message:

.. code-block:: bash

	EPC network has been restarted

There are some cases where the EPC is restarted but not all of the EPC compoenents are interconnected. You should check if the EPC is working by sending the following command:

.. code-block:: bash

	wget -qO- "http://lterf:5054/lterf/epc/get?function=getSystemStatus" | xml_pp

If everything is working correctly, you should see an output where all the components report connected. If at least one of the components SGW, HSS, PGW is not connected, try restarting the EPC again. 

6.Check if all components are connected
---------------------------------------

In order to check if the eNB is connected to EPC after the restart you will have to type the following command:

.. code-block:: bash
		 
	wget -qO- 'http://lterf:5054/lterf/epc/get?function=getSystemStatus&args=MME,S1AP_INTERFACE,192.168.200.1' | xml_pp

Which will return you the message:

.. code-block:: xml

		<STATUS>
			<EPC>
				<getSystemStatus>
					<instance id="1">
						<componentType>MME</componentType>
						<currentStatus>CONNECTED</currentStatus>
						<lastUpdated>2015-05-21T13:49:52Z</lastUpdated>
						<statusType>S1AP_INTERFACE</statusType>
						<statusIdentifier>192.168.200.1</statusIdentifier>
						<severityLevel>0</severityLevel>
					 </instance>
				 </getSystemStatus>
			</EPC>
		</STATUS>
																																						  
You can see the parameters that can be changed and the LTERF service commands and their syntax by invoking the following command:

.. code-block:: bash

	wget -qO- 'http://lterf:5054/lterf/' | xml_pp 

It returns an XML tree with the complete list of LTERF commands. Since the eNB and EPC are back to their default settings, you can start experimenting with the LTE testbed.

7.Connect to the LTE network
----------------------------
Using AT commands

Login to the node0xx with the following command:

.. code-block:: bash

	ssh root@node0xx

You will have to first turn the LTE dongle on. You can do this by running the following command on the node console in order to switch it on and connect it to the available networks (NITOS/EURECOM):

.. code-block:: bash

	root@node0XX:~# lte_dongle -o -v -c NITOS

The "-o" argument can be used to turn the USB on/off, while the -v is used for the verbose output at the console. The "-c" argument is instructing the node to connect to the provided network (currently supported are NITOS/EURECOM).  You can use the "-h" argument for a complete list of the available commands.

Once the dongle is connected, you can see it listed with the lsusb command. The output should look like the following:

.. code-block:: bash

	root@node0XX:~# lsusb | grep Huawei
	Bus 001 Device 008: ID 12d1:1506 Huawei Technologies Co., Ltd. E398 LTE/UMTS/GSM Modem/Networkcard

And a wwan0 device should be attached on the node for the E392/E3272 dongles, or an eth2 for the E3372 dongles and a usb0 device for the ZTE dongles.
If you are able to ping the PGW IP (10.0.3.1 for the NITOS network), you can skip the configuration over the serial port, as it is provided for debugging purposes

.. warning:: Multiple restarts of the dongle might cause the huawei_cdc_ncm driver not to attach correctly and therefore no wwan0 interface will be available. In such a case, reboot the node.

Next step is to connect to the LTE dongle using the minicom application. The port that can be used to setup the LTE interface depends on the USB LTE stick model. In order to check the LTE stick model number, connect with minicom over the port /dev/ttyUSB0 (or USB1, depends on the LTE Dongle type (for more information see the list below)) and run the following commands:

.. code-block:: bash

	root@node0XX:~# minicom -D /dev/ttyUSB0
	ATE
	ATI
	
The "ATE" command will enable the local-echo to the output console, so that you can see what you write, and the "ATI" command will return to you some information about the LTE dongle.

The following dongles are available in NITOS, with the respective ports that can be used for configuring them:

LTE Dongle type 	--> 	Port used for configuration
	Huawei E398   	-->	/dev/ttyUSB0

	Huawei E3272    --> 	/dev/ttyUSB1

	Huawei E3372    -->  	/dev/ttyUSB0
									
In order to configure it exit minicom and restart it using the port as an argument

.. code-block:: bash

	root@node0XX:~# minicom -D PORT

In order to turn on the air interface:

.. code-block:: bash

	at+cfun=1

Add a new APN and activate the PDP context:

.. code-block:: bash

	at+cops=1,2,"46099"  # only for the E398 LTE sticks

	at+cgdcont=1,"IP","default"

	at^ndisdup=1,1,"default"

	at+cgatt=1
	
	at+cgact=1,1
	
	at^dhcp?

If the last command outputs a string with numbers in HEX, the dongle should have received the IP address from the EPC DHCP network. You can now exit from minicom and configure the wwan0 interface with the ip 10.0.3.xx. Generally, the last digits for the IP address are the same as the node ID (e.g. node077 gets the 10.0.3.77/24 IP address).

If at^dhcp is giving you an error or just reports "OK", then the modem is not in a state to connect. To do so, bring down the air interface and re-activate it by using the next set of commands:

.. code-block:: bash

	AT+CFUN=0

	AT+CFUN=1

You can now wait for the modem to report

.. code-block:: bash

	^SRVST=2

If it is in such serving state, the modem can connect to the network, so you can re-send the previous set of commands for adding the APN and connecting to the network.

Once AT^DHCP is reporting you the IP address received from the LTE network, you can setup the network interface. To do so, exit minicom (Ctrl+a followed by Ctrl+x will show you the exit window) and send the following command from the node console:

.. code-block:: bash

	root@node0XX:~# dhclient wwan0

Once the dhclient command exits, the wwan0 interface should have an IP address. However, the system by default is assigning automatically a subnet mask equal to /30. You can overcome this by sending the following commands:

.. code-block:: bash

	root@node0XX:~# ifconfig wwan0 netmask 255.255.255.0 -arp up

For the E398 dongles, no DHCP server is running on the dongle. Try setting directly the IP address that the EPC is sending with ifconfig.

Now you should be able to ping the PDN-GW component of the EPC network (the default configuration uses the 10.0.3.1 IP address) or any other LTE client connected to the network. 


The LTE interfaces can get in an IDLE state when you do not send any traffic over the network. If this is something that you do not want, you can have a ping running in the background, pinging the EPC network.


8.Performing Downlink experiments
---------------------------------

If you decide to keep the LTE default configuration, performing DL/UL experiments can be a lttle tricky. The overall architecture of the NITOS LTE network is based on the 192.168.200.0/24 network for the communication between femtocells and the EPC network. This network, is also attached to each node's experimental network.

In order to do DL/UL experiments involving the wired experimental network, you will need a testbed node that has an IP address from the 192.168.200.0/24 network configured for the experimental interface. To do so, log in on a node and send the following commands:

.. code-block:: bash

	root@node0XX:~# ifconfig eth1 192.168.200.XX/24 up
	root@node0XX:~# route add -net 10.0.3.0/24 gw 192.168.200.200

Now you have configured the receiving node to send and receive traffic to/from the LTE network by using the EPC (192.168.200.200) as the default gateway.

You will have to configure routing on the LTE node as well, as follows:

.. code-block:: bash

	root@node0XX:~# route add -net 192.168.200.0/24 gw 10.0.3.1
	
Now the LTE node will use the EPC PDN-GW as the default gateway for sending traffic to the 192.168.200.0/24 network. You should be able to ping each side and do DL/UL experiments with any available traffic generator.


9.Other LTErf configurations
----------------------------

The LTErf service is used for configuring the base stations, EPC networks and datapath configurations in the LTE network. The service is supporting several configurations. All the available services can be retrieved from the LTErf service using the following command:

.. code-block:: bash

	wget -qO- "http://lterf:5054/lterf/" | xml_pp

In the following articles a complete list of the possible configurations per building block are illustrated:

* |LTEBS|

.. |LTEBS| raw:: html

	<a href="http://nitlab.inf.uth.gr/NITlab_old/index.php/testbed/lte-experimentation/lte-omf-am-service/33-testbed/lte-documentation/497-lte-base-station-control-service-documentation" target="_blank">LTE Base Station Control Service Documentation</a>

* |LTEEPC|

.. |LTEEPC| raw:: html

	<a href="http://nitlab.inf.uth.gr/NITlab_old/index.php/testbed/lte-experimentation/lte-omf-am-service/33-testbed/lte-documentation/498-lte-epc-control-service-documentation" target="_blank">LTE EPC Control Service Documentation</a>

* |LTEData|

.. |LTEData| raw:: html

	<a href="http://nitlab.inf.uth.gr/NITlab_old/index.php/testbed/lte-experimentation/lte-omf-am-service/33-testbed/lte-documentation/499-lte-datapath-control-service-documentation" target="_blank">LTE Datapath Control Service Documentation</a>

You can also check out the rest of the available LTE tutorials.

10.Using OMF
------------

Instead of using the AT-Commands to setup the LTE dongle, you can use the OMF to automatically setup the air interface for you. If you are not familiar with OMF, please refer to the OMF-related pages in this site.

An example of an OMF experiment used to generate traffic in the NITOS testbed, using the LTE enabled nodes is the following:

.. code-block:: bash

	defGroup("Sender","omf.nitos.node066"){ |node|
		node.addApplication("iperf-5.4", :id => 'iperf') {|app|
			app.setProperty('port', 5200)
			app.setProperty('bandwidth',"100000000")
			app.setProperty('udp',true)
			app.setProperty('time', 100)
			app.setProperty('client', "10.0.3.77")
			app.setProperty('reportstyle', 'o')
			app.setProperty('interval', '1')
			app.measure('transfer', :samples=>1)
			app.measure('losses', :samples=>1)
	
		}
		#Configure LTE dongle
		node.net.l0.radio = "on"
		node.net.l0.apn = "default"
		node.net.l0.attach = 1
		node.net.l0.connect = "default" #Connect and set up wwan interface

	}
	defGroup("Receiver","omf.nitos.node077"){ |node|
		node.addApplication("iperf-5.4", :id => 'iperf') {|app|
			app.setProperty('port', 5200)
			app.setProperty('server', true)
			app.setProperty('udp',true)
			app.setProperty('reportstyle', 'o')
			app.setProperty('interval', '1')
			app.measure('transfer', :samples=>1)
			app.measure('losses', :samples=>1)
	}
		#Configure LTE dongle
		node.net.l0.radio = "on"
		node.net.l0.apn = "default"
		node.net.l0.attach = 1
		node.net.l0.connect = "default" #Connect and set up wwan interface
	}
	onEvent(:ALL_UP_AND_INSTALLED){ |event|
	 	info "Configuring the LTE dongles"
		wait 80
		info "Starting iperf server-client"
		group("Receiver").startApplication('iperf')
		group("Sender").startApplication('iperf')
		wait 60
		info "Stoppping all applications"
		group("Receiver").stopApplications
		group("Sender").stopApplications
		Experiment.done
	}

You can refer to a complete description of the experiment to the following video:

.. raw:: html
	
	<iframe width="560" height="315" src="https://www.youtube.com/embed/RZL7_SakjsU" frameborder="0" allowfullscreen></iframe>

11.Other Tutorials
------------------

Begin experimenting with LTE equipment

Description of the procedure that a user has to follow as soon as a reservation slot has started. We are using the OMF framework and the FLEX "LTErf" service to load default settings to the LTE base station and restart it.

.. raw:: html

	<iframe width="560" height="315" src="https://www.youtube.com/embed/1nkXdJY982o" frameborder="0" allowfullscreen></iframe>


Changing MCS profiles and measuring throughput
An experiment demonstrating how an experimenter can change the MCS profile used by an LTE base station and observe differences in the achieved throughput. We demonstrate the usage of the FLEX "LTErf" service in the NITOS testbed.

.. raw:: html

	<iframe width="560" height="315" src="https://www.youtube.com/embed/nai84dQ9QJA" frameborder="0" allowfullscreen></iframe>






Federating WiMAX and LTE testbeds with an SDN approach
Demonstrating the federation capabilities of the LTErf service between the NITOS WiMAX and NITOS LTE testbeds

.. raw:: html

	<iframe width="560" height="315" src="https://www.youtube.com/embed/zZDESevkWHU" frameborder="0" allowfullscreen></iframe>
