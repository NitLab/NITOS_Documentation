OpenFlow
=========

NITOS facility provides remote access to OpenFlow switches, enabling the user to create an OpenFlow slice, related to an experiment slice that has already available. The OpenFlow slice is implemented by the FlowVisor, a Stanford's software tool that creates slices on the OpenFlow switches, enabling the parallel access to them by separate users. 

.. image:: _static/openflow_arch.png

As you have already experienced, the NITOS users have to create their own slices for their experimentation. These slices include multiple resources, reserved by them for a specific time interval. Along with the reservation of the NITOS nodes, the related ports of the OpenFlow switches connecting these nodes are also included in their experimentation slice. As soon as the experimenter reserves NITOS nodes  he can observe that their eth1 interfaces are connected to a virtual OpenFlow switch. This virtual OpenFlow switch is behaving as a physical OpenFlow switch, connecting exclusively the nodes reserved by the experimenter.
The virtual switch of each slice is configurable regarding the IP address and TCP port of its OpenFlow controller. You can raise your OpenFlow controller in any host machine you want, since you have previously configured your OpenFlow settings in the corresponding tool of the NITOS portal. More specifically, the only configuration that needs to be made is to set the public IP address and the TCP port of your controller. In case that you want to use our FlowVisor server machine (at 83.212.32.137) as host of your OpenFlow controller, you are able to connect to the FlowVisor server through ssh, using the same ssh-keys that you use to connect to NITOS. In this case, the IP address given to our OpenFlow settings tool should be 127.0.0.1 and the port could be whichever you want.

