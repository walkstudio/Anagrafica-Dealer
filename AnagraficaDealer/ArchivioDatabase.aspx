<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ArchivioDatabase.aspx.cs" Inherits="Spindox.AnagraficaDealer.ArchivioDatabase" %>

<%@ Register Src="UserControl/Menu/ArchivioSubMenuControl.ascx" TagName="ArchivioSubMenuControl" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContentPlaceHolder" runat="server">
    <script type="text/javascript">
        window.onload = function selectMenuTab() {
            document.getElementById('divMenuArchivio').className = "divMenuSelectedTab";
            document.getElementById('MainContentPlaceHolder_ArchivioSubMenuControl_archivioDatabaseSubMenu').className = "divSubMenuSelectedTab";
            document.getElementById('archivioDatabaseLabel').className = "labelSubMenuSelected";
        }

        $(document).ready(function () {
            gridviewScroll();
        });

        function gridviewScroll() {
            $('#<%=ArchivioDatabaseGridView.ClientID%>').gridviewScroll({
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
    <asp:UpdatePanel ID="ADUpdatePanel" runat="server" UpdateMode="Conditional">

        <ContentTemplate>
    <uc1:ArchivioSubMenuControl ID="ArchivioSubMenuControl" runat="server" />
    <table class="tableArchivio">
        <tr>
            <td>

                <div id="divGridView" class="divGridViewImport">
                    <asp:GridView ID="ArchivioDatabaseGridView" runat="server" AutoGenerateColumns="False" GridLines="None" OnDataBound="ArchivioDatabaseGridView_DataBound">
                        <Columns>
                             <asp:TemplateField HeaderText="DataExport" SortExpression="DataExport">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDataAD" runat="server" Text='<%# Eval("DataExport","{0:dd/MM/yyyy HH:mm:ss}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>                          
                                <asp:TemplateField HeaderText="Download allegato">
                    <ItemTemplate>
                        <a href="<%# Eval("FilePath") + "" + Eval("FileName") %>">
                            <asp:Image ID="imgDownload" runat="server" ImageUrl="Resources/Images/Dettaglio/download_attach_active.png" Style="width: 20px; height: 20px; border: 0px solid" /></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="FilePath" HeaderText="FilePath" SortExpression="FilePath" Visible="false"></asp:BoundField>
                <asp:BoundField DataField="FileName" HeaderText="Nomefile" SortExpression="FileName" Visible="false"></asp:BoundField>
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

    </asp:UpdatePanel>
</asp:Content>
