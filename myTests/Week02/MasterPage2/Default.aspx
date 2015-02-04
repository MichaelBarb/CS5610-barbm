<%@ Page Title="" Language="C#" 
    MasterPageFile="~/myTests/Week02/MasterPage2/MasterPage.master" 
    AutoEventWireup="true" 
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="idHeaderIcon" ContentPlaceHolderID="contentHeaderIcon" runat="Server">
    Icon
</asp:Content>
<asp:Content ID="idHeaderBody" ContentPlaceHolderID="contentHeaderBody" runat="Server">
    Master Page
</asp:Content>
<asp:Content ID="idNav" ContentPlaceHolderID="ContentNav" runat="Server">
    Navigation
</asp:Content>
<asp:Content ID="idBody" ContentPlaceHolderID="contentBody" runat="Server">
    Section
    <br />
    <br />
    This test took several days.  I learned several things in the progess:
    <ul>
        <li>Setting Up My First ASP site</li>
        <li>Master Pages</li>
        <li>Style Sheets</li>
        <li>Visual Studio Web Enviroment</li>
        <li>Visual Studio CCS Properies Window</li>
    </ul>
</asp:Content>
<asp:Content ID="idFooter" ContentPlaceHolderID="contentFooter" runat="Server">
    Footer
</asp:Content>
