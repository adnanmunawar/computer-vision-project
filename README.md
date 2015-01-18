computer-vision-project
=======================

A Repository for RBE-CS 549 Computer Vision Project

#Developers
**Adnan Munawar |** **Ajay Prabu |** **Phil Schaffer**

**Worcester Polytechnic Institute, 100 Institute Road, Worcester, MA, 01609**
#Acknowledgements
**Dirk Jan Kroon**
#Based Upon
*Lucas-Kanade 20 Years On: A Unifying Framework*

**HOW TO RUN**
   * There are three ways of running this code.
     * Using Live Video Input. Run the file **start\_from\_video.m**
     * Using Images. Run the file **start\_from\_image.m**
     * Using Recorded Video. Run the file **start_from_movie.m**
   * In all the three cases, and image is taken from the video, movie, or the loaded image itself and shown on screen. You have to select a rectangular window using your mouse. Whatever rectangular area you want to select, take the mouse cursor on the top left corner of it:
     * Click.
     * Keep holding the mouse button.
     * Drag to the bottom right corner of the template you want to choose.
   * That is pretty much it.
   * The LK will track the object, hopefully. This implementation only tracks the x and y variations. No scale or other parameters implemented yet!!!
   * The code has been optimized for speed. Runs fast enough for Matlab. 
