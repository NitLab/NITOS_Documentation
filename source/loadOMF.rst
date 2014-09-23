.. _label-name-2:

Loading an OMF-compatible image on your resource
================================================

Ubuntu distributions, stored at the NITOS server as binary .ndz files can be loaded on the resources overwriting any existing data on the disks of these resources.

Beginners can load a "baseline" distribution on their resources and later modify it according to their needs. There are two types of nodes supporting hard drive images at NITOS, the Orbit-like nodes (the 'yellow' ones) and the Grid nodes (the 'red' ones). For Orbit-like nodes, the user should load the "baseline_orbit.ndz" image and for the Grid nodes, the user should use the "baseline_grid.ndz" image.

At any time you can look at **MyReservations**, to see all of your scheduled reservations, or at **Node Status** to see the status of your reserved nodes.

You can then load a "baseline" image for nodes you have already reserved, using the omf load command. For example, to load the "baseline_grid.ndz" image to node 16 of NITOS, issue in a terminal where you are connected to the NITOS Server the following command:

.. code-block:: bash

  $ omf load -i baseline_grid.ndz -t omf.nitos.node016

You can load an image to many nodes simultaneously using a comma separated list, for example:

.. code-block:: bash

  $ omf load -i baseline_grid.ndz -t omf.nitos.node016,omf.nitos.node017

Once the loading process of one of the "baseline" images is succesfully completed, you can ssh into these nodes as root with no password. In a terminal where you are connected on the NITOS server, issue the following command:

.. code-block:: bash

  $ ssh root@node016

You can configure the image as you wish, since you have root privileges. One modification that you have to make is edit the file */etc/omf-resctl-5.4/omf-resctl.yaml* and change the *:slice* section by putting your username instead of the entry *default_slice*. Another modification that you have to make to ensure no other user has access to your resource during your reservation, is to add a root password to the image (using the *passwd command*). Note that you only need to do these changes once, for each of the two types of nodes, since you can then save your modified image, so that you can load your "own" image each of the time you use NITOS. 

The process of saving images is described in the next section.
