Wi-Fi
=================

1.Basics
---------
This simple tutorial presents all the basic steps to develop, run, and access the result of a wireless network experiment with OMF 6.

**Experiment Scenario**

* This experiment involves two resources of type PC with wireless capabilities: Node 1 and Node 2
* Node 1 is running a simple UDP traffic generator application (OTG2)
* Node 2 is running a simple traffic receiver application (OTR2)
* Node 1 is the “Sender” and will generate and send traffic to the “Receiver” node 2, over a wireless (IEEE 802.11g) channel.
* OTG and OTR are OML-enabled applications and are configured to report statistics about the sent and received traffic to an OML server.

2.Prerequisties
----------------

Accessing/Provisioning Resources
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| **Accessing a Resource at NITOS**
|
| Firstly, you have to reserve a node at NITOS: :ref:`getting-slice`

| **Provisioning a Resource at NITOS**
|
| You can use the method described on :ref:`loading-omf` for instructions on how to load disk images on resources at NITOS. Load your resource with a disk image that contains OMF6. For example load the image *baseline_omf6.ndz*. More baseline images available |base|.

.. |base| raw:: html

	<a href="http://nitlab.inf.uth.gr/nitlab_baseline_images.pdf" target="_blank">here</a>



3.Developing the Experiment
-------------------------------------------

In order to run an experiment with OMF, you first need to describe it into an Experiment Description (ED). An ED is a file/script that is supplied as an input to the Experiment Controller (EC). It contains a detailed description of the resources involved in an experiment and the sets of actions to perform in order to realize that experiment. An ED is written using the OMF Experiment Description Language (OEDL).

The ED for our experiment:

.. literalinclude:: tutorial01.rb
   :language: ruby
   :linenos:


You can see |oedl| more about (OMF6-OEDL)


.. |oedl| raw:: html
  
    <a href="http://omf.mytestbed.net/projects/omf6/wiki/OEDLOMF6" target="_blank">here</a>


4.Running Experiment
-----------------------

*a) How do you run it?*
^^^^^^^^^^^^^^^^^^^^^^^

In order to run your experiment you have to:

 * **save its description in a file on your computer or in the NITOS server, thus either**
     * cut-and-paste the above ED listing into a new file named 'tutorial01.rb'
     * download the ED directly: :download:`ED_script <tutorial01.rb>`

 * **open a terminal and navigate to the folder/directory where you saved that file**

 * **start the EC software and tell it to execute the experiment described in your ED file, using the command line:**

     .. code-block:: bash

        omf_ec -u xmpp://usr:pwd@my_xmpp.com exec --oml_uri tcp:srv:port tutorial01.rb

     * replace xmpp://usr:pwd@srv with the credentials for your user on the xmpp pubsub server that is used to communicate with the resources
     * replace tcp:srv:port with the hostname/IP and port of the OML2 server which will collect the experiment's measurements (More information :ref:`accessing-measurements`)

 * **So for our example, xmpp server and OML server run at nitlab.inf.uth.gr. Then you would use the command:**

     .. code-block:: bash

        omf_ec -u xmpp://nitlab.inf.uth.gr exec --oml_uri tcp:nitlab.inf.uth.gr:3003 tutorial01.rb

If you would like to know more about the other options of the OMF EC software please run the commands:

.. code-block:: bash

   omf_ec help
   omf_ec help exec

*b) What will happen next?*
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**When running the EC with the above command, you should see an output similar to this :**

