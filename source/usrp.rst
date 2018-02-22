USRP
=====================================

NITlab developed a |sdr| testbed that consists of 18 Universal Software Radio Peripheral (USRP) devices attached to the NITOS wireless nodes. USRPs allow the researcher to program a number of physical layer features (e.g. modulation), thereby enabling dedicated PHY layer or cross-layer research.

.. |sdr| raw:: html

	<a href="https://nitlab.inf.uth.gr/NITlab/nitos/sdr" target="_blank">Software Defined Radio (SDR)</a>


Initially, you have to reserve a node which features a USRP device.
Here is a detailed list with the types of USRPs, nodes and types of connection that they have:


  +----------------+-------------+---------------------+
  | Testbed Node   | USRP Type   | Connnection Type    |
  +================+=============+=====================+
  | node052        | N210        | ETHERNET            |
  +----------------+-------------+---------------------+
  | node055        | B210        | USB 3.0             |
  +----------------+-------------+---------------------+
  | node056        | B210        | USB 3.0             |
  +----------------+-------------+---------------------+
  | node059        | B210        | USB 3.0             |
  +----------------+-------------+---------------------+
  | node060        | B210        | USB 3.0             |
  +----------------+-------------+---------------------+
  | node064        | N210        | ETHERNET            |
  +----------------+-------------+---------------------+
  | node067        | B210        | USB 3.0             |
  +----------------+-------------+---------------------+
  | node068        | B210        | USB 3.0             |
  +----------------+-------------+---------------------+
  | node071        | B210        | USB 3.0             |
  +----------------+-------------+---------------------+
  | node072        | B210        | USB 3.0             |
  +----------------+-------------+---------------------+
  | node080        | N210        | ETHERNET            |
  +----------------+-------------+---------------------+
   
Then you can start developing your work/experiments based on the image baseline_usrp.ndz

.. code-block:: bash

  omf load -i baseline_usrp.ndz -t node0XX

In order to check the status of the USRP, login to the node0XX.
If the node features a **USRP N210** then setup the eth1 interface:

.. code-block:: bash

  ifconfig eth1 192.168.10.1/24 up

and then run the following command:

.. code-block:: bash

  uhd_usrp_probe

If the node features a **USRP B210** then run the following commands:

.. code-block:: bash

  usrp_status -a off
  usrp_status -a on
  uhd_usrp_probe
