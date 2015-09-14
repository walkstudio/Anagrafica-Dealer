<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PopupModificheDealerBusiness.ascx.cs" Inherits="Spindox.AnagraficaDealer.UserControl.RagioniSocialiCorrelate.PopupModificheDealerBusiness" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>

<asp:HiddenField ID="btnShow" runat="server" />
 <asp:HiddenField ID="IDDealerBusinessHF" runat="server" />
<ajx:ModalPopupExtender ID="mpPopupModificheDealerBusiness" runat="server" PopupControlID="panelPopupModificheDealerBusiness" TargetControlID="btnShow" BackgroundCssClass="backgroundPopupMessaggio"></ajx:ModalPopupExtender>




<asp:UpdatePanel ID="panelPopupModificheDealerBusiness" runat="server" CssClass="popupMessaggio" UpdateMode="Conditional" style="display: none;">
    <ContentTemplate>
        <table class="popupMessaggioBig">
            <tr id="trDdlPopupDealerBusiness" runat="server" class="trDdlPopup">
                <td class="popupPaddingLine" colspan="1">
                    <asp:Label ID="lblCodiceDealer" CssClass="label" runat="server" Text="Codice Dealer:"></asp:Label>
                </td>
                <td class="popupPaddingLine">
                    <asp:TextBox ID="txtCodiceDealer" runat="server" CssClass="textBox txtBoxLarge" ToolTip="Codice Dealer" Enabled="false"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RfvCodiceDealer" runat="server" ErrorMessage="*" ControlToValidate="txtCodiceDealer" ValidationGroup="btnModifica"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr id="trDdlPopupRagioneSociale" runat="server" class="trDdlPopup">
                 <td class="popupPaddingLine" colspan="1">
                    <asp:Label ID="lblRagioneSociale" CssClass="label" runat="server" Text="Ragione Sociale:"></asp:Label>
                </td>
                <td class="popupPaddingLine">
                    <asp:TextBox ID="txtRagioneSociale" runat="server" CssClass="textBox txtBoxLarge" ToolTip="Codice Dealer" Enabled="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RfvRagioneSociale" runat="server" ErrorMessage="*" ControlToValidate="txtRagioneSociale" ValidationGroup="btnModifica"></asp:RequiredFieldValidator>
                </td>
            </tr>
               <tr id="trDdlPopupIndirizzo" runat="server" class="trDdlPopup">
                 <td class="popupPaddingLine" colspan="1">
                    <asp:Label ID="lblIndirizzo" CssClass="label" runat="server" Text="Indirizzo:"></asp:Label>
                </td>
                <td class="popupPaddingLine">
                    <asp:TextBox ID="txtIndirizzo" runat="server" CssClass="textBox txtBoxLarge" ToolTip="Codice Dealer" Enabled="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RfvIndirizzo" runat="server" ErrorMessage="*" ControlToValidate="txtIndirizzo" ValidationGroup="btnModifica"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr class="trLblErrorMessage">
                <td class="tdLblErrorMessage" colspan="2">
                    <asp:Label ID="lblErrore" CssClass="lblPopupMessaggio" runat="server" Text="" Visible="true"></asp:Label>
                </td>
            </tr>
            <tr class="trFooterPopupMessaggio">
                <td colspan="2">
                    <asp:ImageButton ID="btnModifica" CssClass="imgBtn" runat="server" OnClick="btnModifica_Click" ImageUrl="~/Resources/Images/Bottoni/btn_confirm_popup.png" ValidationGroup="btnModifica" />
                    <asp:ImageButton ID="btnChiudi" CssClass="imgBtn" runat="server" OnClick="btnChiudi_Click" ImageUrl="~/Resources/Images/Bottoni/btn_chiudi_popup.png" />
                </td>
            </tr>
        </table>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btnModifica" />
        <asp:AsyncPostBackTrigger ControlID="btnChiudi" />
    </Triggers>
</asp:UpdatePanel>


