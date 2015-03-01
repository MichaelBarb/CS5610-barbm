<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CodeBehind2.aspx.cs" Inherits="myTests_Week06_Default" %>

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
            <a href="#Exp6">
                <h4>Experiment 6:&nbsp;&nbsp; Validated Input</h4>
            </a>
        </div>
        <hr />
        <div>
            <h3>Test
            </h3>
            <p>
                <asp:TextBox ID="Input1" runat="server" />
                <%--<input id="Input1" type="text" runat="server" />--%>
                <asp:CompareValidator ID="cv" runat="server"
                    ControlToValidate="Input1" Type="Integer"
                    Operator="DataTypeCheck"
                    ErrorMessage="Value must be an integer!" />
            </p>
            <p>
                <asp:TextBox ID="Input2" runat="server" />
                <%--<input id="Input2" type="text" runat="server" />--%>
                <asp:CompareValidator ID="CompareValidator2" runat="server"
                    ControlToValidate="Input2" Type="Integer"
                    Operator="DataTypeCheck"
                    ErrorMessage="Value must be an integer!" />
            </p>
            <p>
                <asp:Button ID="btnCalculate" runat="server" Text="Calculate"
                    OnCommand="btnCalculate_Command" />
            </p>
            <asp:Label ID="Result" runat="server" Text="Result" />
        </div>
        <hr />
        <h3>Summary</h3>
        <div>
            <h4 id="Exp6">Experiment 4:&nbsp;&nbsp; Validated Input</h4>
            <p>
                This experiment 
                I change the input box to an asp:TextBox.&nbsp; The asp validation now works on the 
                server only after I hit the &quot;Calculate&quot; button.&nbsp; When run locally the 
                validation occurs when the field loses focus.&nbsp; However, validation does not 
                disable the button when on line like is does locally.&nbsp; The try-catch structure 
                in the code behind is still required to prevent crashing the page.
            </p>
        </div>
        <div class="snippetBox">
            <ul class="snippetText">
                <li>&lt;asp:TextBox ID="Input2" runat="server" /></li>
                <li>&nbsp; &nbsp; &lt;asp:CompareValidator ID="CompareValidator1" runat="server"</li>
                <li>&nbsp; &nbsp;  &nbsp; &nbsp; ControlToValidate="Input1" Type="Integer"</li>
                <li>&nbsp; &nbsp;  &nbsp; &nbsp; Operator="DataTypeCheck"</li>
                <li>&nbsp; &nbsp;  &nbsp; &nbsp; ErrorMessage="Value must be an integer!" /></li>
                <li>&lt;asp:TextBox ID="Input2" runat="server" /></li>
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
