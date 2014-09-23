Simple OMF Example
===================

1.Basics
---------
This simple example introduces you to OMF6. It presents all the basic steps to develop, run, and access the results of an experiment executed with OMF 6.

**Experiment Senario**

 This simple experiment involves a single resource, which has an active network interface. In this experiment, we will instruct that resource to start an instance of the 'ping-oml2' application to probe another host on the network attached to that interface (e.g. another host on the Internet, the LAN, or the resource's itself).

 This 'ping-oml2' application is a wrapper around the traditional ping application. It captures the ping outputs and sends them as measurement streams to an OML2 collection point (an OML2 server in this case), which then stores them in a database available to the experimenter.



2.Prerequisties
----------------

*a) Accessing/Provisioning Resources*
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
| **Accessing a Resource at NITOS**
|
| Firstly, you have to reserve a node at NITOS: :ref:`label-name`

| **Provisioning a Resource at NITOS**
|
| You can use the method described on :ref:`label-name-2` for instructions on how to load images on resources at NITOS. Load your resource with a disk image that contains OMF6. For example load the image "*baseline_grid_omf6_1_1.ndz*".

*b) Installing the Experiment Controller*
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The OMF Experiment Controller (EC) is the software that will interpret your Experiment Description (ED) and interact with the resources to execute it accordingly.

You can install your own EC on your machine, by following the instructions for users on `OMF 6 Installation Guide <http://mytestbed.net/doc/omf/file.INSTALLATION.html>`_.

3.Developing the Experiment
-------------------------------------------

In order to run an experiment using OMF, you first need to describe it with an Experiment Description (ED). An ED is a file/script that is supplied as an input to the Experiment Controller (EC). It contains a detailed description of the resources involved in the experiment and the sets of actions to perform in order to realize that experiment. An ED is written using the OMF Experiment Description Language (OEDL).

The ED for our experiment:

.. literalinclude:: tutorial000.rb
   :language: ruby
   :linenos:

You can see `here <http://omf.mytestbed.net/projects/omf6/wiki/OEDLOMF6>`_  more about (OMF6-OEDL)

4.Running Experiment
-----------------------

*a) How do you run it?*
^^^^^^^^^^^^^^^^^^^^^^^

To run your experiment you have to:

  * **save its description in a file on your computer, thus either**
     * cut-and-paste the above ED listing into a new file named 'tutorial000.rb'
     * download the ED directly: :download:`ED_script <tutorial000.rb>`

  * **open a terminal and navigate to the folder/directory where you saved that file**

  * **start the EC software and tell it to execute the experiment described in your ED file, using the command line:**

     .. code-block:: bash

        omf_ec -u xmpp://usr:pwd@my_xmpp.com exec --oml_uri tcp:srv:port tutorial000.rb

     * replace xmpp://usr:pwd@srv with the credentials for your user on the xmpp pubsub server that is used to communicate with the resources
     * replace tcp:srv:port with the hostname/IP and port of the OML2 server which will collect the experiment's measurement

  * **So for our example, xmpp server and OML server run at nitlab.inf.uth.gr. Then you would use the command:**

     .. code-block:: bash

        omf_ec -u xmpp://nitlab.inf.uth.gr exec --oml_uri tcp:nitlab.inf.uth.gr:3003 tutorial000.rb

If you would like to know more about the other options of the OMF EC software please run the commands:

.. code-block:: bash

   omf_ec help
   omf_ec help exec


*b) What will happen next?*
^^^^^^^^^^^^^^^^^^^^^^^^^^^^


