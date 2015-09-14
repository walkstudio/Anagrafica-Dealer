<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="GestioneImportEcc.aspx.cs" Inherits="Spindox.AnagraficaDealer.GestioneImportEcc" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>

<%@ Register Src="~/UserControl/Menu/AmministrazioneSubMenuControl.ascx" TagPrefix="uc1" TagName="AmministrazioneSubMenuControl" %>
<%@ Register Src="~/UserControl/Menu/GestioneImportEccezioniSubMenuControl.ascx" TagPrefix="uc1" TagName="GestioneImportEccezioniSubMenuControl" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContentPlaceHolder" runat="server">
    <script type="text/javascript">
        window.onload = function selectMenuTab() {
            document.getElementById('MainContentPlaceHolder_AmministrazioneSubMenuControl_importSubMenu').className = "divSubMenuDettaglioSelected";
            document.getElementById('importTab').className = "labelSubMenuDettaglioSelected";
        }

<%--        $(document).ready(function () {
            gridviewScrollEccezioni();
        });

        function gridviewScrollEccezioni() {
             $('#<%=eccImportGridView.ClientID%>').gridviewScroll({
                width: "99.99%",
                height: 450,
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

        }--%>
    </script>
</asp:Content>

<%--<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <ajx:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajx:ToolkitScriptManager>

    <asp:HiddenField ID="IDImportEccHF" runat="server" />

    <uc1:AmministrazioneSubMenuControl runat="server" ID="AmministrazioneSubMenuControl" />
    <uc1:GestioneImportEccezioniSubMenuControl runat="server" ID="GestioneImportEccezioniSubMenuControl" />


    <asp:UpdatePanel ID="importUpdatePanel" runat="server" UpdateMode="Conditional">

        <ContentTemplate>
            <table style="margin-left: 10px;">
            
                <tr>
                    <td class="tdSpace">
                        <asp:Label runat="server" CssClass="lblSection tdSpace" Text="Eccezione Import Dealer"></asp:Label>
                    </td>

                 
                </tr>
                <tr>
                    <td>
                        <div id="divGridView" class="divGridView">
                            <asp:GridView ID="eccImportGridView" runat="server" Width="100%" AutoGenerateColumns="False" GridLines="None">
                                <Columns>
                                    <asp:TemplateField HeaderText="IDDealer" SortExpression="IDDealer" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("IDDealer") %>' ID="IDDealerLabel"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Codice Dealer" SortExpression="Codice">
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("Codice") %>' ID="codiceLabel"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Elimina">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnEliminaTipoDealer" runat="server" ImageUrl="/Resources/Images/Dettaglio/delete_active.png" Style="width: 20px; height: 20px; border: 0px solid"/>
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
    
               
            </table>
        </ContentTemplate>
       <%-- <Triggers>

            <asp:AsyncPostBackTrigger ControlID="btnAggiungiAbilitazione" />
            <asp:AsyncPostBackTrigger ControlID="btnAggiungiTipoDealer" />
            <asp:PostBackTrigger ControlID="btnSalvaProfilo" />
        </Triggers>--%>
<%--    </asp:UpdatePanel>
</asp:Content>--%>
