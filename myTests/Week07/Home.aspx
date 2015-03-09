<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="myTests_Week07_Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page With Bootstrap</title>
    <link href="../../myBootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../myBootstrap/css/bootstrap-theme.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <!-- Navbar -->
    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand text-muted" href="#">Toko</a> 
        <div class="collapse navbar-collapse">
           <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#">About Toko</a></li>
            <li class="dropdown">
              <a data-toggle="dropdown" data-target="#">MintLabs<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="#">About MintLabs</a></li>
                <li><a href="#">Download the App</a></li>
                <li><a href="#">Buy the Book</a></li>
                <li class="divider"></li>
                <li><a href="#">Plans & Pricing</a></li>
              </ul>
            </li>
            <li><a href="#textModal" data-toggle="modal" data-target="#textModal">Sign Up</a></li>
          </ul>
        </div>
      </div>
    </div>
    <!-- End Navbar -->
    </form>
</body>
</html>
