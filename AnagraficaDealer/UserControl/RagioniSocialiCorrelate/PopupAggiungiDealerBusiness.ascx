<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PopupAggiungiDealerBusiness.ascx.cs" Inherits="Spindox.AnagraficaDealer.UserControl.RagioniSocialiCorrelate.PopupAggiungiDealerBusiness" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>

<asp:HiddenField ID="btnShow" runat="server" />

<ajx:ModalPopupExtender ID="mpPopupAggiungiDealerBusiness" runat="server" PopupControlID="panelPopupAggiungiDealerBusiness" TargetControlID="btnShow" BackgroundCssClass="backgroundPopupMessaggio"></ajx:ModalPopupExtender>

<asp:UpdatePanel ID="panelPopupAggiungiDealerBusiness" runat="server" CssClass="popupMessaggio" UpdateMode="Conditional" style="display: none;">
    <ContentTemplate>
        <table class="popupMessaggioBig">
              <tr>
                    <td class="tdLblPopupMessaggioDealer" colspan="2">
                        <asp:Label runat="server" CssClass="lblSection tdSpace" Text="Crea nuovo Dealer Business"></asp:Label>
                    </td>
                </tr>
            <tr id="trDdlPopupDealerBusiness" runat="server" class="trDdlPopup">
                <td class="popupPaddingLine" colspan="1">
                    <asp:Label ID="lblCodiceDealer" CssClass="label" runat="server" Text="Codice Dealer:"></asp:Label>
                </td>
                <td class="popupPaddingLine">
                    <asp:TextBox ID="txtCodiceDealer" runat="server" CssClass="textBox txtBoxLarge" ToolTip="Codice Dealer" Enabled="false"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RfvCodiceDealer" runat="server" ErrorMessage="*" ControlToValidate="txtCodiceDealer" ValidationGroup="btnConferma"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr id="trDdlPopupRagioneSociale" runat="server" class="trDdlPopup">
                 <td class="popupPaddingLine" colspan="1">
                    <asp:Label ID="lblRagioneSociale" CssClass="label" runat="server" Text="Ragione Sociale:"></asp:Label>
                </td>
                <td class="popupPaddingLine">
                    <asp:TextBox ID="txtRagioneSociale" runat="server" CssClass="textBox txtBoxLarge" ToolTip="Ragione Sociale" Enabled="false"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RfvRagioneSociale" runat="server" ErrorMessage="*" ControlToValidate="txtRagioneSociale" ValidationGroup="btnConferma"></asp:RequiredFieldValidator>
                </td>
            </tr>
               <tr id="trDdlPopupIndirizzo" runat="server" class="trDdlPopup">
                 <td class="popupPaddingLine" colspan="1">
                    <asp:Label ID="lblIndirizzo" CssClass="label" runat="server" Text="Indirizzo:"></asp:Label>
                </td>
                <td class="popupPaddingLine">
                    <asp:TextBox ID="txtIndirizzo" runat="server" CssClass="textBox txtBoxLarge" ToolTip="Indirizzo" Enabled="false"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RfvIndirizzo" runat="server" ErrorMessage="*" ControlToValidate="txtIndirizzo" ValidationGroup="btnConferma"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr class="trLblErrorMessage">
                <td class="tdLblErrorMessage" colspan="2">
                    <asp:Label ID="lblErrore" CssClass="lblPopupMessaggio" runat="server" Text="" Visible="true"></asp:Label>
                </td>
            </tr>
            <tr class="trFooterPopupMessaggio">
                <td colspan="2">
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


