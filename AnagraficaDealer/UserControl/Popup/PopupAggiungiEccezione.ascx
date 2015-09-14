<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PopupAggiungiEccezione.ascx.cs" Inherits="Spindox.AnagraficaDealer.UserControl.RagioniSocialiCorrelate.PopupAggiungiEccezione" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>

<asp:HiddenField ID="btnShow" runat="server" />

<ajx:ModalPopupExtender ID="mpPopupAggiungiEccezione" runat="server" PopupControlID="panelPopupAggiungiEccezione" TargetControlID="btnShow" BackgroundCssClass="backgroundPopupMessaggio"></ajx:ModalPopupExtender>

<asp:UpdatePanel ID="panelPopupAggiungiEccezione" runat="server" CssClass="popupMessaggio" UpdateMode="Conditional" style="display: none;">
    <ContentTemplate>
        <table class="popupMessaggioBig">
            <tr>
                 <td class="tdLblPopupMessaggioDealer" colspan="4">
                        <asp:Label runat="server" CssClass="lblSection tdSpace" Text="Eccezione codice dealer"></asp:Label>
                 </td>
            </tr>
            <tr id="trDdlPopupImportEccezioni" runat="server" class="trDdlPopup">
                 
                   
                
                <td class="popupPaddingLine" colspan="1">
                    <asp:Label ID="codiceDealer" CssClass="label" runat="server" Text="Codice Dealer:"></asp:Label>

                </td>
                <td class="popupPaddingLine" colspan="3">
                    <asp:TextBox ID="codiceDealerTextBox" runat="server" CssClass="textBox txtBoxLarge" placeholder="--Codice Dealer--" ToolTip="Codice Dealer"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RfvCodiceDealer" runat="server" ErrorMessage="*" ControlToValidate="codiceDealerTextBox" ValidationGroup="btnConferma"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr class="trLblErrorMessage">
                <td class="tdLblErrorMessage" colspan="4">
                    <asp:Label ID="lblErrore" CssClass="lblPopupMessaggio" runat="server" Text="" Visible="true"></asp:Label>
                </td>
            </tr>
            <tr class="trFooterPopupMessaggio">
                <td colspan="4">
                    <asp:ImageButton ID="btnAggiungi" CssClass="imgBtn" runat="server" OnClick="btnAggiungi_Click" ImageUrl="~/Resources/Images/Bottoni/btn_confirm_popup.png" ValidationGroup="btnConferma" />
                    <asp:ImageButton ID="btnChiudi" CssClass="imgBtn" runat="server" OnClick="btnChiudi_Click" ImageUrl="~/Resources/Images/Bottoni/btn_chiudi_popup.png" />
                </td>
            </tr>
        </table>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btnAggiungi" />
        <asp:AsyncPostBackTrigger ControlID="btnChiudi" />
    </Triggers>
</asp:UpdatePanel>


