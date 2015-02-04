<%@ Page Title="" Language="C#" MasterPageFile="~/myTests/Week02/MasterPage/MasterPage.master"
    AutoEventWireup="true" CodeFile="MasterPage.aspx.cs" Inherits="MasterPage_ASPX" %>

<asp:Content ID="Content1" ContentPlaceHolderID="contentHeaderIcon" runat="Server">
    Icon
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="contentHeaderBody" runat="Server">
    Master Page
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentNav" runat="Server">
    Navigation
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="contentBody" runat="Server">
    <div>
        <p>
            Section
        </p>
        <br />
        <p>
            This test took several days.  I learned several things in the progess:
        </p>
        <ul>
            <li>Setting Up My First ASP site</li>
            <li>Master Pages</li>
            <li>Style Sheets</li>
            <li>Visual Studio Web Enviroment</li>
            <li>Visual Studio CCS Properies Window</li>
        </ul>
    </div>
    <hr />
    <div>
        <h4>View Code </h4>
        <p>
            <a href="../../../fileview/Default.aspx?~/myTests/Week02/MasterPage/MasterPage.aspx"
                target="_blank">Source: MasterPage.aspx</a>
        </p>
        <p>
            <a href="../../../fileview/Default.aspx?~/myTests/Week02/MasterPage/MasterPage.master"
                target="_blank">Source: MasterPage.master</a>
        </p>
        <p>
            <a href="../../../fileview/Default.aspx?~/myTests/Week02/MasterPage/MasterPage.css"
                target="_blank">Source: MasterPage.css</a>
        </p>
        <p>
            <a href="../../../story/showfile.htm?../myTests/Week02/MasterPage/MasterPage.aspx"
                target="_blank">Result :  MasterPage.aspx</a>
        </p>
    </div>
    <hr />
    <div>
        <h4>References</h4>
        <a href="http://www.apress.com/9781430242512?gtmf=s" target="_blank">Beginning ASP.NET 4.5 in C#</a>
        <p>This book also available from library from SpringerLink Books</p>
    </div>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="contentFooter" runat="Server">
    Footer
</asp:Content>
