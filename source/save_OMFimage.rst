Saving an OMF image from the resources to the server
====================================================
You can save your modified image, in order to maintain the changes you've made and be able to use it again issuing the omf save command. For example, issuing

**$ omf save -n omf.nitos.node005**

will save the current image of node 5 to the server. The image is saved as an *.ndz* file in the directory */var/lib/omf-images-5.4* of the NITOS server with a name containing the date and time of the *`omf save`* command. You can then load this image to your resources using the omf load command and the name of the image. You can also rename the image, so that its name is more meaningful to you.
