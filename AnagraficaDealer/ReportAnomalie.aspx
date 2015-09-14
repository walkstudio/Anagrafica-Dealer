<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ReportAnomalie.aspx.cs" Inherits="Spindox.AnagraficaDealer.ReportAnomalie" %>

<%@ Register Src="UserControl/Menu/ArchivioSubMenuControl.ascx" TagName="ArchivioSubMenuControl" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContentPlaceHolder" runat="server">
    <script type="text/javascript">

        window.onload = function selectMenuTab() {
            document.getElementById('divMenuArchivio').className = "divMenuSelectedTab";
            document.getElementById('MainContentPlaceHolder_ArchivioSubMenuControl_reportAnomalieSubMenu').className = "divSubMenuSelectedTab";
            document.getElementById('reportAnomalieLabel').className = "labelSubMenuSelected";
        }

        $(document).ready(function () {
            gridviewScroll();
        });

        function gridviewScroll() {
            $('#<%=anomalieGridView.ClientID%>').gridviewScroll({
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
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <uc1:ArchivioSubMenuControl ID="ArchivioSubMenuControl" runat="server" />

    <table style="margin-left: 10px;">
        <tr>
            <td class="tdSpace">
                <asp:Label runat="server" CssClass="lblSection tdSpace" Text="Report Anomalie"></asp:Label>
            </td>
        </tr>
        <%--<br />
    Report Anomalie<br />
    <br />--%>
        <tr>
            <td>
              
                    <div id="divGridView" class="divGridViewImport">
                        <asp:GridView ID="anomalieGridView" runat="server" AutoGenerateColumns="False" GridLines="None" Width="100%">
                            <Columns>
                                <asp:TemplateField HeaderText="Data" SortExpression="Data">
                                    <ItemTemplate>
                                        <asp:Label ID="Data" runat="server" Text='<%# Bind("Data") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="File" ItemStyle-Width="350px" SortExpression="File">
                                    <ItemTemplate>
                                        <asp:Label ID="File" runat="server" Text='<%# Bind("File") %>'></asp:Label>
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
</asp:Content>
