<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PageLinks2Window.aspx.cs" Inherits="PageLinks2Window" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>7 Ways To Open HTML Page</h1>
        </div>
        <hr />
        <div>
            <h4>About this experiment</h4>
            <p>
                In this experiment, I performed opening of a new HTML page 
                in 7 different ways.
            </p>
            <ul>
                <li>All 4 possible values for target.</li>
                <li>Without target so it would go to the default.</li>
                <li>Using an emebeded JavaScrip method so it would open in a new window.</li>
            </ul>
            <p>
                It expands on the previous experiment adding 2 additional 
                methods to open a page in a seperate window.
            </p>
        </div>
        <hr />
        <div>
            <div>
                <h3>1. Open the new page in new tab window.</h3>
                <p>target = "_blank"</p>
                <a href="PageToOpen.html" target="_blank">Run Test</a>
            </div>
            <br />
            <div>
                <h3>2. Open the new page in same tab one level higher in story frame.</h3>
                <p>target = "_parent"</p>
                <a href="PageToOpen.html" target="_parent">Run Test</a>
            </div>
            <br />
            <div>
                <h3>3. Open the new page in same tab completely out of story frames.</h3>
                <p>target = "_top"</p>
                <a href="PageToOpen.html" target="_top">Run Test</a>
            </div>
            <br />
            <div>
                <h3>4. Open the new page in same tab at same level in story frames.</h3>
                <p>target = "_self"</p>
                <a href="PageToOpen.html" target="_self">Run Test</a>
            </div>
            <br />
            <div>
                <h3>5. Open the new page in same tab at same level in story frames.</h3>
                <p>Default Target same as "_self"</p>
                <a href="PageToOpen.html">Run Test</a>
            </div>
            <br />
            <div>
                <h3>6. Open in New Window fixed size without tabs.</h3>
                <p>Uses embeded javascript window.open method.  Arguments are 'width=300, height=250'</p>
                <a href="PageToOpen.html"
                    onclick="window.open('PageToOpen.html', 
                                     'newwindow', 
                                     'width=300, height=250');
                                     return false;">Run Test</a>
            </div>
            <br />
            <div>
                <h3>7. Open it's self in New Window, resize and scroll, no tabs.</h3>
                <p>Uses embeded javascript window.open method.  Arguments are 'scrollbars=yes, resizable=yes'</p>
                <a href="HyperLinks.aspx"
                    onclick="window.open('HyperLinks.aspx', 
                                     'newwindow', 
                                     'scrollbars=yes, resizable=yes');
                                     return false;">Run Test</a>
            </div>
            <br />
        </div>
        <hr />
        <div>
            <h4>Source Code </h4>
            <a href="../../fileview/Default.aspx?~/myTests/Week02/PageLinks2Window.aspx" target="_blank">View Source</a>
        </div>
        <hr />
        <div>
            <h4>References</h4>
            <a href="http://stackoverflow.com/questions/12939928/make-a-link-open-a-new-window-not-tab" target="_blank">Stack Overflow: Open link in New window</a>
            <br />
            <a href="http://www.w3schools.com/jsref/met_win_open.asp" target="_blank">W3 Schools: Window open() Method</a>
            <br />
            <a href="http://net4.ccs.neu.edu/home/rishi11/Experiments/HTML/openingPage.htm" target="_blank">Experiment from Rishi Katyal's CS5610 Website</a>
            <hr />
        </div>
    </form>
</body>
</html>
