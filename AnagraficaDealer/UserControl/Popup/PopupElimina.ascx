<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PopupElimina.ascx.cs" Inherits="Spindox.AnagraficaDealer.UserControl.RagioniSocialiCorrelate.PopupElimina"  %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>

<asp:HiddenField ID="btnShow" runat="server" />

<ajx:ModalPopupExtender ID="mpPopupElimina" runat="server" PopupControlID="panelPopupElimina" TargetControlID="btnShow" BackgroundCssClass="backgroundPopupMessaggio"></ajx:ModalPopupExtender>

<asp:UpdatePanel ID="panelPopupElimina" runat="server" CssClass="popupMessaggio" UpdateMode="Conditional" style="display:none;">
    <ContentTemplate>
        <table class="popupMessaggio">
           <tr class="trHeaderPopupMessaggio">
            <td>
                <asp:Label ID="lblHeaderPopupMessaggio" CssClass="lblHeaderPopupMessaggio lblMessaggioError" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr class="trPopupMessaggio">
            <td>
                <asp:Label ID="lblPopupMessaggio" CssClass="lblPopupMessaggio lblMessaggioError" runat="server" Text="Sei sicuro di voler eliminare il profilo selezionato?"></asp:Label>
            </td>
        </tr>
            <tr class="trFooterPopupMessaggio">
                <td colspan="2">
                    <asp:ImageButton ID="btnElimina" CssClass="imgBtn" runat="server" OnClick="btnElimina_Click" ImageUrl="~/Resources/Images/Bottoni/btn_confirm_popup.png" ValidationGroup="btnElimina" />
                    <asp:ImageButton ID="btnChiudi" CssClass="imgBtn" runat="server" ImageUrl="~/Resources/Images/Bottoni/btn_chiudi_popup.png" OnClick="btnChiudi_Click"/>
                </td>
            </tr>
        </table>

        <asp:HiddenField ID="IDObjectHF" runat="server" />
        <asp:HiddenField ID="GridIndexHF" runat="server" />
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btnElimina" />      
        <asp:AsyncPostBackTrigger ControlID="btnChiudi" />
        
    </Triggers>


</asp:UpdatePanel>


