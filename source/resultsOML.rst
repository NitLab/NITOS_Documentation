.. _accessing-measurements:

Accessing the measurements gathered from your OMF experiment
============================================================
There are 2 OML Servers deployed in NITOS facility. The first one is deployed in *nitlab.inf.uth.gr* and it stores the measurements in a PostgreSQL database and the second one is deployed in *nitlab3.inf.uth.gr* and it stores the measurements in an SQLite format.


1.OML Server configured in PostgreSQL Database
----------------------------------------------

You can utilize this OML Server using the domain *nitlab.inf.uth.gr:3003* and you can access the measurements in |post|, with username *oml* and password *oml*.

.. |post| raw:: html

	<a href="http://nitlab.inf.uth.gr/phppgadmin" target="_blank">this web interface</a>


2.OML Server configured in SQLite format
----------------------------------------

You can utilize this OML Server using the domain *nitlab3.inf.uth.gr:3003*. Each experiment conducted using this OML Server generates an sq3 file inside the folder /tmp/ of the *nitlab3.inf.uth.gr* server.


