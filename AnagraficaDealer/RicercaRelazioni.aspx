<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="RicercaRelazioni.aspx.cs" Inherits="Spindox.AnagraficaDealer.RicercaRelazioni" EnableEventValidation = "false"%>

<%@ Register Src="~/UserControl/Menu/RelazioniSubMenuControl.ascx" TagPrefix="uc1" TagName="RelazioniSubMenuControl" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<%@ Register Src="~/UserControl/Popup/PopupElimina.ascx" TagPrefix="uc1" TagName="PopupElimina" %>
<%@ Register Src="~/UserControl/Popup/PopupMessaggio.ascx" TagPrefix="uc1" TagName="PopupMessaggio" %>
<%@ Register Src="~/UserControl/RagioniSocialiCorrelate/DettaglioRelazioni.ascx" TagPrefix="uc1" TagName="DettaglioRelazioni" %>





<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContentPlaceHolder" runat="Server">

    <script type="text/javascript">
        window.onload = function selectMenuTab() {
            document.getElementById('divMenuRelazioni').className = "divMenuSelectedTab";
            document.getElementById('MainContentPlaceHolder_RelazioniSubMenuControl_relazioniSubMenu').className = "divSubMenuSelectedTab";
            document.getElementById('relazioniTab').className = "labelSubMenuSelected";
        }

        function BindEvents() {
            $(document).ready(function () {
                document.getElementById('MainContentPlaceHolder_RelazioniSubMenuControl_relazioniSubMenu').className = "divSubMenuSelectedTab";
                document.getElementById('relazioniTab').className = "labelSubMenuSelected";
            });
            gridviewScroll();
            gridview = $('#' + gridviewID);
        }

        $(document).ready(function () {
            gridviewScroll();
            gridview = $('#' + gridviewID);
        });

        function gridviewScroll() {
            $('#<%=gvRelazioni.ClientID%>').gridviewScroll({
                width: "99.99%",
                height: 410,
                freezesize: 0,
                arrowsize: 30,
                varrowtopimg: "Resources/Images/arrowvt.png",
                varrowbottomimg: "Resources/Images/arrowvb.png",
                harrowleftimg: "Resources/Images/arrowhl.png",
                harrowrightimg: "Resources/Images/arrowhr.png",
                headerrowcount: 1,
                verticalbar: "auto",
                horizontalbar: "auto",
                wrapperAutoHeight: false
            });
        }
 
        var gridviewID = "<%=gvRelazioni.ClientID%>"; 
        var gridview = null;
        var gridviewFreeze = null;
        var selectedRowIndex = -1;

        function RowMouseOver(rowIndex) {
            if (selectedRowIndex == rowIndex) return;
            //gridview = $('#' + gridviewID);
            gridview[0].rows[rowIndex + 1].className = 'GridviewScrollItemHover';
            //if (gridviewFreeze[0])
            //    gridviewFreeze[0].rows[rowIndex + 1].className = 'GridviewScrollItemHover';
        }

        function RowMouseOut(rowIndex) {
            if (selectedRowIndex == rowIndex) return;
            //gridview = $('#' + gridviewID);
            gridview[0].rows[rowIndex + 1].className = 'GridviewScrollItem';
            //if (gridviewFreeze[0])
            //    gridviewFreeze[0].rows[rowIndex + 1].className = 'GridviewScrollItem';
        }

    </script>

