<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccessoNegato.aspx.cs" Inherits="Spindox.AnagraficaDealer.AccessoNegato" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript" src="Resources/Scripts/jquery.1.8.2.min.js"></script>
    <script type="text/javascript" src="Resources/Scripts/jquery-ui.1.9.1.min.js"></script>
    <script type="text/javascript" src="Resources/Scripts/gridviewScroll.js"></script>
    <script type="text/javascript" src="Resources/Scripts/AD-Scripts.js"></script>

    <link href="Resources/Stylesheets/AD-MasterPage.css" rel="stylesheet" />
    <link href="Resources/Stylesheets/AD-Popup.css" rel="stylesheet" />
    <link href="Resources/Stylesheets/AD-Stylesheet.css" rel="stylesheet" />
    <link href="Resources/Stylesheets/GridviewScroll.css" rel="stylesheet" />


    <!--[if lt IE 9]> 
       <link href="Resources/Stylesheets/AD-Stylesheet-ie8.css" rel="stylesheet" />
    <![endif]-->

    <!--[if !IE]><!-->

    <!--<![endif]-->


    <title>Anagrafica Dealer</title>
</head>
<body>
     <form id="form2" runat="server" defaultbutton="btnDisableEnter">
        <asp:Button ID="btnDisableEnter" runat="server" Text="" OnClientClick="return false;" Style="display: none;" />
        <div class="divHeaderTable">
            <div class="divRow">
                <div class="divHeaderLogoColumn">
                    <img id="imgLogo" runat="server" src="~/Resources/Images/Master/Logo_AD.png" />
                </div>
            </div>
            <div class="divContentRow">
                <div style="font-size: x-large; font-family: Arial; margin-top: 50px; text-align: center;">
                    <asp:Label ID="mexLabel" Text="ACCESSO NEGATO" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
