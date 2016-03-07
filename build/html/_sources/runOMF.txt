.. _run-omf:


Using your slice to run OMF experiments
========================================
There are two ways of running OMF experiments during your reservation. The first way is to issue OMF commands when logged in the NITOS server and the second way is to install the OMF *Experiment Controller* locally at your PC and configure it appropriately. **We strongly recommend the first option**, since every necessary compoment is in place in our server.

1.Running OMF Experiment Controller from the server
----------------------------------------------------

.. note:: In this section, we present you the functionality of the *omf_ec* command and some of its parameters. If you are interested in running a real OMF experiment, please go to :ref:`simple-omf`.

You can run OMF experiments while logged in the NITOS server with your account. Two options of the omf_ec command that might be useful are the: *-u xmpp://usr:pwd@my_xmpp.com* for mentioning the URL of the XMPP server you are going to use and the *--oml_uri tcp:srv:port* for mentioning the URL of the OML server you are willing to use. An example of issuing the omf_ec command, **while connected in NITOS server**, 

where we use the XMPP and the OML server installed in the domain *nitlab.inf.uth.gr* is:

.. code-block:: bash

 omf_ec -u xmpp://nitlab.inf.uth.gr exec --oml_uri tcp:nitlab.inf.uth.gr:3003 your_experiment.rb

or the following, where we use the OML Server deployed in *nitlab3.inf.uth.gr*:

.. code-block:: bash
 
 omf_ec -u xmpp://nitlab.inf.uth.gr exec --oml_uri tcp:nitlab3.inf.uth.gr:3003 your_experiment.rb

.. note:: There is one XMPP server deployed in each of the NITOS testbeds. Although, you can use the *nitlab.inf.uth.gr* for the whole NITOS Facility, even if you are using nodes from *nitlab2.inf.uth.gr* or *nitlab3.inf.uth.gr*. In case you want to use another domain as your XMPP server, you should also configure accordingly the yaml file of the OMF RC of each of the involved nodes.


More about the different OML Servers deployed in NITOS, :ref:`accessing-measurements`.


2.Running OMF Experiment Controller from your PC
------------------------------------------------

You can run OMF experiments from your PC. This requires the installation of the OMF EC in your PC (more information |here|)

.. |here| raw:: html

	<a href="http://mytestbed.net/doc/omf/file.INSTALLATION.html#Introduction" target="_blank">here</a>

