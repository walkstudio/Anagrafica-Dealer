<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Archivio.aspx.cs" Inherits="Spindox.AnagraficaDealer.Archivio" %>
<%@ Register src="UserControl/Menu/ArchivioSubMenuControl.ascx" tagname="ArchivioSubMenuControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContentPlaceHolder" runat="server">
     <script type="text/javascript">
         window.onload = function selectMenuTab() {
             document.getElementById('divMenuArchivio').className = "divMenuSelectedTab";
         }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <uc1:ArchivioSubMenuControl ID="ArchivioSubMenuControl" runat="server" />
</asp:Content>
