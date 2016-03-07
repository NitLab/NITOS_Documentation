.. _controlling-the-status:

Controlling the status of the nodes
====================================


.. _controlling-status-command-line:

1. Command Line
---------------

In order to control the status of a node you can use the omf tell command. For example for rebooting node016:

.. code-block:: bash

	$ omf tell -a reboot -t node016

or for turning on node016:

.. code-block:: bash

	$ omf tell -a on -t node016

You can try omf tell --help in order to check the other available "omf tell actions".

.. code-block:: bash

	$ omf tell --help

If you wish to check the status of a node, you can use the omf stat command.

.. code-block:: bash

	$ omf stat -t node016



.. _controlling-status-portal:

2. Through the Portal
---------------------

An alternative to the command line tools described above, is the |node-status| of the NITOS Portal.

.. |node-status| raw:: html

	<a href="http://nitos.inf.uth.gr/node_status" target="_blank">Node Status tool</a>

Through this tool, you can observe the status of each node you have previously reserved, turn them on, reset them, or turn them off, very easily by just clicking the corresponding buttons.

.. image:: _static/portal-node-status.png


