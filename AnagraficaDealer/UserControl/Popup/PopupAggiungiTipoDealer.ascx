<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PopupAggiungiTipoDealer.ascx.cs" Inherits="Spindox.AnagraficaDealer.UserControl.RagioniSocialiCorrelate.PopupAggiungiTipoDealer" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>

<asp:HiddenField ID="btnShow" runat="server" />

<ajx:ModalPopupExtender ID="mpPopupAggiungiTipoDealer" runat="server" PopupControlID="UpdatePanelPopupAggiungiTipoDealer" TargetControlID="btnShow" BackgroundCssClass="backgroundPopupMessaggio"></ajx:ModalPopupExtender>


<asp:UpdatePanel ID="UpdatePanelPopupAggiungiTipoDealer" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
        <table class="popupMessaggio" style="text-align: center">
            <tr class="trLblErrorMessage">
                <td class="tdLblPopupMessaggio">
                    <asp:Label ID="Label1" runat="server" CssClass="lblPopupMessaggio" Text="Tipo Dealer:"></asp:Label>
                </td>
            </tr>
             <tr class="trLblErrorMessage">
                 <td>
                     <asp:DropDownList ID="ddlDealer" runat="server" CssClass="ddlStyle ddlMedium" OnLoad="ddlDealer_Load">
                     </asp:DropDownList>
                 </td>
            </tr>
             <tr class="trLblErrorMessage">
                   <td class="tdLblErrorMessage">
                        <asp:Label ID="lblErrore" runat="server" CssClass="lblPopupMessaggio"></asp:Label>
                   </td>
            </tr>
            <tr class="trFooterPopupMessaggio">
                <td>
                    <asp:ImageButton ID="btnAggiungi" runat="server" CssClass="imgBtn" ImageUrl="~/Resources/Images/Bottoni/confirm1.png" OnClick="btnAggiungi_Click" />
                    <asp:ImageButton ID="btnChiudi" runat="server" CssClass="imgBtn" ImageUrl="~/Resources/Images/Bottoni/btn_chiudi_popup.png" OnClick="btnChiudi_Click" />
                </td>
            </tr>
        </table>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btnAggiungi" />      
        <asp:AsyncPostBackTrigger ControlID="btnChiudi" />
    </Triggers>
</asp:UpdatePanel>