.. code-block:: console

   OMF Experiment Controller - Copyright (c) 2012-13 National ICT Australia Limited (NICTA)
   {:type=>:xml, :authenticate=>nil}
   19:33:06 INFO  XMPP::Communicator: Connecting to 'nitlab.inf.uth.gr' ...
   INFO OML4R Client 2.10.4 [OMSPv4; Ruby 1.9.3] Copyright 2009-2014, NICTA
   INFO Collection URI is tcp:nitlab.inf.uth.gr:3003
   19:33:07 INFO  XMPP::Communicator: Connected
   19:33:07 INFO  Object: OMF Experiment Controller 6.1.1 - Start
   19:33:07 INFO  Object: Connected using {:proto=>:xmpp, :user=>simos-aspire-5739g-7586, :domain=>nitlab.inf.uth.gr}
   19:33:07 INFO  Object: Execute: /home/simos/Eidiko/tutorial01.rb
   19:33:07 INFO  Object: Properties: {}
   19:33:07 INFO  OmfEc::Experiment: Experiment: 2014-08-02T16:33:05.420Z starts
   19:33:07 INFO  OmfEc::Experiment: Configure 'node017' to join 'Sender'
   19:33:07 INFO  OmfEc::Experiment: Configure 'node023' to join 'Receiver'
   19:33:08 INFO  OmfEc::Experiment: Newly discovered resource >> xmpp://node023@nitlab.inf.uth.gr
   19:33:08 INFO  OmfEc::Experiment: Newly discovered resource >> xmpp://node017@nitlab.inf.uth.gr
   19:33:08 INFO  OmfEc::Experiment: Event triggered: 'ALL_NODES_UP, ALL_UP'
   19:33:08 INFO  OmfEc::Experiment: Config xmpp://node023@nitlab.inf.uth.gr to join Receiver
   19:33:08 INFO  OmfEc::Experiment: Config xmpp://node017@nitlab.inf.uth.gr to join Sender
   19:33:08 INFO  OmfEc::Experiment: Newly discovered resource >> xmpp://9f5677f9-590c-472b-8e46-f888b73e5c73@nitlab.inf.uth.gr
   19:33:08 INFO  OmfEc::Experiment: Newly discovered resource >> xmpp://e6d3a0e5-5cca-44d1-b146-e49bc78b72e9@nitlab.inf.uth.gr
   19:33:08 INFO  OmfEc::Experiment: Newly discovered resource >> xmpp://62c416b5-f49e-426c-8cfe-276922443673@nitlab.inf.uth.gr
   19:33:09 INFO  OmfEc::Experiment: Newly discovered resource >> xmpp://9071a6c8-222f-41c2-a410-439f49907607@nitlab.inf.uth.gr
   19:33:09 INFO  OmfEc::Experiment: Event triggered: 'ALL_UP_AND_INSTALLED'
   19:33:09 INFO  Object: This is my first OMF experiment-simos
   19:33:14 INFO  Object: All my Applications are started now...
   19:33:14 INFO  OmfEc: APP_EVENT STARTED from app otr2_cxt_0 - msg: env -i /usr/bin/otr2 --udp:local_host 192.168.0.3
   --udp:local_port 3000   --oml-config /tmp/9f5677f9-590c-472b-8e46-f888b73e5c73-1406997194.xml
   19:33:14 INFO  OmfEc: APP_EVENT STDERR from app otr2_cxt_0 - msg: Aug 02 19:33:14 INFO	OTG2 Traffic Sink 2.10.0
   19:33:14 INFO  OmfEc: APP_EVENT STDERR from app otg2_cxt_0 - msg: Aug 02 19:33:14 INFO	OTG2 Traffic Generator 2.10.0
   19:33:14 INFO  OmfEc: APP_EVENT STARTED from app otg2_cxt_0 - msg: env -i /usr/bin/otg2 --udp:dst_host 192.168.0.3
   --udp:dst_port 3000 --"   "udp:local_host 192.168.0.2 --oml-config /tmp/62c416b5-f49e-426c-8cfe-276922443673-1406997194.xml
   19:33:14 INFO  OmfEc: APP_EVENT STDERR from app otg2_cxt_0 - msg: INFO OML Client 2.11.0 [OMSPv5] Copyright 2007-2014, NICTA
   19:33:14 INFO  OmfEc: APP_EVENT STDERR from app otr2_cxt_0 - msg: INFO OML Client 2.11.0 [OMSPv5] Copyright 2007-2014, NICTA
   19:33:17 INFO  OmfEc: APP_EVENT STDERR from app otr2_cxt_0 - msg: INFO tcp:nitlab.inf.uth.gr:3003: Connected
   19:33:17 INFO  OmfEc: APP_EVENT STDERR from app otg2_cxt_0 - msg: INFO tcp:nitlab.inf.uth.gr:3003: Connected
   19:33:49 INFO  Object: All my Applications are stopped now.
   19:33:49 INFO  OmfEc::Experiment: Experiment: 2014-08-02T16:33:05.420Z finished
   19:33:49 INFO  OmfEc::Experiment: Release applications and network interfaces
   19:33:49 INFO  OmfEc::Experiment: Exit in 15 seconds...
   19:33:53 INFO  OmfEc: APP_EVENT EXIT from app otr2_cxt_0 - msg: 0
   19:33:53 INFO  OmfEc: APP_EVENT EXIT from app otg2_cxt_0 - msg: 0
   19:34:03 INFO  OmfEc::Experiment: OMF Experiment Controller 6.1.1 - Exit.
   19:34:04 INFO  XMPP::Communicator: Disconnecting...

*c) What does that screen output mean?*
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**First the EC provides us with some information about the parameters of this experiment (Experiment ID, XMPP server used, resourcesused,...):**

.. code-block:: console

   OMF Experiment Controller - Copyright (c) 2012-13 National ICT Australia Limited (NICTA)
   {:type=>:xml, :authenticate=>nil}
   19:33:06 INFO  XMPP::Communicator: Connecting to 'nitlab.inf.uth.gr' ...
   INFO OML4R Client 2.10.4 [OMSPv4; Ruby 1.9.3] Copyright 2009-2014, NICTA
   INFO Collection URI is tcp:nitlab.inf.uth.gr:3003
   19:33:07 INFO  XMPP::Communicator: Connected
   19:33:07 INFO  Object: OMF Experiment Controller 6.1.1 - Start
   19:33:07 INFO  Object: Connected using {:proto=>:xmpp, :user=>simos-aspire-5739g-7586, :domain=>nitlab.inf.uth.gr}
   19:33:07 INFO  Object: Execute: /home/simos/Eidiko/tutorial01.rb
   19:33:07 INFO  Object: Properties: {}
   19:33:07 INFO  OmfEc::Experiment: Experiment: 2014-08-02T16:33:05.420Z starts
   19:33:07 INFO  OmfEc::Experiment: Configure 'node017' to join 'Sender'

