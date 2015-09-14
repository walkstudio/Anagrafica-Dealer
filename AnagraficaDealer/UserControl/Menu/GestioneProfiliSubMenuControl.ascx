<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GestioneProfiliSubMenuControl.ascx.cs" Inherits="Spindox.AnagraficaDealer.UserControl.GestioneProfiliSubMenuControl" %>


<div id="subMenu" class="divRowSubMenu">
    <asp:ImageButton ID="aggiungiProfiloImageButton" runat="server" OnClick="aggiungiProfiloImageButton_Click" ToolTip="Aggiungi Profilo" CssClass="imgSubMenu" ImageUrl="~/Resources/Images/Amministrazione/add_active.png"></asp:ImageButton>
    <asp:ImageButton ID="modificaProfiloImageButton" runat="server" OnClick="modificaProfiloImageButton_Click" ToolTip="Modifica Profilo" CssClass="imgSubMenu" Enabled="false" ImageUrl="~/Resources/Images/Amministrazione/edit_disabled.png"></asp:ImageButton>
    <asp:ImageButton ID="eliminaProfiloImageButton" runat="server" OnClick="eliminaProfiloImageButton_Click" ToolTip="Elimina Profilo" CssClass="imgSubMenu" Enabled="false" ImageUrl="~/Resources/Images/Amministrazione/disable_disabled.png"></asp:ImageButton>

</div>