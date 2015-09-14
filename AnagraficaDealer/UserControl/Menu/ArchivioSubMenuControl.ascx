<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ArchivioSubMenuControl.ascx.cs" Inherits="Spindox.AnagraficaDealer.UserControl.Menu.ArchivioSubMenuControl" %>


<div id="subMenu" class="divRowSubMenu">
    <div id="archivioCruscottoSubMenu" runat="server" class="divSubMenuTab" onclick="goTo('ArchivioCruscotto.aspx');" visible="false">
        <label id="archivioCruscottoLabel" class="labelSubMenu">ARCHIVIO CRUSCOTTO</label>
    </div>
    <div id="archivioDatabaseSubMenu" runat="server" class="divSubMenuTab" onclick="goTo('ArchivioDatabase.aspx');"  visible="false">
        <label id="archivioDatabaseLabel" class="labelSubMenu">ARCHIVIO DATABASE</label>
    </div>
        <div id="importazioniSubMenu" runat="server" class="divSubMenuTab" onclick="goTo('Importazioni.aspx');"  visible="false">
        <label id="importazioniLabel" class="labelSubMenu">IMPORTAZIONI</label>
    </div>
     
</div>