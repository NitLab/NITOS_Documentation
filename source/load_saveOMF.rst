.. _loading-saving-omf:

Loading and Saving an OMF-compatible image on your resource
===========================================================
Ubuntu distributions, stored at the NITOS server as binary .ndz files can be loaded on the resources overwriting any existing data on the disks of these resources.

Beginners can load a "baseline" distribution on their resources and later modify it according to their needs. NITlab provides several types of baseline images serving the different experimentation capabilities of NITOS. You can choose any of them according to your experiment. `baseline images <_images/NITOS_base_imgs.pdf>`_ 

At any time you can look at |my-reservations|, to see all of your scheduled reservations, or at |node-status| to see the status of your reserved nodes.

.. |my-reservations| raw:: html
	
	<a href="http://nitos.inf.uth.gr/my_reservations" target="_blank">My Reservations</a>

.. |node-status| raw:: html
	
	<a href="http://nitos.inf.uth.gr/node_status" target="_blank">Node Status</a>

.. _loading-omf:

1.Loading an image
---------------------------------

You can then load a `baseline <_images/NITOS_base_imgs.pdf>`_ image for nodes you have already reserved, using the omf load command. For example, to load the "baseline.ndz" image to node 16 of NITOS, issue **in a terminal where you are connected to NITOS Server** the following command:

.. code-block:: bash

  $ omf load -i baseline.ndz -t node016

You can load an image to many nodes simultaneously using a comma separated list, for example:

.. code-block:: bash

  $ omf load -i baseline.ndz -t node016,node017


You can use the help menu in order to check other available options of the omf load command.

.. code-block:: bash

	$ omf load --help

Once the loading process of one of the "baseline" images is succesfully completed, you can ssh into these nodes as root with no password. **In a terminal where you are connected to NITOS server**, issue the following command:

.. code-block:: bash

  $ ssh root@node016

You can configure the image as you wish, since you have root privileges. In case you want to ensure no other user has access to your resource during your reservation, you should add a root password to the image (using the *passwd command*). Note that you only need to do this change once, since you can then save your modified image, so that you can load your "own" image whenever you use NITOS. 

In a terminal where you are connected to a node loaded with your image, issue the following command, for changing the root password:

.. code-block:: bash

  $ passwd 

The process of saving images is described in the following section.


.. _saving-omf:

2.Saving an image
-----------------

You can save your modified disk image, in order to maintain the changes you've made and be able to use it again, issuing the omf save command, **in a terminal where you are connected to NITOS server**. For example:

.. code-block:: bash

 $ omf save -n node016

The above command will save the current disk image of node016 to the server. The image is saved as a *.ndz* file in the directory */var/lib/omf-images-5.4* of the NITOS server, with a name containing the date and time of the *`omf save`* command. Then, you can rename the image, so that its name is more meaningful to you and reload this image on your resources using the omf load command at any time.
