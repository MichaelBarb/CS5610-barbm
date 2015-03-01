<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CodeBehind.aspx.cs" Inherits="myTests_Week06_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!--<link href="../../myCSS/html5reset-1.6.1.css" rel="stylesheet" />-->
    <link href="../../myCSS/myTheme.css" rel="stylesheet" />
    <link href="../../Scripts/jquery-ui-1.11.3/jquery-ui.min.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-1.11.2.min.js"></script>
    <script src="../../Scripts/jquery-ui-1.11.3/jquery-ui.min.js"></script>
    <!--<link href="../../Scripts/jquery-ui-1.11.3/jquery-ui.theme.css" rel="stylesheet" />-->

    <meta name="description" content="Week 6 Experiments 1 to 4" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Code Behind</h1>
            <a href="#Exp1">
                <h4>Experiment 1: &nbsp; jQuery and jQuery-ui in ASPX</h4>
            </a>
            <a href="#Exp2">
                <h4>Experiment 2:&nbsp;&nbsp; Input To Code Behind Program</h4>
            </a>
            <a href="#Exp3">
                <h4>Experiment 3:&nbsp;&nbsp; Button Event To Code Behind Program</h4>
            </a>
            <a href="#Exp4">
                <h4>Experiment 4:&nbsp;&nbsp; Result Return From Code Behind Program</h4>
            </a>
            <a href="#Exp5">
                <h4>Experiment 5:&nbsp;&nbsp; Validated Input</h4>
            </a>
        </div>
        <hr />
        <div>
            <h3>Test</h3>
            <p>
                <input id="Input1" type="text" runat="server" />
                <%--<asp:CompareValidator ID="cv" runat="server"
                    ControlToValidate="Input1" Type="Integer"
                    Operator="DataTypeCheck"
                    ErrorMessage="Value must be an integer!" />--%>
            </p>
            <p>
                <input id="Input2" type="text" runat="server" />
                <%--<asp:CompareValidator ID="CompareValidator2" runat="server"
                    ControlToValidate="Input2" Type="Integer"
                    Operator="DataTypeCheck"
                    ErrorMessage="Value must be an integer!" />--%>
            </p>
            <p>
                <asp:Button ID="btnCalculate" runat="server" Text="Calculate" OnCommand="btnCalculate_Command" />
            </p>
            <asp:Label ID="Result" runat="server" Text="Result" />
        </div>
        <hr />
        <div>
            <h3>Summary</h3>
            <h4 id="Exp1">Experiment 1: &nbsp; jQuery and jQuery-ui in ASPX</h4>
            <p>
                This experiment added jQuery and jQuery to an ASPX page.  I did not expect this to have any 
                effect and was orginally not even going to make this an experimet.  I did fine one thing that
                come out differently.  ASPX use XHTML5 which is slightly different from HTML5 used in a 
                simpler HTML file.  

            </p>
            <p>
                It had an error that said that &lt;ul&gt; cannot be nested inside &lt;p&gt; The page ran in Internet Explorer but the snippet box came out differently.

            </p>
            <p>
                To get it come out right I had to change:
            </p>
            <div class="snippetBox">
                <ul class="snippetText">
                    <li>&lt;div class="snippetBox"></li>
                    <li>&nbsp; &nbsp; &lt;p class="snippetText"></li>
                    <li>&nbsp; &nbsp; &nbsp; &nbsp; &lt;ul></li>
                    <li>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &lt;li>...............</li>
                </ul>
            </div>
            <p>To:</p>
            <div class="snippetBox">
                <ul class="snippetText">
                    <li>&lt;div class="snippetBox"></li>
                    <li>&nbsp; &nbsp; &lt;ul class="snippetText"></li>
                    <li>&nbsp; &nbsp; &nbsp; &nbsp; &lt;li>...............</li>
                </ul>
            </div>
        </div>
        <div>
            <h4 id="Exp2">Experiment 2:&nbsp;&nbsp; Input to Code Behind Program</h4>
            <p>
                This experiment pushed data to the code behind program.&nbsp; It used a standard input field.&nbsp; It required 
                one important argument: runat=&quot;server&quot;.&nbsp; This pushed the data in the field back to the C# in the
                code behind.

            </p>
        </div>
        <div>
            <h4 id="Exp3">Experiment 3:&nbsp;&nbsp; Button Even to Code Behind Program</h4>
            <p>
                This experiment added an asp:Button. This button was pulled from the Toolbox.&nbsp; It provided the ability to add an event that was sent to the code behind.&nbsp; When the event was added it automatically set up the routine in the code behind.
            </p>
        </div>
        <div>
            <h4 id="Exp4">Experiment 4:&nbsp;&nbsp; Result Return From Code Behind Program</h4>
            <p>
                This experiment added an asp:Label to accept the data from the function activated by the button event. This button was pulled from the Toolbox.&nbsp; The asp:Label was set up so
                that it showed up in the C# program as nicely behaved object.
            </p>
        </div>
        <div>
            <h4 id="Exp5">Experiment 4:&nbsp;&nbsp; Validated Input</h4>
            <p>
                This experiment added validation to the input fields.&nbsp; 
                It checked to insure an integer was input.&nbsp; Without valdation 
                entry of a none number would crash the server.&nbsp; Also of interest
                is that when a field is not valid it disables the &quot;Calculate&quot; 
                button so it cannot even display an error message.
            </p>
            <p>
                ASP validation did not work on the schools server.  It id work OK localy.
                I had to add Validation to the code behind to prevent the page from crashsing.
            </p>
        </div>
        <div class="snippetBox">
            <ul class="snippetText">
                <li>&lt;input id="Input1" runat="server" type="text" /></li>
                <li>&nbsp; &nbsp; &lt;asp:CompareValidator ID="CompareValidator1" runat="server"</li>
                <li>&nbsp; &nbsp;  &nbsp; &nbsp; ControlToValidate="Input1" Type="Integer"</li>
                <li>&nbsp; &nbsp;  &nbsp; &nbsp; Operator="DataTypeCheck"</li>
                <li>&nbsp; &nbsp;  &nbsp; &nbsp; ErrorMessage="Value must be an integer!" /></li>
                <li>&lt;input id="Input2" runat="server" type="text" /></li>
                <li>&nbsp; &nbsp; &lt;asp:CompareValidator ID="CompareValidator2" runat="server"</li>
                <li>&nbsp; &nbsp;  &nbsp; &nbsp; ControlToValidate="Input2" Type="Integer"</li>
                <li>&nbsp; &nbsp;  &nbsp; &nbsp; Operator="DataTypeCheck"</li>
                <li>&nbsp; &nbsp;  &nbsp; &nbsp; ErrorMessage="Value must be an integer!" /></li>
                <li>&lt;asp:Button ID="btnCalculate0" runat="server" OnCommand="btnCalculate_Command" Text="Calculate" /></li>
                <li>&lt;asp:Label ID="Result0" runat="server" Text="Result"> /></li>
            </ul>
        </div>
        <h5 class="titleCenter">Import lines in Test</h5>
        <hr />
        <div>
            <h3>Source Code </h3>
            <a href="../../fileview/Default.aspx?~/myTests/Week06/CodeBehind.aspx" target="_blank">View Source: CodeBehind.aspx</a>
            <br />
            <a href="../../fileview/Default.aspx?~/myTests/Week06/CodeBehind.aspx.cs" target=" _blank">View Source: CodeBehind.aspx.cs</a>
        </div>
        <hr />
        <div>
            <h3>References</h3>
            <a href="http://www.apress.com/9781430242512?gtmf=s" target="_blank">Beginning ASP.NET 4.5 in C#</a>
            <p>This book also available from library from SpringerLink Books</p>
        </div>
        <hr />
    </form>
</body>
</html>
