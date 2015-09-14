<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RicercaSubMenuControl.ascx.cs" Inherits="Spindox.AnagraficaDealer.UserControl.Menu.RicercaSubMenuControl" %>


<div id="subMenu" class="divRowSubMenu">
    <div id="ricercaBaseSubMenu" runat="server" class="divSubMenuTab" onclick="goTo('Ricerca.aspx');">
        <label id="ricercaBaseLabel" class="labelSubMenu">RICERCA BASE</label>
    </div>
<%--    <div id="ricercaAvanzataSubMenu" runat="server" class="divSubMenuTab" onclick="goTo('DettaglioDealer.aspx'); ">
        <label id="ricercaAvanzataLabel" class="labelSubMenu">Ricerca Avanzata</label>
    </div>--%>
        <div id="dettaglioDealerSubMenu" runat="server" class="divSubMenuTab" onclick="goTo('DettaglioDealer.aspx'); ">
        <label id="dettaglioDealerLabel" class="labelSubMenu">DETTAGLIO DEALER</label>
    </div>
</div>