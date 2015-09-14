<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GestioneImportEccezioniSubMenuControl.ascx.cs" Inherits="Spindox.AnagraficaDealer.UserControl.GestioneImportEccezioniSubMenuControl" %>

<div id="subMenu" class="divRowSubMenu">
    <asp:ImageButton ID="btnAggiungiEccImageButton" runat="server" OnClick="btnAggiungiImageButton_Click" ToolTip="Aggiungi Eccezione Import" CssClass="imgSubMenu" ImageUrl="~/Resources/Images/Amministrazione/add1_active.png"></asp:ImageButton>
    <asp:ImageButton ID="btnModificaEccImageButton" runat="server" ToolTip="Modifica Utente" CssClass="imgSubMenu" Enabled="false" ImageUrl="~/Resources/Images/Amministrazione/edit_disabled.png" Visible="false"></asp:ImageButton>
    <asp:ImageButton ID="btnEliminaEccImageButton" runat="server"  ToolTip="Elimina Utente" CssClass="imgSubMenu" Enabled="false" ImageUrl="~/Resources/Images/Amministrazione/disable_disabled.png" Visible="false"></asp:ImageButton>


</div>