.. code-block:: console

   OMF Experiment Controller - Copyright (c) 2012-13 National ICT Australia Limited (NICTA)
   {:type=>:xml, :authenticate=>nil}
   21:27:18 INFO  XMPP::Communicator: Connecting to 'nitlab.inf.uth.gr' ...
   INFO	OML4R Client 2.10.4 [OMSPv4; Ruby 1.9.3] Copyright 2009-2014, NICTA
   INFO	Collection URI is tcp:nitlab.inf.uth.gr:3003
   21:27:20 INFO  XMPP::Communicator: Connected
   21:27:20 INFO  Object: OMF Experiment Controller 6.1.1 - Start
   21:27:20 INFO  Object: Connected using {:proto=>:xmpp, :user=>simos-aspire-5739g-2891, :domain=>nitlab.inf.uth.gr}
   21:27:20 INFO  Object: Execute: /home/simos/Eidiko/tutorial000.rb
   21:27:20 INFO  Object: Properties: {}
   21:27:20 INFO  OmfEc::Experiment: Experiment: 2014-05-28T18:27:18.121Z starts
   21:27:20 INFO  OmfEc::Experiment: Configure 'node016' to join 'Sender'
   21:27:20 INFO  OmfEc::Experiment: Newly discovered resource >> xmpp://node016@nitlab.inf.uth.gr
   21:27:20 INFO  OmfEc::Experiment: Event triggered: 'ALL_NODES_UP, ALL_UP'
   21:27:20 INFO  OmfEc::Experiment: Config xmpp://node016@nitlab.inf.uth.gr to join Sender
   21:27:21 INFO  OmfEc::Experiment: Newly discovered resource >> xmpp://4980cefe-0117-442f-b743-49e57614fbcf@nitlab.inf.uth.gr
   21:27:21 INFO  OmfEc::Experiment: Event triggered: 'ALL_UP_AND_INSTALLED'
   21:27:21 INFO  Object: This is my first OMF experiment-simos
   21:27:21 INFO  OmfEc: APP_EVENT STARTED from app ping_oml2_cxt_0 - msg: env -i /usr/bin/ping-oml2  8.8.8.8 -c 3 --oml-config tmp/4980cefe-0117-442f-b743-49e57614fbcf-1401301641.xml
   21:27:21 INFO  OmfEc: APP_EVENT STDERR from app ping_oml2_cxt_0 - msg:  INFO ping-oml2: V2.10.4
   21:27:21 INFO  OmfEc: APP_EVENT STDERR from app ping_oml2_cxt_0 - msg: INFO	OML4R Client 2.10.4 [OMSPv4; Ruby 1.9.3] Copyright2009-2014, NICTA
   21:27:21 INFO  OmfEc: APP_EVENT STDERR from app ping_oml2_cxt_0 - msg: INFO	Collection URI is tcp:nitlab.inf.uth.gr:3003
   21:27:24 INFO  OmfEc: APP_EVENT STDOUT from app ping_oml2_cxt_0 - msg: 64 bytes from 8.8.8.8: icmp_req=1 ttl=45 time=58.6 ms
   21:27:24 INFO  OmfEc: APP_EVENT STDOUT from app ping_oml2_cxt_0 - msg: PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
   21:27:24 INFO  OmfEc: APP_EVENT STDOUT from app ping_oml2_cxt_0 - msg: 64 bytes from 8.8.8.8: icmp_req=3 ttl=45 time=58.7 ms
   21:27:24 INFO  OmfEc: APP_EVENT STDOUT from app ping_oml2_cxt_0 - msg: 64 bytes from 8.8.8.8: icmp_req=2 ttl=45 time=58.6 ms
   21:27:24 INFO  OmfEc: APP_EVENT STDOUT from app ping_oml2_cxt_0 - msg:
   21:27:24 INFO  OmfEc: APP_EVENT STDOUT from app ping_oml2_cxt_0 - msg: --- 8.8.8.8 ping statistics ---
   21:27:25 INFO  OmfEc: APP_EVENT STDOUT from app ping_oml2_cxt_0 - msg: 3 packets transmitted, 3 received, 0% packet loss, time 2002ms
   21:27:25 INFO  OmfEc: APP_EVENT STDOUT from app ping_oml2_cxt_0 - msg: rtt min/avg/max/mdev = 58.657/58.676/58.712/0.199 ms
   21:27:25 INFO  OmfEc: APP_EVENT EXIT from app ping_oml2_cxt_0 - msg: 0
   21:27:31 INFO  OmfEc::Experiment: Experiment: 2014-05-28T18:27:18.121Z finished
   21:27:31 INFO  OmfEc::Experiment: Release applications and network interfaces
   21:27:31 INFO  OmfEc::Experiment: Exit in 15 seconds...
   21:27:45 INFO  OmfEc::Experiment: OMF Experiment Controller 6.1.1 - Exit.
   21:27:46 INFO  XMPP::Communicator: Disconnecting...

*c) What does that screen output mean?*
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**First the EC provides us with some information about the parameters of this experiment:**

.. code-block:: console

   OMF Experiment Controller - Copyright (c) 2012-13 National ICT Australia Limited (NICTA)
   {:type=>:xml, :authenticate=>nil}
   21:27:18 INFO  XMPP::Communicator: Connecting to 'nitlab.inf.uth.gr' ...
   INFO	OML4R Client 2.10.4 [OMSPv4; Ruby 1.9.3] Copyright 2009-2014, NICTA
   INFO	Collection URI is tcp:nitlab.inf.uth.gr:3003
   21:27:20 INFO  XMPP::Communicator: Connected
   21:27:20 INFO  Object: OMF Experiment Controller 6.1.1 - Start
   21:27:20 INFO  Object: Connected using {:proto=>:xmpp, :user=>"simos-aspire-5739g-2891", :domain=>"nitlab.inf.uth.gr"}
   21:27:20 INFO  Object: Execute: /home/simos/Eidiko/tutorial000.rb
   21:27:20 INFO  Object: Properties: {}
   21:27:20 INFO  OmfEc::Experiment: Experiment: 2014-05-28T18:27:18.121Z starts
   21:27:20 INFO  OmfEc::Experiment: Configure 'node016' to join 'Sender'


