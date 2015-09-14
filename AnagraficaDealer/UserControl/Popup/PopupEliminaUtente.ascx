<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PopupEliminaUtente.ascx.cs" Inherits="Spindox.AnagraficaDealer.UserControl.Popup.PopupEliminaUtente" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>

<asp:HiddenField ID="btnShow" runat="server" />

<ajx:ModalPopupExtender ID="mpPopupEliminaUtente" runat="server" PopupControlID="panelPopupEliminaUtente" TargetControlID="btnShow" BackgroundCssClass="backgroundPopupMessaggio"></ajx:ModalPopupExtender>

<asp:UpdatePanel ID="panelPopupEliminaUtente" runat="server" CssClass="popupMessaggio" UpdateMode="Conditional" style="display:none;">
    <ContentTemplate>
        <table class="popupMessaggioBig">
        <tr id="trDdlPopupErrorUtente" runat="server" class="trDdlPopup">
            <td class="popupPaddingLine" colspan="4">
                <asp:Label ID="lblPopupMessaggio" CssClass="label" runat="server" Text="Sei sicuro di voler Attivare/Disattivare l'utente selezionato?"></asp:Label>           
            </td>
        </tr>
            <tr class="trFooterPopupMessaggio">
                <td colspan="4">
                    <asp:ImageButton ID="btnElimina" CssClass="imgBtn" runat="server" OnClick="btnElimina_Click" ImageUrl="~/Resources/Images/Bottoni/btn_confirm_popup.png" ValidationGroup="btnConferma" />
                    <asp:ImageButton ID="btnChiudi" CssClass="imgBtn" runat="server" ImageUrl="~/Resources/Images/Bottoni/btn_chiudi_popup.png" OnClick="btnChiudi_Click"/>
                </td>
            </tr>
        </table>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btnElimina" />      
        <asp:AsyncPostBackTrigger ControlID="btnChiudi" />
        
    </Triggers>
</asp:UpdatePanel>


