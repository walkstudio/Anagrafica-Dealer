<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PopupAggiungiRelazioneDealer.ascx.cs" Inherits="Spindox.AnagraficaDealer.UserControl.RagioniSocialiCorrelate.PopupAggiungiRelazioneDealer" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>


<asp:HiddenField ID="btnShow" runat="server" />

<ajx:ModalPopupExtender ID="mpPopupAggiungiRelazioneDealer" runat="server" PopupControlID="panelPopupAggiungiRelazioneDealer" TargetControlID="btnShow" BackgroundCssClass="backgroundPopupMessaggio"></ajx:ModalPopupExtender>

<asp:UpdatePanel ID="panelPopupAggiungiRelazioneDealer" runat="server" style="display: none" UpdateMode="Conditional">
    <ContentTemplate>

        <table class="popupMessaggioRelazioni" style="text-align: center">
            <tr class="trLblErrorMessage">
                <td class="tdLblPopupMessaggio">
                    <asp:Label ID="Label1" runat="server" CssClass="lblPopupMessaggio" Text="Lista Dealer:"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="divGridView" class="divGridViewRelazioni">
                        <asp:GridView ID="relazioneGV" runat="server" Width="100%" AutoGenerateColumns="False" GridLines="None" ShowHeaderWhenEmpty="true" PageSize="5" AllowPaging="true" DataKeyNames="IDDealer" OnPageIndexChanging="relazioneGV_PageIndexChanging">
                            <Columns>
                                <asp:TemplateField HeaderText="IDDealer" SortExpression="IDDealer" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Bind("IDDealer") %>' ID="idDealer"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Codice Dealer" SortExpression="CodiceDealer">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Bind("CodiceDealer") %>' ID="codiceDealer"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Ragione Sociale" SortExpression="RagioneSocialeDealer">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Bind("RagioneSocialeDealer") %>' ID="ragioneSocialeDealer"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnAggiungiRel" runat="server" ImageUrl="/Resources/Images/Dettaglio/resend_active.png" Style="width: 20px; height: 20px; border: 0px solid" OnClick="btnAggiungiRel_Click" ToolTip="Aggiungi alla relazione" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle CssClass="GridviewScrollHeader" />
                            <RowStyle CssClass="GridviewScrollItem" />
                            <PagerStyle CssClass="GridviewScrollPager" />
                        </asp:GridView>
                    </div>

                </td>
            </tr>
            <tr class="trLblErrorMessage">
                <td class="tdLblErrorMessage">
                    <asp:Label ID="lblErrore" runat="server" CssClass="lblPopupMessaggio"></asp:Label>
                </td>
            </tr>
            <tr class="trFooterPopupMessaggio">
                <td>
                    <asp:ImageButton ID="btnChiudi" runat="server" CssClass="imgBtn" ImageUrl="~/Resources/Images/Bottoni/btn_chiudi_popup.png" OnClick="btnChiudi_Click" />
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="TipoRicercaHF" runat="server" />
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btnChiudi" />
    </Triggers>
</asp:UpdatePanel>



