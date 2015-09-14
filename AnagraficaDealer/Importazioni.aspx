<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Importazioni.aspx.cs" Inherits="Spindox.AnagraficaDealer.Importazioni" %>

<%@ Register Src="UserControl/Menu/ArchivioSubMenuControl.ascx" TagName="ArchivioSubMenuControl" TagPrefix="uc1" %>
<%@ Register Src="~/UserControl/Popup/PopupMessaggio.ascx" TagPrefix="uc1" TagName="PopupMessaggio" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContentPlaceHolder" runat="server">
    <script type="text/javascript">

        window.onload = function selectMenuTab() {
            document.getElementById('divMenuArchivio').className = "divMenuSelectedTab";
            document.getElementById('MainContentPlaceHolder_ArchivioSubMenuControl_importazioniSubMenu').className = "divSubMenuSelectedTab";
            document.getElementById('importazioniLabel').className = "labelSubMenuSelected";
        }

        $(document).ready(function () {
            gridviewScroll();
        });

        function gridviewScroll() {
            $('#<%=anomalieGridView.ClientID%>').gridviewScroll({
                width: "99.99%",
                height: 470,
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
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <ajx:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajx:ToolkitScriptManager>
    



    <asp:UpdatePanel ID="importazioniUpdatePanel" runat="server" UpdateMode="Conditional">

        <ContentTemplate>
            <uc1:ArchivioSubMenuControl ID="ArchivioSubMenuControl" runat="server" />
    <table class="tableArchivio">
        <tr>
            <td>
                <div id="divGridView" class="divGridViewImport">
                    <asp:GridView ID="anomalieGridView" runat="server" AutoGenerateColumns="False" GridLines="None" Width="100%" ShowHeaderWhenEmpty="true" OnDataBound="anomalieGridView_DataBound" OnLoad="anomalieGridView_Load" PageSize="12" OnPageIndexChanging="anomalieGridView_PageIndexChanging" PagerSettings-PageButtonCount="20" AllowPaging="true">
                        <Columns>
                            <asp:TemplateField HeaderText="Data" SortExpression="Data">
                                <ItemTemplate>
                                    <asp:Label ID="lblData" runat="server" Text='<%# Eval("DataImportazione","{0:dd/MM/yyyy HH:mm:ss}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Anagrafiche Aggiornate" SortExpression="AnagraficheAggiornate">
                                <ItemTemplate>
                                    <asp:Label ID="AnagraficheAggiornate" runat="server" Text='<%# Bind("AnagraficheAggiornate") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Anagrafiche Scartate" SortExpression="AnagraficheScartate">
                                <ItemTemplate>
                                    <asp:Label ID="AnagraficheScartate" runat="server" Text='<%# Bind("AnagraficheScartate") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="Download Anomalie">
                                <ItemTemplate>
                                        <a href="<%# Eval("FilePathAnomalie") + "" + Eval("FileNameAnomalie") %>" >
                                    <asp:Image ID="imgDownloadAnomalie" runat="server" ImageUrl="Resources/Images/Dettaglio/download_attach_active.png" Style="width: 20px; height: 20px; border: 0px solid" /></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                                            <asp:BoundField DataField="FilePathAnomalie" HeaderText="FilePathAnomalie" SortExpression="FilePathAnomalie" Visible="false"></asp:BoundField>
                                            <asp:BoundField DataField="FileNameAnomalie" HeaderText="FileNameAnomalie" SortExpression="FileNameAnomalie" Visible="false"></asp:BoundField>
     
                            <asp:TemplateField HeaderText="Download Scarti">
                                <ItemTemplate>
                                        <a href="<%# Eval("FilePathScarti") + "" + Eval("FileNameScarti") %>" >
                                    <asp:Image ID="imgDownloadScarti" runat="server" ImageUrl="Resources/Images/Dettaglio/download_attach_active.png" Style="width: 20px; height: 20px; border: 0px solid" /></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                                            <asp:BoundField DataField="FilePathScarti" HeaderText="FilePathScarti" SortExpression="FilePathScarti" Visible="false"></asp:BoundField>
                                            <asp:BoundField DataField="FileNameScarti" HeaderText="FileNameScarti" SortExpression="FileNameScarti" Visible="false"></asp:BoundField>
                      
                        </Columns>
                        <HeaderStyle CssClass="GridviewScrollHeader" />
                        <RowStyle CssClass="GridviewScrollItem" />
                        <PagerStyle CssClass="GridviewScrollPager" />
                    </asp:GridView>
                </div>

            </td>
        </tr>
    </table>
    <uc1:PopupMessaggio runat="server" ID="PopupMessaggio" />
            </ContentTemplate>

    </asp:UpdatePanel>

</asp:Content>
