<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DealerBusiness.aspx.cs" Inherits="Spindox.AnagraficaDealer.DealerBusiness"  EnableEventValidation = "false" %>

<%@ Register Src="~/UserControl/Menu/RelazioniSubMenuControl.ascx" TagPrefix="uc1" TagName="RelazioniSubMenuControl" %>
<%@ Register Src="~/UserControl/Menu/GestioneDealerBusinessSubMenuControl.ascx" TagPrefix="uc1" TagName="GestioneDealerBusinessSubMenuControl" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<%@ Register Src="~/UserControl/Popup/PopupMessaggio.ascx" TagPrefix="uc1" TagName="PopupMessaggio" %>
<%@ Register Src="~/UserControl/Popup/PopupElimina.ascx" TagPrefix="uc1" TagName="PopupElimina" %>
<%@ Register Src="~/UserControl/RagioniSocialiCorrelate/PopupAggiungiDealerBusiness.ascx" TagPrefix="uc1" TagName="PopupAggiungiDealerBusiness" %>
<%@ Register Src="~/UserControl/RagioniSocialiCorrelate/PopupModificheDealerBusiness.ascx" TagPrefix="uc1" TagName="PopupModificheDealerBusiness" %>







<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContentPlaceHolder" runat="Server">

    <script type="text/javascript">
        window.onload = function selectMenuTab() {
            document.getElementById('divMenuRelazioni').className = "divMenuSelectedTab";
            document.getElementById('MainContentPlaceHolder_RelazioniSubMenuControl_dealerBusinessSubMenu').className = "divSubMenuSelectedTab";
            document.getElementById('dealerBusinessTab').className = "labelSubMenuSelected";
        }

        function BindEvents() {
            $(document).ready(function () {
                document.getElementById('MainContentPlaceHolder_RelazioniSubMenuControl_dealerBusinessSubMenu').className = "divSubMenuSelectedTab";
                document.getElementById('dealerBusinessTab').className = "labelSubMenuSelected";

            });
            gridviewScroll();

        }

       $(document).ready(function () {
            gridviewScroll();
        });

        function gridviewScroll() {
            $('#<%=gvDealerBusiness.ClientID%>').gridviewScroll({
                width: "99.99%",
                height: 380,
                freezesize: 0,
                arrowsize: 30,
                varrowtopimg: "Resources/Images/arrowvt.png",
                varrowbottomimg: "Resources/Images/arrowvb.png",
                harrowleftimg: "Resources/Images/arrowhl.png",
                harrowrightimg: "Resources/Images/arrowhr.png",
                headerrowcount: 1,
                verticalbar: "auto",
                horizontalbar: "hidden",
                wrapperAutoHeight: false
            });
        }

    </script>

</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <ajx:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajx:ToolkitScriptManager>
    <asp:UpdatePanel ID="dealerBusinessUpdatePanel" runat="server" UpdateMode="Conditional">

        <ContentTemplate>

             <script type="text/javascript">
                 Sys.Application.add_load(BindEvents);
            </script>
            <uc1:RelazioniSubMenuControl runat="server" ID="RelazioniSubMenuControl" />
            <uc1:GestioneDealerBusinessSubMenuControl runat="server" id="GestioneDealerBusinessSubMenuControl" />
         
       <table style="margin-left: 10px;">
                <tr>
                    <td>
                    <asp:Panel ID="pnStudios" runat="server" >
                        <div id="divGridView" class="divGridViewImport">
                                   
                            <asp:GridView ID="gvDealerBusiness" runat="server" Width="100%" AutoGenerateColumns="False" GridLines="None" DataKeyNames="IDDealerBusiness" OnSelectedIndexChanged="gvDealerBusiness_SelectedIndexChanged" OnRowCreated="gvDealerBusiness_RowCreated" OnPageIndexChanging="gvDealerBusiness_PageIndexChanging" ShowHeaderWhenEmpty="true" PageIndex="13" AllowPaging="true" PopupControlID="pnStudios">
                                <Columns>
                                    <asp:TemplateField HeaderText="IDDealerBusiness" SortExpression="IDDealerBusiness" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("IDDealerBusiness") %>' ID="IDDealerLabel"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Codice Dealer" SortExpression="Codice">
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("Codice") %>' ID="codiceLabel"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Ragione Sociale" SortExpression="Nome">
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("Nome") %>' ID="ragioneSocialeLabel"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Indirizzo" SortExpression="Indirizzo">
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("Indirizzo") %>' ID="indrizzoLabel"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Elimina">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnEliminaDealerBusiness" runat="server" ImageUrl="/Resources/Images/Dettaglio/delete_active.png" Style="width: 20px; height: 20px; border: 0px solid" OnClick="btnEliminaDealerBusiness_Click" ToolTip="Elimina Dealer Business" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle CssClass="GridviewScrollHeader" />
                                <RowStyle CssClass="GridviewScrollItem" />
                                <PagerStyle CssClass="GridviewScrollPager" />
                            </asp:GridView>
                        </div>
                       </asp:Panel>
                    </td>

                </tr>


            </table>
            <uc1:PopupModificheDealerBusiness runat="server" ID="PopupModificheDealerBusiness" />
            <uc1:PopupAggiungiDealerBusiness runat="server" ID="PopupAggiungiDealerBusiness" />
               <uc1:PopupMessaggio runat="server" ID="PopupMessaggio" />
               <uc1:PopupElimina runat="server" ID="PopupElimina" />
        </ContentTemplate>
        <Triggers>
            
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>