**It provides us some feedback about its communication with the xmpp server and other OMF entities.It also informs us when a   defined event has been triggered:**

.. code-block:: console

   21:27:20 INFO  OmfEc::Experiment: Newly discovered resource >> xmpp://node016@nitlab.inf.uth.gr
   21:27:20 INFO  OmfEc::Experiment: Event triggered: 'ALL_NODES_UP, ALL_UP'
   21:27:20 INFO  OmfEc::Experiment: Config xmpp://node016@nitlab.inf.uth.gr to join Sender
   21:27:21 INFO  OmfEc::Experiment: Newly discovered resource >> xmpp://4980cefe-0117-442f-b743-49e57614fbcf@nitlab.inf.uth.gr
   ...
   21:27:46 INFO  XMPP::Communicator: Disconnecting...


**Finally, when an event is triggered (such as ALL_UP_AND_INSTALLED), it informs us about the tasks executed for that event, and their results/outputs:**

.. code-block:: console

   21:27:21 INFO  OmfEc::Experiment: Event triggered: 'ALL_UP_AND_INSTALLED'
   21:27:21 INFO  Object: This is my first OMF experiment-simos
   21:27:21 INFO  OmfEc: APP_EVENT STARTED from app ping_oml2_cxt_0 - msg: env -i /usr/bin/ping-oml2  8.8.8.8 -c 3 --oml-config tmp/4980cefe-0117-442f-b743-49e57614fbcf-1401301641.xml
   21:27:21 INFO  OmfEc: APP_EVENT STDERR from app ping_oml2_cxt_0 - msg:  INFO ping-oml2: V2.10.4
   21:27:21 INFO  OmfEc: APP_EVENT STDERR from app ping_oml2_cxt_0 - msg: INFO	OML4R Client 2.10.4 [OMSPv4; Ruby 1.9.3] Copyright 2009-2014, NICTA
   21:27:21 INFO  OmfEc: APP_EVENT STDERR from app ping_oml2_cxt_0 - msg: INFO	Collection URI is tcp:nitlab.inf.uth.gr:3003
   21:27:24 INFO  OmfEc: APP_EVENT STDOUT from app ping_oml2_cxt_0 - msg: 64 bytes from 8.8.8.8: icmp_req=1 ttl=45 time=58.6 ms
   21:27:24 INFO  OmfEc: APP_EVENT STDOUT from app ping_oml2_cxt_0 - msg: PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
   21:27:24 INFO  OmfEc: APP_EVENT STDOUT from app ping_oml2_cxt_0 - msg: 64 bytes from 8.8.8.8: icmp_req=3 ttl=45 time=58.7 ms
   21:27:24 INFO  OmfEc: APP_EVENT STDOUT from app ping_oml2_cxt_0 - msg: 64 bytes from 8.8.8.8: icmp_req=2 ttl=45 time=58.6 ms
   21:27:24 INFO  OmfEc: APP_EVENT STDOUT from app ping_oml2_cxt_0 - msg:
   21:27:24 INFO  OmfEc: APP_EVENT STDOUT from app ping_oml2_cxt_0 - msg: --- 8.8.8.8 ping statistics ---
   21:27:25 INFO  OmfEc: APP_EVENT STDOUT from app ping_oml2_cxt_0 - msg: 3 packets transmitted, 3 received, 0% packet loss, time 2002ms
   21:27:25 INFO  OmfEc: APP_EVENT STDOUT from app ping_oml2_cxt_0 - msg: rtt min/avg/max/mdev = 58.657/58.676/58.712/0.199 ms
   21:27:25 INFO  OmfEc: APP_EVENT EXIT from app ping_oml2_cxt_0 - msg: 0
   21:27:31 INFO  OmfEc::Experiment: Experiment: 2014-05-28T18:27:18.121Z finished
   21:27:31 INFO  OmfEc::Experiment: Release applications and network interfaces
   21:27:31 INFO  OmfEc::Experiment: Exit in 15 seconds...
   21:27:45 INFO  OmfEc::Experiment: OMF Experiment Controller 6.1.1 - Exit.


5.Accesing Results
-------------------
You can access your results by going to "tmp" file (i.e syiordan@nitlab:/tmp$ ) and type **ls**.
