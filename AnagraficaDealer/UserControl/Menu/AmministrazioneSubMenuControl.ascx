<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AmministrazioneSubMenuControl.ascx.cs" Inherits="Spindox.AnagraficaDealer.UserControl.AmministrazioneSubMenuControl" %>


<div id="subMenu" class="divRowSubMenu">
    <div id="utentiSubMenu" runat="server" class="divSubMenuTab" onclick="goTo('Utenti.aspx');" visible="false">
        <label id="utentiTab" class="labelSubMenu">UTENTI</label>
    </div>
    <div id="profiliSubMenu" runat="server" class="divSubMenuTab" onclick="goTo('Profili.aspx');" visible="false">
        <label id="profiliTab" class="labelSubMenu">PROFILI</label>
    </div>
    <div id="importSubMenu" runat="server" class="divSubMenuTab" onclick="goTo('ImportEccezioni.aspx');" visible="false">
        <label id="importTab" class="labelSubMenu">ECCEZIONI IMPORT</label>
    </div>
</div>