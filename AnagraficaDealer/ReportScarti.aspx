<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ReportScarti.aspx.cs" Inherits="Spindox.AnagraficaDealer.ReportScarti" %>
<%@ Register src="UserControl/Menu/ArchivioSubMenuControl.ascx" tagname="ArchivioSubMenuControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContentPlaceHolder" runat="server">
        <script type="text/javascript">
        window.onload = function selectMenuTab() {
            document.getElementById('divMenuArchivio').className = "divMenuSelectedTab";
            document.getElementById('MainContentPlaceHolder_ArchivioSubMenuControl_reportScartiSubMenu').className = "divSubMenuSelectedTab";
            document.getElementById('reportScartiLabel').className = "labelSubMenuSelected";
        }

        $(document).ready(function () {
            gridviewScroll();
        });

        function gridviewScroll() {
            $('#<%=ReportScartiGridView.ClientID%>').gridviewScroll({
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
    <p>
        <br />
        Report Scarti</p>
    <asp:GridView ID="ReportScartiGridView" runat="server" AutoGenerateColumns="False" GridLines="None">
    <Columns>
        <asp:TemplateField HeaderText="Data" SortExpression="Data">
            <ItemTemplate>
                <asp:Label ID="Nome" runat="server" Text='<%# Bind("Nome") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Scarica" ItemStyle-Width="50px" SortExpression="Scarica">
            <ItemTemplate>
                <asp:Label ID="Username" runat="server" Text='<%# Bind("Username") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <HeaderStyle CssClass="GridviewScrollHeader" />
    <RowStyle CssClass="GridviewScrollItem" />
    <PagerStyle CssClass="GridviewScrollPager" />
</asp:GridView>
</asp:Content>
