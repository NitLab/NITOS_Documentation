Intelligent Transport System (ITS)
=====================================

The following guide sets up the reserved nodes to operate with the ITS stack components.

Once you create a slice and reserve some testbed nodes in NITOS, :ref:`getting-slice`, you can load the **geonet.ndz** image on the testbed nodes.

.. note:: The geonet.ndz image is compatible with the nodes which have a USRP attached and it is based in the natty Ubuntu distribution. You can filter for USRP nodes in the Reservation tool of `NITOS portal <http://nitos.inf.uth.gr>`_, or check the topology images in order to reserve the appropriate nodes. If you need to install any new packages from the Ubuntu repositories you might consider switching the sources.list file to the old-releases repository.

Once the nodes are loaded with the image, the applications needed to be executed in order to enable the ITS stack support are:

	* The geonetwrapper application (located in the /root folder of the node) which provides the BTP and GeoNetworking protocol
	* The fake_facility application (located in the /root folder of the node), which generates CAM messages and delivers them to the geonetwrapper application
	* The fake_poti application (located in the /root folder of the node), in case that the mobility emulation environment needs to be enabled

For the mobility emulation environment, the gpsfake application needs to be started, in order to feed the geonetwrapper daemon with the appropriate location data. Gpsfake uses as an input file the gps.txt file (located at the /root directory of the node), which contains sample NMEA sentences, from an object moving at the Red Sea.

The experimenter might also provide his/her own NMEA sentences for the experiment.

The geonetwrapper uses the gnconf.txt file as a configuration file. The experimenter might consider changing the parameters of the gnconf file with new vales for the GN_ADDR (the address used for the GeoNetworking protocol) or the station type/subtype, location if GPS is absent, etc.

The provided facility layer has an API to interact with UDP port 1504 with the upper application layer. Therefore, if any new applications needed to be executed over the ITS stack, you need to point them using the localhost:1504 UDP port as their outgoing interface.

More information on the architecture is provided in the following publication `here <http://nitlab.inf.uth.gr/NITlab/index.php/about/publications.html?id=450>`_.

