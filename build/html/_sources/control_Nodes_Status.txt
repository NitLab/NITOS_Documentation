Controlling the status of the nodes
====================================

In order to control the status of a node you can use the omf tell command. For example for rebooting node 16:

.. code-block:: bash

	$ omf tell -a reboot -t omf.nitos.node016

or for turning on node 16:

.. code-block:: bash

	$ omf tell -a on -t omf.nitos.node016

You can also use the custom made command "t_reboot" for checking your reserved nodes:

.. code-block:: bash

  $ t_reboot who

or for rebooting all of them:

.. code-block:: bash

  $ t_reboot all hd

