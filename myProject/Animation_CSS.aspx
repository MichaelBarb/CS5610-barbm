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
            position: absolute;
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
                    <%--<img src="../myImage/Logo-CSS3-520x245.jpg" />--%>
                    <img src="../myImage/css3.svg" height="200" style="margin-top: 20px" />
                </div>
                <div class="col-sm-9">
                    <h1>CSS3 Animation</h1>
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
                        <!--<button type="button" class="btn btn-success btn-lg" style="width:200px" onclick="moveArmsUpdate()">Update Keyframes</button>-->
                        <button type="button" class="btn btn-success btn-lg" style="width: 200px" onclick="moveArms()">Move To Angle</button>
                        <br />
                        <br />
                        <button type="button" class="btn btn-primary" onclick="pauseFrame()">Pause</button>
                        <button type="button" class="btn btn-primary" onclick="resumeFrame()">Resume</button>
                        <button type="button" class="btn btn-warning" onclick="resetFrame()">Reset</button>
                    </div>
                    <div class="text-center">
                        <h2>Setup Animation</h2>
                        <div class="row">
                            <%--<div class="col-sm-3"></div>--%>
                            <%--<div class="col-sm-6">--%>
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
                                            <input type="text" id="arm1angleNewIn" value="45" /></td>
                                    </tr>
                                    <tr>
                                        <td><b>Arm 2</b></td>
                                        <td>
                                            <input type="text" id="arm2speedIn" value="2" /></td>
                                        <td>
                                            <p id="arm2angleLast"></p>
                                        </td>
                                        <td>
                                            <input type="text" id="arm2angleNewIn" value="45" /></td>
                                    </tr>
                                </tbody>
                            </table>
                            <%--</div>--%>
                            <div class="col-sm-3"></div>
                        </div>
                        <br />
                        <br />
                        Callback count: <b id="cb">0</b>
                        <br />
                    </div>
                </div>
            </div>
            <hr />
            <div>
                <h3>CSS3 Animation Method</h3>
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
            </div>
            <hr />
            <div>
                <h3>jQuery.keyframes</h3>
            </div>
            <hr />
            <div>
                <h3>HTML Program</h3>
            </div>
            <hr />
            <div>
                <h3>JavaScript Program</h3>
            </div>
            <hr />
            <div>
                <h3>Browser Compatibility</h3>
            </div>
            <hr />
            <div>
                <h3>Problems Encountered</h3>
            </div>
            <hr />
            <div>
                <h3>Conclusions</h3>
            </div>
            <hr />
            <div id="Source">
                <h3>Source Code </h3>
                <a href="../../../fileview/Default.aspx?~/myProject/Animation_CSS.aspx" target="_blank">View Source: Animation_CSS.aspx</a>
                <br />
                <a href="../../../fileview/Default.aspx?~/myProject/Animation_CSS.js" target="_blank">View Source: Animation_CSS.js</a>
                <br />
                <a href="../../../fileview/Default.aspx?~/myProject/myProjectTheme.css" target="_blank">View Source: myProjectTheme</a>
                <br />
                <a href="../../../fileview/Default.aspx?~/myImage/RobotArm1.svg" target="_blank">View Source: RobotArm1.svg</a>
                <br />
                <a href="../../../fileview/Default.aspx?~/myImage/RobotArm2.svg" target="_blank">View Source: RobotArm2.svg</a>
                <br />
            </div>
            <hr />
            <div id="References">
                <h3>References</h3>
                <a href="http://www.w3schools.com/svg/default.asp" target="_blank">w3schools SVG Tutorial</a>
                <p>I continue to find this to be one of the best online references for many web technologies.</p>
                <a href="http://jquerykeyframes.github.io/jQuery.Keyframes/" target="_blank">jQuery.Keframe</a>
                <p>This JavaScrip allows you work with Keyframes in JavaScript.</p>
            </div>
            <hr />

            <div>
                <p style="float: right">&copy; 2015 Michael Barb, MSCS, Northeastern Univ.</p>
            </div>

        </div>
    </form>
</body>
</html>
