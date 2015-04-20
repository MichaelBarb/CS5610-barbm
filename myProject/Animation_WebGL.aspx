<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Animation_WebGL.aspx.cs" Inherits="myProject_Animation_WebGL" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>WebGL Animation</title>
    <link href="../myBootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../myBootstrap/css/bootstrap-theme.css" rel="stylesheet" />
    <link href="myProjectTheme.css" rel="stylesheet" />

    <script src="../Scripts/jquery-2.1.3.min.js"></script>
    <script src="../myBootstrap/js/bootstrap.js"></script>
    <script src="../../Scripts/three-js/three.min.js"></script>
    <script src="Animation_WebGL.js"></script>


</head>
<body>
    <form id="form1" runat="server">
        <div class="titleGradient">
            <div class="titleContainer jumbotron row ">
                <div class="col-sm-3">
                    <img src="../myImage/WebGL_logo.png" height="144" width="248" />
                </div>
                <div class="col-sm-9">
                    <h1>Interactive<br />
                        WebGL Animation</h1>
                    <br />
                    <h3>CS5610 WebDevelopement Project</h3>
                    <h3>Michael Barb</h3>
                </div>
            </div>
        </div>
        <div class="container">
            <div>
                <div class="row">
                    <div class="col-sm-6">
                        <div id="myFrame" class="frame">
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="text-center">
                            <h2>Control Animation</h2>
                            <button type="button" class="btn btn-success btn-lg" style="width: 200px" onclick="playStart()">Run Continous</button>
                            <button type="button" class="btn btn-success btn-lg" style="width: 200px" onclick="moveStart()">Move To Angle</button>
                            <br />
                            <br />
                            <button type="button" class="btn btn-primary" onclick="pauseFrame()">Pause</button>
                            <button type="button" class="btn btn-primary" onclick="resumeFrame()">Resume</button>
                            <button type="button" class="btn btn-warning" onclick="resetFrame()">Reset</button>
                        </div>
                        <div class="text-center">
                            <h2>Setup Animation</h2>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th class="text-center">&nbsp;</th>
                                        <th class="text-center">Speed<br />
                                            (sec/360°)</th>
                                        <th class="text-center">Current Angle<br />
                                            (deg)</th>
                                        <th class="text-center">New Angle<br />
                                            (deg)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><b>Arm 1</b></td>
                                        <td>
                                            <input type="text" id="arm1speedIn" value="2" /></td>
                                        <td>
                                            <p id="arm1angleCurrent"></p>
                                        </td>
                                        <td>
                                            <input type="text" id="arm1angleNewIn" value="90" /></td>
                                    </tr>
                                    <tr>
                                        <td><b>Arm 2</b></td>
                                        <td>
                                            <input type="text" id="arm2speedIn" value="2" /></td>
                                        <td>
                                            <p id="arm2angleCurrent"></p>
                                        </td>
                                        <td>
                                            <input type="text" id="arm2angleNewIn" value="90" /></td>
                                    </tr>
                                </tbody>
                            </table>
                            <br />
                            <br />
                            Callback count: <b id="cb">0</b>
                            <br />
                        </div>
                    </div>
                </div>
                <hr />

                <p style="float: right">&copy; 2015 Michael Barb, MSCS, Northeastern Univ.</p>
            </div>

            <hr />
            <div id="Index">
                <h2>Index</h2>
                <div class="row">
                    <div class="col-sm-offset-1">
                        <a href="#Documentation">
                            <h3>1. &nbsp; Documentaion</h3>
                        </a>
                        <a href="#Section2">
                            <h3>2. &nbsp; CSS3 Animation Method</h3>
                        </a>
                        <a href="#Section3">
                            <h3>3. &nbsp; jQuery.keyframes</h3>
                        </a>
                        <a href="#Section4">
                            <h3>4. &nbsp; HTML Program</h3>
                        </a>
                        <a href="#Section5">
                            <h3>6. &nbsp; JavaScript Program</h3>
                        </a>
                        <a href="#Section6">
                            <h3>7. &nbsp; Problems Encountered</h3>
                        </a>
                        <a href="#Conclusions">
                            <h3>8. &nbsp; Conclusions</h3>
                        </a>
                        <a href="#Source">
                            <h3>9. &nbsp; Source Code</h3>
                        </a>
                        <a href="#References">
                            <h3>10. &nbsp; References</h3>
                        </a>
                    </div>
                </div>
            </div>
            <hr />
            <div id="Documentation">
                <h3>1. &nbsp; Documentation</h3>
                <h4>Button: Run Continous</h4>
                <p>
                    This button will run the arms continuously.  By default the speeds are both set at 2 seconds.  
                    This means that for every rotation of arm1 there will be one rotation of arm2.  Note that when 
                    arm1 and arm2 are at 180° then arm2 to totally covers arm1.  Try setting arm1 to 8 and leaving 
                    arm2 at 2.  This 4:1 ratio results in the arms being fully extend 4 times during the cycle at 
                    the 90° axis.
                </p>
                <p>
                    Try changing the speeds while continuous motion is running.  The speed will change instantly and 
                    no reset is necessary like the CSS Animation version.  Not doing the reset first means the harmonics 
                    of times may not be as observable but an instant change is more natural.
                </p>
                <h4>Button: Move To Angle</h4>
                <p>
                    Pressing this button will move the arm from its current position to the new position.  By changing 
                    only one are rotation at a time you can easily observe the relative motion of arm2 with respect to arm1.  
                </p>
                <p>
                    The major point of this exploration is have the arm move to a point.  Allow the user to specify a new 
                    point.  Have the arm move from the last point to the new point.  This button is by far the most 
                    difficult to implement.
                </p>
                <h4>Button: Pause</h4>
                <p>
                    This will pause the current motion.  Try it when in continuous run.
                </p>
                <h4>Button: Resume</h4>
                <p>
                    This will resume any pending motion.  Try it when in continuous run after hitting pause.
                </p>
                <h4>Button: Reset</h4>
                <p>
                    This will reset the arms to the home position.  They will be fully extended pointing to the 
                    right.  It will reset any motion and a paused motion.
                </p>
                <h4>Table: Setup Animation</h4>
                <p>
                    The table allows setup of each arm independently.
                </p>
                <h5>Speed (sec/360°)</h5>
                <p>
                    The number of seconds to complete a 360° rotation of an arm.  The speed set is the same for both
                    continous and move to angle motions.  For move to an angle the total time of the motion will vary 
                    depending the length of the motion.
                </p>
                <h5>Current Angle (deg) </h5>
                <p>
                    The current angle of the arms are displayed.  It is updated on a real time basis.  This was not 
                    possible in the CSS animation version.
                </p>
                <p>
                    Note how the angle continues to accumlate past 360°.  For a more intuitive interface the numbers 
                    should probably be limited from 0° to 360° and wrap when crossing the between 0° / 360° point.  
                    They were allowed to accumulate to illustrates the way angles in WebGL are measured.  
                </p>
                <h5>New Angle (deg) </h5>
                <p>
                    The new angle for the next or current move.  It can be changed while a motion is running.  
                    You can either wait until the current move is running or change while it is running.  The change 
                    will occur smoothly.  In the CSS animation it had to reset and jump to the last position before 
                    proceeding to the new target.
                </p>
                <a href="#Index" class="pull-right">Back To Index</a>
            </div>
            <hr />
            <div id="Section2">
                <h3>2. &nbsp; WebGL Animation Method</h3>
                <p>
                    WebGL stands for Web Graphics Library.  It is a JavaScript API that allows interactive 2D and 3D graphics 
                    to be drawn in a &lt;canvas>.  It is based on OpenGL which is an open source API for graphics using a 
                    hardware accelerated graphics processing unit (GPU). Most desktops and laptops today have dedicated 
                    multi-core GPU.  Many tablets also have them.  Some high end cell phones have GPU’s or have multi-core 
                    processors with some cores dedicated to graphics processing.  
                </p>
                <p>
                    WebGL basically brings OpenGL to the browser.  WebGL is integrated into web standards.  WebGL allows 
                    hardware accelerated objects can be accessed by JavaScript threw the DOM.  The result is very fast 
                    interactive 2D and 3D graphics in the browser.  Currently it is implemented by most browsers.  
                </p>
                <a href="#Index" class="pull-right">Back To Index</a>
            </div>
            <hr />
            <div id="Section3">
                <h3>3. &nbsp; three.js</h3>
                <p>
                    WebGL is a very low level API requiring lots of complex JavaScript to use.  There are several higher 
                    level addin libraries that streamline its usage.  One of the more popular is Three.js.  It is used in 
                    this page.  Three.js was roots that started long before GPU’s and the web.  It carries some baggage 
                    from its roots but has developed such a large support group one can overcome many of these problems.   
                </p>
                <p>
                    A more modern one being pushed by Microsoft and others is Babylon.js.  It would be interesting to explore 
                    this further in the future.  Documentation and support are not that good at this point so it will take 
                    more effort to use.
                </p>
                <a href="#Index" class="pull-right">Back To Index</a>
            </div>
            <hr />
            <div id="Section4">
                <h3>4. &nbsp; HTML Program</h3>
                <p>
                    The HTML program is even simpler than for the CSS version.  All that is necessary is to provide a 
                    div with an id.  The WebGL and JavaScript take over from there.
                </p>
                <p>
                    There are some websites today (mostly games) that are totally WebGL.  Inside the body they have a 
                    single div.  The entire page is WebGL.  
                </p>
                <div class="snippetBox">
                    <ul>
                        <li>&lt;div id="myFrame" class="frame"></li>
                        <li>&lt;/div></li>
                    </ul>
                </div>
                <a href="#Index" class="pull-right">Back To Index</a>
            </div>
            <hr />
            <div id="Section5">
                <h3>5. &nbsp; JavaScript Program</h3>
                <a href="#Index" class="pull-right">Back To Index</a>



                <p>
                    The JavaScript is best looked at by the source code reference. There are several things to observe in this code.
                </p>
                <h4>General Outline</h4>
                <p>
                    The general design of all WebGL/three.js programs is as follows
                </p>
                <ol>
                    <li>Instantiate a Renderer</li>
                    <li>Link Renderer to HTML</li>
                    <li>Instantiate a Scene</li>
                    <li>Instantiate a Camera</li>
                    <li>Link Scene and Camera to Renderer</li>
                    <li>Instantiate a Light</li>
                    <li>Link Light to Scene</li>
                    <li>Load Object into Scene</li>
                </ol>
                <p>
                    The Light, Objects, and Camera can then be setup and modified in real time for animation.  Additional
                    Lights and Objects can also be added and deleted from the scene at will.
                </p>
                <h4>Objects and Loaders</h4>
                <p>
                    There are many types of loaders.  Some work much better than others.  All objects in WebGL are 3D.  
                    In WebGL all objects are made up of very small flat 3D triangles that have color and properties of how 
                    they respond to light.
                </p>
                <p>
                    Drawing programs save files in many different formats.  Even three.js has its own internal format which they 
                    prefer.  Three.js has over a dozen loaders that convert a file into their format and push it to the GPU.
                </p>
                <p>
                    Several drawing programs also have addins available so they can export to a format compatible with WebGL.  The 
                    entire thing is very messy and time consuming.
                </p>
                <p>
                    For this demo I used some geometries built into three.js.  It let me avoid the problems of drawing programs 
                    and loaders but made the java script much longer.
                </p>
                <h4>Continuous Motion</h4>
                <p>
                    The continuous move script is fairly straight forward. Function “playStart” sets the speed and flags that 
                    coordinate it with other states of operation.  “playStart” call “play”.  “play” loops on itself indexing 
                    the angle for every frame.  “requestAnimationFrame” is a built function that attempts by default to maintain 
                    a 60 frame per second rate.  It is optimized to require minimal processor support.  When continuous running 
                    is stopped or paused this looping program is terminated.

                </p>
                <h4>Move To Angle</h4>
                <p>
                    The basic outline of the move is similar to continuous run.  In this case function “moveStart” sets the speed 
                    and flags that coordinate it with other states of operation.  “playStart” call “move”.  “moveStart” also has 
                    the task of retrieving the target angle from the HTML page.  Simarlary, “move” loops on itself indexing the 
                    angle for every frame.  “move” has addional duties to insure it stops exactly on the target angle.  It also 
                    must index the objects in either the positive of negative direction depending the relative position of the 
                    current and final angles.
                </p>
                <h4>Future</h4>
                <p>
                    For the future I am sure the code could be optimized.  Internally everything works in radians.  To be friendlier 
                    the operator enters things in degrees.  Just dealing with the units better could eliminated some excess code.
                </p>




            </div>
            <hr />
            <div id="Section6">
                <h3>6. &nbsp; Problems Encountered</h3>
                <p>
                    The most difficult part of this problem was drawing the initial image. The tools for drawing 3D graphics 
                    are fairly complex. Blender is the most popular free one. Its learning curve required more time than I
                    had. I ended up using cylinders and boxes that are built into three.js. They made for several overlapping 
                    shapes that provided the proper outward appearance.
                </p>
                <p>
                    The second major problem was getting a consistent time base for the animation. In IE the calibration is 
                    close but can easily be slowed down by other things going on in the computer that slow the frame rate 
                    from 60fps. 60fps is recognized at the best rate for smooth graphic animation. In Chrome everything 
                    functionally worked great with no problems. The frame rate cannot keep up with 60fps and animation runs 
                    much slower. Research shows that this is pervasive problem with Chrome.
                </p>
                <a href="#Index" class="pull-right">Back To Index</a>
            </div>
            <hr />
            <div id="Conclusions">
                <h3>7. &nbsp; Conclusions</h3>
                <p>
                    Working with WebGL and three.js provided a working solution surprisingly quick.  
                    It took considerably less time than the CSS keyframe demo.  The demo that I did 
                    was about the most complex possible one that can be done with CSS keyframes.  It 
                    was only 2D in CSS.
                    With WebGL the demo was not a trivial but still was fairly simple one.  There is 
                    much much more that can be done with WebGL and it can be done in 3D.                
                </p>
                <a href="#Index" class="pull-right">Back To Index</a>
            </div>
            <hr />
            <div id="Source">
                <h3>8. &nbsp; Source Code </h3>
                <a href="../../../fileview/Default.aspx?~/myProject/Animation_WebGL.aspx" target="_blank">View Source: Animation_WebGL.aspx</a>
                <br />
                <a href="../../../fileview/Default.aspx?~/myProject/Animation_WebGL.js" target="_blank">View Source: Animation_CSS.js</a>
                <br />
                <a href="../../../fileview/Default.aspx?~/myProject/myProjectTheme.css" target="_blank">View Source: myProjectTheme</a>
                <p></p>
                <a href="#Index" class="pull-right">Back To Index</a>
            </div>
            <hr />
            <div id="References">
                <h3>9. &nbsp; References</h3>
                <a href="http://www.w3schools.com/svg/default.asp" target="_blank">w3schools SVG Tutorial</a>
                <p>I continue to find this to be one of the best online references for many web technologies.</p>
                <a href="http://threejs.org/" target="_blank">Threejs.org</a>
                <p>
                    This JavaScript allows work with WebGL in JavaScript to be much easier. The documentation on the
                    site was very helpful.
                </p>
                <p>
                    This page often does not open the first time.  Hit refresh an it will open.  Either there server 
                    is having problems or they put to many pictures on the same page and it times out in some web servers.  
                    After some things have been buffered then it seems to always open the second time.  
                </p>
                <a href="https://www.packtpub.com/web-development/threejs-cookbook" target="_blank">Three.js Cookbook</a>
                <p>
                    This book provided a lot of working examples.  The author has published several books with this 
                    publisher on three.js.  They are all entry level books that have different formats the publisher 
                    has established.  I chose it because it is one of the newest ones and reasonably priced.
                </p>
                <p>
                    Note that you will find it cheaper on the publishers website than Amazon.  The publisher also has a 
                    reasonable rental/subscription option.
                </p>
                <a href="http://www.creativebloq.com/3d/30-amazing-examples-webgl-action-6142954" target="_blank">30 Amaxing examples of WebGL in action.
                </a>
                <p>This page provided me with inspiration.</p>
                <a href="#Index" class="pull-right">Back To Index</a>
            </div>
            <hr />

            <div>
                <p style="float: right">&copy; 2015 Michael Barb, MSCS, Northeastern Univ.</p>
            </div>

        </div>
    </form>
</body>
</html>