**It also provides us some feedback about its communication with the XMPP server and other OMF entities:**

.. code-block:: console

   19:33:08 INFO  OmfEc::Experiment: Newly discovered resource >> xmpp://node023@nitlab.inf.uth.gr
   19:33:08 INFO  OmfEc::Experiment: Newly discovered resource >> xmpp://node017@nitlab.inf.uth.gr

   19:33:08 INFO  OmfEc::Experiment: Newly discovered resource >> xmpp://9f5677f9-590c-472b-8e46-f888b73e5c73@nitlab.inf.uth.gr
   19:33:08 INFO  OmfEc::Experiment: Newly discovered resource >> xmpp://e6d3a0e5-5cca-44d1-b146-e49bc78b72e9@nitlab.inf.uth.gr
   19:33:08 INFO  OmfEc::Experiment: Newly discovered resource >> xmpp://62c416b5-f49e-426c-8cfe-276922443673@nitlab.inf.uth.gr
   19:33:09 INFO  OmfEc::Experiment: Newly discovered resource >> xmpp://9071a6c8-222f-41c2-a410-439f49907607@nitlab.inf.uth.gr

   19:34:04 INFO  XMPP::Communicator: Disconnecting...

**Then it also informs us when a defined event has been triggered:**

.. code-block:: console

   19:33:08 INFO  OmfEc::Experiment: Event triggered: 'ALL_NODES_UP, ALL_UP'
   19:33:09 INFO  OmfEc::Experiment: Event triggered: 'ALL_UP_AND_INSTALLED'"

**Finally, when an event is triggered (such as ALL_UP_AND_INSTALLED), it informs us about the tasks executed for that event, and   their results/outputs:**

.. code-block:: console

   19:33:09 INFO  OmfEc::Experiment: Event triggered: 'ALL_UP_AND_INSTALLED'
   19:33:09 INFO  Object: This is my first OMF experiment-simos
   19:33:14 INFO  Object: All my Applications are started now...
   19:33:14 INFO  OmfEc: APP_EVENT STARTED from app otr2_cxt_0 - msg: env -i /usr/bin/otr2 --udp:local_host 192.168.0.3
   --udp:local_port 3000   --oml-config /tmp/9f5677f9-590c-472b-8e46-f888b73e5c73-1406997194.xml
   19:33:14 INFO  OmfEc: APP_EVENT STDERR from app otr2_cxt_0 - msg: Aug 02 19:33:14 INFO	OTG2 Traffic Sink 2.10.0
   19:33:14 INFO  OmfEc: APP_EVENT STDERR from app otg2_cxt_0 - msg: Aug 02 19:33:14 INFO	OTG2 Traffic Generator 2.10.0
   19:33:14 INFO  OmfEc: APP_EVENT STARTED from app otg2_cxt_0 - msg: env -i /usr/bin/otg2 --udp:dst_host 192.168.0.3
   --udp:dst_port 3000 --"   "udp:local_host 192.168.0.2 --oml-config /tmp/62c416b5-f49e-426c-8cfe-276922443673-1406997194.xml
   19:33:14 INFO  OmfEc: APP_EVENT STDERR from app otg2_cxt_0 - msg: INFO OML Client 2.11.0 [OMSPv5] Copyright 2007-2014, NICTA
   19:33:14 INFO  OmfEc: APP_EVENT STDERR from app otr2_cxt_0 - msg: INFO OML Client 2.11.0 [OMSPv5] Copyright 2007-2014, NICTA
   19:33:17 INFO  OmfEc: APP_EVENT STDERR from app otr2_cxt_0 - msg: INFO tcp:nitlab.inf.uth.gr:3003: Connected
   19:33:17 INFO  OmfEc: APP_EVENT STDERR from app otg2_cxt_0 - msg: INFO tcp:nitlab.inf.uth.gr:3003: Connected
   19:33:49 INFO  Object: All my Applications are stopped now.
   19:33:49 INFO  OmfEc::Experiment: Experiment: 2014-08-02T16:33:05.420Z finished
   19:33:49 INFO  OmfEc::Experiment: Release applications and network interfaces
   19:33:49 INFO  OmfEc::Experiment: Exit in 15 seconds...
   19:33:53 INFO  OmfEc: APP_EVENT EXIT from app otr2_cxt_0 - msg: 0
   19:33:53 INFO  OmfEc: APP_EVENT EXIT from app otg2_cxt_0 - msg: 0
   19:34:03 INFO  OmfEc::Experiment: OMF Experiment Controller 6.1.1 - Exit.

5.Accesing Results
-------------------
You can access your results |here| More information about accessing the results of your experiment: :ref:`accessing-measurements`

.. |here| raw:: html
 
   <a href="http://nitlab.inf.uth.gr/phppgadmin" target="_blank">here</a>
