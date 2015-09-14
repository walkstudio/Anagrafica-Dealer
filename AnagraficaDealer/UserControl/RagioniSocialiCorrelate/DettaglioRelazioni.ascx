<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DettaglioRelazioni.ascx.cs" Inherits="Spindox.AnagraficaDealer.UserControl.RagioniSocialiCorrelate.DettaglioRelazioni" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>


<asp:HiddenField ID="btnShow" runat="server" />
<ajx:ModalPopupExtender ID="mpPopupDettaglioRelazioni" runat="server" PopupControlID="panelPopupDettaglioRelazioni" TargetControlID="btnShow" BackgroundCssClass="backgroundPopupMessaggio"></ajx:ModalPopupExtender>
<asp:UpdatePanel ID="panelPopupDettaglioRelazioni" runat="server" CssClass="popupMessaggio" UpdateMode="Conditional" style="display:none;">

    <ContentTemplate>
        <table class="popupMessaggioBig">
            <tr>
                <td class="tdSpace popupPaddingLine tdPopup" colspan="2">
                    <asp:Label ID="lblTitle" runat="server" class="lblSection tdSpace" Text="Relazione"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="popupPaddingLine" colspan="1">
                    <label>Codice dealer :</label>
                </td>
                <td class="popupPaddingLine">
                    <asp:Label ID="lblCodiceDealer" runat="server" CssClass="label" ToolTip="Codice dealer"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="popupPaddingLine">
                    <label>Ragione sociale dealer:</label>
                </td>
                <td class="popupPaddingLine">
                    <asp:Label ID="lblNome" runat="server" CssClass="label" ToolTip="Ragione sociale dealer"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="popupPaddingLine">
                    <label>Indirizzo dealer:</label>
                </td>
                <td class="popupPaddingLine">
                    <asp:Label ID="lblIndirizzo" runat="server" CssClass="label" ToolTip="Indirizzo dealer"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="popupPaddingLine">
                    <label>Stato dealer:</label>
                </td>
                </td>
                <td class="popupPaddingLine">
                    <asp:Label ID="lblStato" runat="server" CssClass="label" ToolTip="Stato dealer"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="popupPaddingLine">
                    <label>Canale dealer:</label></td>
                <td class="popupPaddingLine">
                    <asp:Label ID="lblCanale" runat="server" CssClass="label" ToolTip="Canale dealer"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="popupPaddingLine">
                    <label>Codice dealer relativo :</label></td>

                <td class="popupPaddingLine">
                    <asp:Label ID="lblCodiceRelativo" runat="server" CssClass="label" ToolTip="Codice dealer relativo"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="popupPaddingLine">
                    <label>Ragione sociale dealer relativo :</label></td>
                <td class="popupPaddingLine">
                    <asp:Label ID="lblNomeRelativo" runat="server" CssClass="label" ToolTip="Ragione sociale dealer relativo"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="popupPaddingLine">
                    <label>Indirizzo dealer relativo :</label></td>
                <td class="popupPaddingLine">
                    <asp:Label ID="lblIndirizzoRelativo" runat="server" CssClass="label" ToolTip="Indirizzo dealer relativo"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="popupPaddingLine">
                    <label>Stato dealer relativo :</label></td>
                <td class="popupPaddingLine">
                    <asp:Label ID="lblStatoRelativo" runat="server" CssClass="label" ToolTip="Stato dealer relativo"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="popupPaddingLine">
                    <label>Canale dealer relativo : </label>
                </td>
                <td class="popupPaddingLine">
                    <asp:Label ID="lblCanaleRelativo" runat="server" CssClass="label" ToolTip="Canale dealer relativo"></asp:Label>
                </td>
            </tr>
            <tr class="trFooterPopupMessaggio">
                <td colspan="2">
                    <asp:ImageButton ID="btnChiudi" CssClass="imgBtn" runat="server" ImageUrl="~/Resources/Images/Bottoni/btn_chiudi_popup.png" OnClick="btnChiudi_Click" />
                </td>
            </tr>
        </table>

       
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btnChiudi" />

    </Triggers>
</asp:UpdatePanel>
