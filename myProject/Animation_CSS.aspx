<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Animation_CSS.aspx.cs" Inherits="myProject_Animation_CSS" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CSS Animation</title>
    <link href="../myBootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../myBootstrap/css/bootstrap-theme.css" rel="stylesheet" />
    <link href="myProjectTheme.css" rel="stylesheet" />

    <script src="../Scripts/jquery-2.1.3.min.js"></script>
    <script src="../myBootstrap/js/bootstrap.js"></script>
    <script src="../Scripts/jquery.keyframes.min.js"></script>
    <script src="Animation_CSS.js"></script>

    <style>
        .armImage {
            height: 40px;
            width: 140px;
            padding: 0;
            margin: 0;
            border: 0;
        }

        .arm1 {
            position: relative;
            height: 40px;
            width: 140px;
            padding: 0;
            margin: 0;
            border: 0;
            transform-origin: 20px 20px;
            -webkit-transform-origin: 20px 20px;
        }

        .arm2 {
            position: relative;
            height: 40px;
            width: 140px;
            padding: 0;
            margin: 0;
            border: 0;
            transform-origin: 20px 20px;
            -webkit-transform-origin: 20px 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="titleGradient">
            <div class="titleContainer jumbotron row ">
                <div class="col-sm-3">
                    <img src="../myImage/css3.svg" height="200" style="margin-top: 20px" />
                </div>
                <div class="col-sm-9">
                    <h1>Interactive<br />
                        CSS3 Animation</h1>
                    <br />
                    <h3>CS5610 WebDevelopement Project</h3>
                    <h3>Michael Barb</h3>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="frame">
                        <div class="arm1">
                            <img src="../myImage/RobotArm1.svg" class="armImage" />
                            <div class="arm2">
                                <img src="../myImage/RobotArm2.svg" class="armImage" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="text-center">
                        <h2>Control Animation</h2>
                        <button type="button" class="btn btn-success btn-lg" style="width: 200px" onclick="play()">Run Continous</button>
                        <button type="button" class="btn btn-success btn-lg" style="width: 200px" onclick="moveArms()">Move To Angle</button>
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
                                    <th>&nbsp;</th>
                                    <th class="text-center">Speed (sec)</th>
                                    <th class="text-center">Last Angle (deg)</th>
                                    <th class="text-center">New Angle (deg)</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><b>Arm 1</b></td>
                                    <td>
                                        <input type="text" id="arm1speedIn" value="2" /></td>
                                    <td>
                                        <p id="arm1angleLast"></p>
                                    </td>
                                    <td>
                                        <input type="text" id="arm1angleNewIn" value="90" /></td>
                                </tr>
                                <tr>
                                    <td><b>Arm 2</b></td>
                                    <td>
                                        <input type="text" id="arm2speedIn" value="2" /></td>
                                    <td>
                                        <p id="arm2angleLast"></p>
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
            <h3 class="text-center text-danger ">Warning!!!  May Not fully function in Chrome</h3>
            <h3 class="text-center text-danger ">Works properly in Internet Explorer</h3>
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
                            <h3>5. &nbsp; Initial CSS</h3>
                        </a>
                        <a href="#Section6">
                            <h3>6. &nbsp; JavaScript Program</h3>
                        </a>
                        <a href="#Section7">
                            <h3>7. &nbsp; Problems Encountered</h3>
                        </a>
                        <a href="#Section8">
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
                    Try changing the speeds while continuous motion is running.  When the button is pressed a second 
                    time it will reset the arms and run them at the new speeds.
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
                    The number of seconds to complete a motion.  In the case of Continuous motion it is the time 
                    for a complete 360° rotation of an arm.  For motion to an angle it is the time it will take 
                    to go from the start angle to the end angle.
                </p>
                <h5>Last Angle (deg) </h5>
                <p>
                    The starting angle of the last “Move To Angle”.  It is change as soon as a new move is started.
                </p>
                <h5>New Angle (deg) </h5>
                <p>
                    The new angle for the next or current move.  It can be changed while a motion is running so 
                    you can be ready to start the next motion.
                </p>
                <a href="#Index" class="pull-right">Back To Index</a>
            </div>
            <hr />
            <div id="Section2">
                <h3>2. &nbsp; CSS3 Animation Method</h3>
                <p>
                    CSS3 animations allows animation of most HTML elements without using JavaScript or Flash! 
                    CSS an animation lets an element gradually change from one style to another. 
                    You can change as many CSS properties you want, as many times you want. To use CSS3 animation, 
                    you must first specify some keyframes for the animation. 
                    Keyframes hold what styles the element will have at certain times.
                </p>
                <p>
                    When you specify CSS styles inside the @keyframes rule, the animation will gradually change from 
                    the current style to the new style at certain times. To get an animation to work, you must bind 
                    the animation to an element. (The previous 2 paragraphs come from w3schools.com)
                </p>
                <p>
                    Keyframes can also be used without using JavaScript.  They will start after the page is loaded and 
                    either run to completion, run a preset number of time, or run continuously.               
                </p>
                <p>
                    With JavaScript you can start, pause, and stop keyframe animation.  You can also change any of the 
                    values in the @keyframes rule.
                </p>
                <a href="#Index" class="pull-right">Back To Index</a>
            </div>
            <hr />
            <div id="Section3">
                <h3>3. &nbsp; jQuery.keyframes</h3>
                <p>
                    jQuery.keyframes is a jQuery plugin that makes dealing with keyframes in JavaScript easier.  There is 
                    still a lot of JavaScript that must be written by the developers but it streamlines many of the messy 
                    details.  It can be found from the link in References
                </p>
                <p>
                    jQuery.keyframes is a fairly new addin and is under active development.  It works well in Internet Explorer 
                    but still has some problems with Chrome.  There are several differences in how the two browsers handle 
                    keyframe animation.  The addin tries very hard to deal with the differences in the browsers but sometimes 
                    it is impossible to accomplish.  
                </p>
                <a href="#Index" class="pull-right">Back To Index</a>
            </div>
            <hr />
            <div id="Section4">
                <h3>4. &nbsp; HTML Program</h3>
                <p>
                    The HTML program looks simple but has many complex features.  A div is created for each arm.  
                    A svg image is displayed in each div.  It is important to note that arm2 is nested inside of arm1.  
                    This results in the orientation of arm2 to be relative to the current orientation of arm1.  
                </p>
                <p>
                    For example.  Hit the button “Move to Angle” for the default 90 degree angles.  You can see how arm1 
                    moves clockwise 90 degrees and how arm2 moves 90 degrees relative to arm1.
                </p>
                <div class="snippetBox">
                    <ul>
                        <li>&lt;div class="frame"></li>
                        <li>&nbsp; &nbsp; &lt;div class="arm1"></li>
                        <li>&nbsp; &nbsp;  &nbsp; &nbsp; &lt;img src="../myImage/RobotArm1.svg" class="armImage" /></li>
                        <li>&nbsp; &nbsp;  &nbsp; &nbsp; &lt;div class="arm2"></li>
                        <li>&nbsp; &nbsp;  &nbsp; &nbsp;  &nbsp; &nbsp; &lt;img src="../myImage/RobotArm2.svg" class="armImage" /></li>
                        <li>&nbsp; &nbsp;  &nbsp; &nbsp; &lt;/div></li>
                        <li>&nbsp; &nbsp; &lt;/div></li>
                        <li>&lt;/div></li>
                    </ul>
                </div>
                <p></p>
                <a href="#Index" class="pull-right">Back To Index</a>
            </div>
            <hr />
            <div id="Section5">
                <h3>5. &nbsp; Initial CSS</h3>
                <p>
                    Setting up the initial CSS turned out to be one of the most time consuming parts of this 
                    exploration.  There are many ways in CSS to accomplish the initial setup and basic animation. 
                    Things to work in IE but in Chrome they would be different.  Fixing them in Chrome would then 
                    break them in IE.  After several iterations, not surprisingly, the simplest setup turned out 
                    to be the one that worked best in both.
                </p>
                <p>
                    First everything was put in a frame.  This reserved a space and prevented the animation from 
                    over writing other things on the page.  It also looked nice.
                </p>
                <p>
                    The first thing was strip all the images and div’s down to their minimum with no padding, margin, 
                    or borer.  They also needed to be set to their minimum size. You need to be able to handle the 
                    object and absolutely nothing but the object.
                </p>
                <p>
                    Since you want the arm2 to move relative to arm1 you need to insure its position is set relative.  
                    The position setting for arm1 could be either relative or absolute.  Since it is the base object.  
                    I set it relative for consistency.  
                </p>
                <p>
                    Finally the transform-origin needed to be set.  By default it is on the corner of the object.  It
                    was moved in to place it on the center of the pin in the object.  
                </p>
                <p>
                    Chrome does not implement animation natively like IE.  It uses an open source layout engine called 
                    WebKit.  WebKit is also used by Apple’s Safari.  If a browser sees a instruction that it does not 
                    understand it simply ignores it.  The setting needed to be repeated for different browsers.  For IE 
                    the command also is used.  For Chrome it requires the prefix “-webkit-“.  
                </p>
                <p>
                    One the main problems jQuery.keyframes tries to solve is deciding when to provide a prefix.  
                    It is mostly successful but not always.               
                </p>
                <p>
                    Note the initializing CSS styles are included in the HTML file.  This is done for clarity.  Also it seems to 
                    be common practice in many animation pages for initial setups.
                </p>
                <div class="snippetBox">
                    <ul>
                        <li>&lt;style></li>
                        <li>&nbsp; &nbsp; .armImage {</li>
                        <li>&nbsp; &nbsp;  &nbsp; &nbsp; height: 40px;</li>
                        <li>&nbsp; &nbsp;  &nbsp; &nbsp; width: 140px;</li>
                        <li>&nbsp; &nbsp;  &nbsp; &nbsp; padding: 0;</li>
                        <li>&nbsp; &nbsp;  &nbsp; &nbsp; margin: 0;</li>
                        <li>&nbsp; &nbsp;  &nbsp; &nbsp; border: 0;</li>
                        <li>&nbsp; &nbsp; }</li>
                        <li>&nbsp; &nbsp; .arm1 {</li>
                        <li>&nbsp; &nbsp;  &nbsp; &nbsp; position: relative;</li>
                        <li>&nbsp; &nbsp;  &nbsp; &nbsp; height: 40px;</li>
                        <li>&nbsp; &nbsp;  &nbsp; &nbsp; width: 140px;</li>
                        <li>&nbsp; &nbsp;  &nbsp; &nbsp; padding: 0;</li>
                        <li>&nbsp; &nbsp;  &nbsp; &nbsp; margin: 0;</li>
                        <li>&nbsp; &nbsp;  &nbsp; &nbsp; border: 0;</li>
                        <li>&nbsp; &nbsp;  &nbsp; &nbsp; transform-origin: 20px 20px;</li>
                        <li>&nbsp; &nbsp;  &nbsp; &nbsp; -webkit-transform-origin: 20px 20px;</li>
                        <li>&nbsp; &nbsp; }</li>
                        <li>&nbsp; &nbsp; .arm2 {</li>
                        <li>&nbsp; &nbsp;  &nbsp; &nbsp; position: relative;</li>
                        <li>&nbsp; &nbsp;  &nbsp; &nbsp; height: 40px;</li>
                        <li>&nbsp; &nbsp;  &nbsp; &nbsp; width: 140px;</li>
                        <li>&nbsp; &nbsp;  &nbsp; &nbsp; padding: 0;</li>
                        <li>&nbsp; &nbsp;  &nbsp; &nbsp; margin: 0;</li>
                        <li>&nbsp; &nbsp;  &nbsp; &nbsp; border: 0;</li>
                        <li>&nbsp; &nbsp;  &nbsp; &nbsp; transform-origin: 20px 20px;</li>
                        <li>&nbsp; &nbsp;  &nbsp; &nbsp; -webkit-transform-origin: 20px 20px;</li>
                        <li>&nbsp; &nbsp; }</li>
                        <li>&lt;/style></li>
                    </ul>
                </div>
                <p></p>
                <a href="#Index" class="pull-right">Back To Index</a>
            </div>
            <hr />
            <div id="Section6">
                <h3>6. &nbsp; JavaScript Program</h3>
                <p>
                    The JavaScript is best looked at by the source code reference.  There are several things to 
                    observe in this code.
                </p>
                <p>
                    First note how jQuery.keyframes tries to make the format of the JavaScript keyframes similar 
                    to how they would appear in CSS.  This makes the transition from hard coded CSS to JavaScript 
                    coded CSS reasonably easy.  It mostly lets one follow other documentation on CSS keyframes.
                </p>
                <h4>Continous Motion</h4>
                <p>
                    The continuous move keyframe is fairly straight forward.  The only difficult part is the
                    wrap-around of the angle from 360° to 0°.  Two methods are demonstrated.  For arm1 the angle 
                    is moved to 180° in 50% of the time.  In 0.001% of the time the angle is changed to -180°.  
                    For arm2 the angle is moved to 360° in 99.9999% of the time.  In the last 0.0001% of the time
                    it is move to 0°.  In both cases the reset is too fast for the screen to update and the eye 
                    to detect so motion looks continuous.
                </p>
                <h4>Move To Angle</h4>
                <p>
                    The single move to angle requires 2 keyframes to be setup and alternate between them.  When 
                    an object is tied to a keyframe and its motion is complete and it is told to remain in the 
                    last position it is undefined by spec what happens next.  Even with in a given browser what 
                    happens next is not consistent.  (1)At times in some cases the object stays put and the 
                    keyframe is unlinked to the object.  Most of the time the object remains attached.  (2)When the 
                    “to” position is changed sometimes the object will jump the new position.  (3)Sometimes the 
                    object will move slowly to the new “to” position.  (4)When the “from” position is changed sometimes
                    nothing will happen.  (5)Sometimes the object will jump to the new “from” position and move 
                    slowly to the end position.  Of the 5 possibilities what happens is random.  Trying to change 
                    hem both at the same time results in one of the same 5 random possibilities.  This inconsistent 
                    behavior was observed in both IE and Chrome.
                </p>
                <p>
                    If you unattached the keyframe then it will return to the position initially position defined 
                    in the page so that is not a solution.  After considerable thought it was found that if you 
                    have 2 keyframes.  At any time only one will be attached to the object.  The unattached frame 
                    can then be edited without affecting the object.  The last “to” position is put into the new 
                    “from” postion.  The new “to” position can then be set as desired.  The object can then be 
                    attached to the new frame and motion can be run as expected.
                </p>
                <p>
                    This solution was new to the developer of jQuery.keyframe.  Web searched showed that others had 
                    similar problems.  I could find no documentation that anyone had found a solution.
                </p>
                <h4>Future</h4>
                <p>
                    For the future it would be interesting to try setting the position of the object at its final 
                    position via regular CSS much like was done when the page was loaded.  Then the object could be 
                    unlinked from the keyframe and should not move.  The keyframe could then be edited and reconnected.  
                    I had a working solution and did not have time to test this approach.
                </p>
                <a href="#Index" class="pull-right">Back To Index</a>
            </div>
            <hr />
            <div id="Section7">
                <h3>7. &nbsp; Problems Encountered</h3>
                <p>
                    The most difficult part of this problem is browser compatibility.  Only 2 browsers were targeted.  
                    Not all issues could be dealt with.  Trying to test with more browsers would have made things even worse.
                </p>
                <p>
                    The second major problem was in dealing with editing keyframes after they had already be done once.  
                    A solution was found but it was a hack in many ways.
                </p>
                <a href="#Index" class="pull-right">Back To Index</a>
            </div>
            <hr />
            <div id="Section8">
                <h3>8. &nbsp; Conclusions</h3>
                <p>
                    For non-interactive animation, CSS keyframes is a reasonable option. Interactive animation, CSS with keyframes 
                    should be avoided.  Some details of the specs are not totally complete.  Implementations are not consistant.  
                </p>
                <p>
                    jQuery.keyframes is a reasonably robust and effiecient solution if you want to deal with keyframes in JavaScript. 
                </p>
                <a href="#Index" class="pull-right">Back To Index</a>
            </div>
            <hr />
            <div id="Source">
                <h3>9. &nbsp; Source Code </h3>
                <a href="../../../fileview/Default.aspx?~/myProject/Animation_CSS.aspx" target="_blank">View Source: Animation_CSS.aspx</a>
                <br />
                <a href="../../../fileview/Default.aspx?~/myProject/Animation_CSS.js" target="_blank">View Source: Animation_CSS.js</a>
                <br />
                <a href="../../../fileview/Default.aspx?~/myProject/myProjectTheme.css" target="_blank">View Source: myProjectTheme</a>
                <br />
                <a href="../../../fileview/Default.aspx?~/myImage/RobotArm1.svg" target="_blank">View Source: RobotArm1.svg</a>
                <br />
                <a href="../../../fileview/Default.aspx?~/myImage/RobotArm2.svg" target="_blank">View Source: RobotArm2.svg</a>
                <p></p>
                <a href="#Index" class="pull-right">Back To Index</a>
            </div>
            <hr />
            <div id="References">
                <h3>10. &nbsp; References</h3>
                <a href="http://www.w3schools.com/svg/default.asp" target="_blank">w3schools SVG Tutorial</a>
                <p>I continue to find this to be one of the best online references for many web technologies.</p>
                <a href="http://jquerykeyframes.github.io/jQuery.Keyframes/" target="_blank">jQuery.Keframe</a>
                <p>This JavaScrip allows you work with Keyframes in JavaScript.</p>
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