</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <ajx:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajx:ToolkitScriptManager>
    <asp:UpdatePanel ID="relazioniUpdatePanel" runat="server" UpdateMode="Conditional">

        <ContentTemplate>

            <script type="text/javascript">
                Sys.Application.add_load(BindEvents);
            </script>
            <uc1:RelazioniSubMenuControl runat="server" ID="RelazioniSubMenuControl" />


            <asp:Panel ID="divPannelloRicerca" CssClass="divPannelloRicerca" runat="server">
                <table id="tableREP" runat="server" class="tablePannelloRicerca">
                    <tr>
                        <td class="tdLabelRicercaRelazioni">
                            <asp:Label ID="lblTipoDealer" CssClass="label" runat="server" Text="Tipo Dealer 2:" Visible="true"></asp:Label>
                        </td>
                        <td class="tdTextBoxRicercaRelazioni">
                            <asp:DropDownList ID="ddlTipoDealer" CssClass="ddlStyle ddlMediumRicerca" runat="server">
                                <asp:ListItem Value="0" Text="All"></asp:ListItem>
                                <asp:ListItem Value="1" Text="Consumer"></asp:ListItem>
                                <asp:ListItem Value="2" Text="Business"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="tdLabelRicercaRelazioni" colspan="1">
                            <asp:Label ID="lblCodiceDealer" CssClass="label" runat="server" Text="Codice Dealer:" Visible="true"></asp:Label>
                        </td>
                        <td class="tdTextBoxRicercaRelazioni" colspan="1">
                            <asp:TextBox ID="txtCodiceDealer" CssClass="textBox txtBoxLarge" runat="server" placeholder ="--Codice dealer--" ToolTip="Codice dealer" Visible="true"></asp:TextBox>
                            <ajx:TextBoxWatermarkExtender ID="tbweCodiceDealer" runat="server" TargetControlID="txtCodiceDealer" WatermarkCssClass="watermark textBox txtBoxLarge" WatermarkText="--Codice dealer--"></ajx:TextBoxWatermarkExtender>
                        </td>
                        <td class="tdLabelRicercaRelazioni" colspan="1">
                            <asp:Label ID="lblRagioneSociale" CssClass="label" runat="server" Text="Ragione  Sociale:" Visible="true"></asp:Label>
                        </td>
                        <td class="tdTextBoxRicercaRelazioni" colspan="1">
                            <asp:TextBox ID="txtRagioneSociale" CssClass="textBox txtBoxLarge" runat="server" placeholder ="--Regione sociale--" ToolTip="Regione sociale" Visible="true"></asp:TextBox>
                            <ajx:TextBoxWatermarkExtender ID="tbweRagioneSociale" runat="server" TargetControlID="txtRagioneSociale" WatermarkCssClass="watermark textBox txtBoxLarge" WatermarkText="--Regione sociale--"></ajx:TextBoxWatermarkExtender>
                             </td>
                        <td class="tdLabelRicercaRelazioni" colspan="1">
                            <asp:Label ID="lblRelazione" CssClass="label" runat="server" Text="Relazione:" Visible="true"></asp:Label>
                        </td>
                        <td class="tdTextBoxRicercaRelazioni" colspan="1">
                            <asp:TextBox ID="txtRelazione" runat="server" CssClass="textBox txtBoxLarge" placeholder="--Relazione--" server="" ToolTip="Relazione" Visible="true"></asp:TextBox>
                            <ajx:TextBoxWatermarkExtender ID="tbweRelazione" runat="server" TargetControlID="txtRelazione" WatermarkCssClass="watermark textBox txtBoxLarge" WatermarkText="--Relazione--"></ajx:TextBoxWatermarkExtender>
                        </td>
                        <td colspan="1">
                        <asp:ImageButton ID="btnRicercaRelazioni" runat="server" ImageUrl="/Resources/Images/Bottoni/btn_search2.png" CssClass="imgBtn" OnClick="btnRicercaRelazioni_Click" />
                    </td>
                    </tr>
                </table>
            </asp:Panel>

            <div class="divMessaggio">
                <asp:Label ID="lblRicercaRisultati1" runat="server" Text="Risultato ricerca: " Visible="false"></asp:Label><asp:Label ID="lblNumeroRelazioni" runat="server" CssClass="lblNormal" Text="0" Visible="False"></asp:Label><asp:Label ID="lblRicercaRisultati2" runat="server" Text=" relazioni trovate." Visible="false"></asp:Label>
            </div>



            <div id="divGridView" class="divGridViewDealerBus">
                <asp:GridView ID="gvRelazioni" runat="server" Width="100%" AutoGenerateColumns="False" DataKeyNames="IDRelazione" GridLines="None" ShowHeaderWhenEmpty="true" OnSelectedIndexChanged="gvRelazioni_SelectedIndexChanged" OnRowCreated="gvRelazioni_RowCreated"  AllowPaging="true" PageSize="11" PagerSettings-PageButtonCount="20" OnPageIndexChanging="gvRelazioni_PageIndexChanging" OnRowDataBound="gvRelazioni_RowDataBound">

                    <Columns>
                        <asp:TemplateField HeaderText="IDRelazione" SortExpression="IDRelazione" Visible="false">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("IDRelazione") %>' ID="IDRelazione"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="IDDealerConsumer" SortExpression="IDDealerConsumer" Visible="false">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("IDDealerConsumer") %>' ID="IDDealerConsumer"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Codice Dealer" SortExpression="CodiceDealerConsumer">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("CodiceDealerConsumer") %>' ID="CodiceDealerConsumer"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ragione Sociale" SortExpression="RagioneSocialeDealerConsumer">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("RagioneSocialeDealerConsumer") %>' ID="RagioneSocialeDealerConsumer"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Indirizzo" SortExpression="IndirizzoDealerConsumer">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("IndirizzoDealerConsumer") %>' ID="IndirizzoDealerConsumer"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Relazione" SortExpression="NomeRelazione">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("NomeRelazione") %>' ID="NomeRelazione"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="IDTipoDealer" SortExpression="IDTipoDealer" Visible="false">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("IDTipoDealer") %>' ID="IDTipoDealer"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tipo Dealer 2" SortExpression="TipoDealer" Visible="true">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# (int)Eval("IDTipoDealer")==1?"Consumer":"Business" %>' ID="TipoDealer"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="IDDealer" SortExpression="IDDealer" Visible="false">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("IDDealer") %>' ID="IDDealer"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Codice Dealer 2" SortExpression="CodiceDealer">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("CodiceDealer") %>' ID="CodiceDealer"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Ragione Sociale 2" SortExpression="RagioneSocialeDealer">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("RagioneSocialeDealer") %>' ID="RagioneSocialeDealer"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Indirizzo 2" SortExpression="IndirizzoDealer">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("IndirizzoDealer") %>' ID="IndirizzoDealer"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                       
                        <asp:TemplateField HeaderText="Elimina">
                            <ItemTemplate>
                                <asp:ImageButton ID="btnEliminaRelazione" runat="server" ImageUrl="/Resources/Images/Dettaglio/delete_active.png" Style="width: 20px; height: 20px; border: 0px solid" OnClick="btnEliminaRelazione_Click"/>
           
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                    <HeaderStyle CssClass="GridviewScrollHeader" />
                    <RowStyle CssClass="GridviewScrollItem" />
                    <PagerStyle CssClass="GridviewScrollPager" />
                </asp:GridView>
            </div>
            <uc1:DettaglioRelazioni runat="server" id="DettaglioRelazioni" />
            <uc1:PopupElimina runat="server" ID="PopupElimina" />
            <uc1:PopupMessaggio runat="server" ID="PopupMessaggio" />
        </ContentTemplate>
        <Triggers>
          <%--  <asp:AsyncPostBackTrigger ControlID="btnEliminaRelazione" />--%>
            <asp:AsyncPostBackTrigger ControlID="btnRicercaRelazioni" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
