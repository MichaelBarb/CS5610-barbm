﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myProject.aspx.cs" Inherits="myProject_myProject" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Client Based Animation</title>

    <link href="../myBootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../myBootstrap/css/bootstrap-theme.css" rel="stylesheet" />
    <link href="myProjectTheme.css" rel="stylesheet" />

    <script src="../Scripts/jquery-2.1.3.min.js"></script>
    <script src="../myBootstrap/js/bootstrap.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="titleGradient">
            <div class="titleContainer  jumbotron">
                <h1>Interactive<br />
                    Client Based Animation</h1>
                <br />
                <h3>CS5610 WebDevelopement Project</h3>
                <h3>Michael Barb</h3>
            </div>
        </div>
        <div class="container">
            <div>
                <h4>Summary</h4>
                <p>
                    This project explores interactive object animation implemented on the client.  The project deals with moving 
                    objects around on the screen.  It is more than just changing text styles or resizing boxes.   It 
                    is more than a video or streams of still frames most commonly seen. The client recalculates the 
                    new position and renders them on the screen.  Two very different approaches are explored. 
                </p>
                <br />
                <p>
                    Having the client do the heavy work of animation allows it to be very interactive. Starting, stopping, and pausing 
                    is explored but this can also be easily done with streaming animation.  Changing parameters and having the
                    animation respond much more flexibility than possible with client based animation.
                </p>
                <br />
                <p>
                    Having the client do the heavy work of animation is fairly new and not well defined by standards.  
                    Even when standards do exist the implantations are not always the same.  The project targets two 
                    browsers, Internet Explorer and Chrome.  Many of the differences were dealt with but there are often 
                    still some small differences.  On other browsers there may be considerable differences in how these 
                    demos work.
                </p>
            </div>
            <hr />
            <div class="row">
                <div class="col-sm-6">
                    <a href="Animation_CSS.aspx" target="_blank">
                        <h2>
                            <img src="../myImage/Logo-CSS3-520x245.jpg" height="72" width="54" />
                            CSS Animation
                        </h2>
                    </a>
                    <p>
                        This method uses only CSS3 for animation.  It uses a feature called @Keyframes.  
                        The feature allows one to set the CSS for the initial frame, several frames in between, 
                        and the final frame.  It provides a smooth transition between frames in time set in CSS.  
                        This exploration use JavaScript is used to set up and run the @Keyframes based on 
                        operator input.
                    </p>
                </div>
                <div class="col-sm-6">
                    <a href="Animation_WebGL.aspx" target="_blank">
                        <h2>
                            <img src="../myImage/WebGL_logo.png" />
                            WebGL Animation
                        </h2>
                    </a>
                    <p>
                        This method uses JavaScript to access a graphics accelerator.  Everything is drawn in a &lt;canvas>.  
                        WebGL provides the ultimate in performance and flexibility with excellent support for interactive 3D animation.  
                        It has wide support in most browsers but is much more complex than HTML/CSS for the programmer.
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                    <h2>Conclusions</h2>
                    <p>
                        Interactive CSS animation has an inconsistant implemetaion and should be avoided. Non-interactive CSS animation
                        is still a valid aternative. 
                    </p>
                    <p>
                        WebGL is well suit for any kind of interactive animation imagined.  It has a very large learning curve but 
                        there are libraries (three.js) that greatly simplify programming.  Still it is hampered by JavaScript being 
                        an untyped language and  missing many features of modern programming languages like Java and C#.  
                        While the results obtained with WebGL are impressive the libraries are huge.  In this experiment 400K.  
                        The download time may make it prohibitive.  Finally, browser and device support for WebGL is growing rapidly.  
                        Still, many older and cheaper mobile phones cannot handle it.  It is very difficult at this time to make a pro 
                        or con recomendation about WebGL but the future trend is pro.
                    </p>
                </div>
                <div class="col-sm-3"></div>
            </div>
            <div>
                <p style="float: right">&copy; 2015 Michael Barb, MSCS, Northeastern Univ.</p>
            </div>

        </div>
    </form>
</body>
</html>
