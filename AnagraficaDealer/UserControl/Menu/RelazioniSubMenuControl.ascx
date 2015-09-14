<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RelazioniSubMenuControl.ascx.cs" Inherits="Spindox.AnagraficaDealer.UserControl.RelazioniSubMenuControl" %>


<div id="subMenu" class="divRowSubMenu">
    <div id="relazioniSubMenu" runat="server" class="divSubMenuTab" onclick="goTo('RicercaRelazioni.aspx');">
        <label id="relazioniTab" class="labelSubMenu">RICERCA</label>
    </div>
    <div id="dealerBusinessSubMenu" runat="server" class="divSubMenuTab" onclick="goTo('DealerBusiness.aspx'); ">
        <label id="dealerBusinessTab" class="labelSubMenu">DEALER BUSINESS</label>
    </div>
    <div id="creaRelSubMenu" runat="server" class="divSubMenuTab" onclick="goTo('CreaRelazioni.aspx'); ">
        <label id="creaRelTab" class="labelSubMenu">CREA RELAZIONE</label>
    </div>
</div>