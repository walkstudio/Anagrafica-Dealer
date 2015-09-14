<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PopupMessaggio.ascx.cs" Inherits="Spindox.AnagraficaDealer.UserControl.RagioniSocialiCorrelate.PopupMessaggio" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>

<asp:HiddenField ID="btnShow" runat="server" />


<ajx:ModalPopupExtender ID="popupMessaggio" runat="server" PopupControlID="panelPopupMessaggio" 
    TargetControlID="btnShow" 
    BackgroundCssClass="backgroundPopupMessaggio">
</ajx:ModalPopupExtender>

<asp:UpdatePanel ID="panelPopupMessaggio" runat="server" CssClass="popupMessaggio" style="display:none;"  UpdateMode="Conditional">
   <ContentTemplate>
    <table class="popupMessaggio">
        <tr class="trHeaderPopupMessaggio">
            <td>
                <asp:Label ID="lblHeaderPopupMessaggio" CssClass="lblHeaderPopupMessaggio lblMessaggioError" runat="server" Text="ERRORE"></asp:Label>
            </td>
        </tr>
        <tr class="trPopupMessaggio">
            <td>
                <asp:Label ID="lblPopupMessaggio" CssClass="lblPopupMessaggio lblMessaggioError" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr class="trFooterPopupMessaggio">
            <td>
                <div class="divFooterPopupMessaggio">
                    <asp:ImageButton ID="btnChiudi" CssClass="imgBtn" runat="server" Text="Chiudi" ImageUrl="~/Resources/Images/Bottoni/btn_chiudi_popup.png" OnClick="btnChiudi_Click"/>
                </div>
            </td>
        </tr>
    </table>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btnChiudi" />
    </Triggers>
</asp:UpdatePanel>
