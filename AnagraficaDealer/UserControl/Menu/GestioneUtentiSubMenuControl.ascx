<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GestioneUtentiSubMenuControl.ascx.cs" Inherits="Spindox.AnagraficaDealer.UserControl.GestioneUtentiSubMenuControl" %>

<div id="subMenu" class="divRowSubMenu">
    <asp:ImageButton ID="btnAggiungiImageButton" runat="server" OnClick="btnAggiungiImageButton_Click" ToolTip="Aggiungi Utente" CssClass="imgSubMenu" ImageUrl="~/Resources/Images/Amministrazione/add_active.png"></asp:ImageButton>
    <asp:ImageButton ID="btnModificaImageButton" runat="server" OnClick="btnModificaImageButton_Click" ToolTip="Modifica Utente" CssClass="imgSubMenu" Enabled="false" ImageUrl="~/Resources/Images/Amministrazione/edit_disabled.png"></asp:ImageButton>
    <asp:ImageButton ID="btnEliminaImageButton" runat="server" OnClick="btnEliminaImageButton_Click" ToolTip="Attiva/Disattiva Utente" CssClass="imgSubMenu" Enabled="false" ImageUrl="~/Resources/Images/Amministrazione/disable_disabled.png"></asp:ImageButton>

</div>