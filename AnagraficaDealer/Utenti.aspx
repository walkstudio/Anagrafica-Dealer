<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Utenti.aspx.cs" Inherits="Spindox.AnagraficaDealer.Utenti" %>

<%@ Register Src="~/UserControl/Menu/AmministrazioneSubMenuControl.ascx" TagPrefix="uc1" TagName="AmministrazioneSubMenuControl" %>
<%@ Register Src="~/UserControl/Menu/GestioneUtentiSubMenuControl.ascx" TagPrefix="uc1" TagName="GestioneUtentiSubMenuControl" %>

<%@ Register Src="~/UserControl/Popup/PopupMessaggio.ascx" TagPrefix="uc1" TagName="PopupMessaggio" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<%@ Register Src="~/UserControl/Popup/PopupElimina.ascx" TagPrefix="uc1" TagName="PopupElimina" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContentPlaceHolder" runat="Server">

    <script type="text/javascript">
        window.onload = function selectMenuTab() {
            document.getElementById('MainContentPlaceHolder_AmministrazioneSubMenuControl_utentiSubMenu').className = "divSubMenuSelectedTab";
            document.getElementById('utentiTab').className = "labelSubMenuSelected";
        }

        function BindEvents() {
            $(document).ready(function () {
                document.getElementById('MainContentPlaceHolder_AmministrazioneSubMenuControl_utentiSubMenu').className = "divSubMenuSelectedTab";
                document.getElementById('utentiTab').className = "labelSubMenuSelected";
               
            });
            gridviewScroll();
            gridview = $('#' + gridviewID);
        }

        $(document).ready(function () {
            gridviewScroll();
            gridview = $('#' + gridviewID);
        });

        function gridviewScroll() {
            $('#<%=gvUtenti.ClientID%>').gridviewScroll({
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

        var gridviewID = "<%=gvUtenti.ClientID%>";
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
    <asp:UpdatePanel ID="utenteUpdatePanel" runat="server" UpdateMode="Conditional">

        <ContentTemplate>

             <script type="text/javascript">
                 Sys.Application.add_load(BindEvents);
            </script>
            <uc1:AmministrazioneSubMenuControl runat="server" ID="AmministrazioneSubMenuControl" />
            <uc1:GestioneUtentiSubMenuControl runat="server" ID="GestioneUtentiSubMenuControl" />

            <uc1:PopupMessaggio runat="server" ID="PopupMessaggio" />
            <uc1:PopupElimina runat="server" ID="PopupElimina" />

            <div id="divGridView" class="divGridView">
                <asp:GridView ID="gvUtenti" runat="server" Width="100%" AutoGenerateColumns="False" GridLines="None" DataKeyNames="IDUtente" ShowHeaderWhenEmpty="true" OnRowDataBound="gvUtenti_RowDataBound">

                    <Columns>
                        <asp:TemplateField ItemStyle-Width="50px">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemTemplate>
                                <asp:CheckBox ID="cbSelected" runat="server" OnCheckedChanged="cbSelected_CheckedChanged"  AutoPostBack="true" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="IDUtente" SortExpression="IDUtente" Visible="false">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("IDUtente") %>' ID="IDUtente"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Username" SortExpression="Username">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("UserID") %>' ID="Username"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nome" SortExpression="Nome" Visible="false">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("Nome") %>' ID="Nome"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cognome" SortExpression="Cognome" Visible="false">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("Cognome")%>' ID="Cognome"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cognome e Nome" SortExpression="CognomeNome">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("Cognome")  + " " + Eval("Nome") %>' ID="CognomeNome"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Mail" SortExpression="Mail">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("Email") %>' ID="Mail"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="IDProfilo" SortExpression="IDProfilo" Visible="False">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("IDProfilo") %>' ID="IDProfilo"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Profilo utente" SortExpression="NomeProfilo" ItemStyle-Width="200px">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("NomeProfilo") %>' ID="NomeProfilo"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                       <asp:TemplateField HeaderText="Attivo" SortExpression="Attivo" >
                        <ItemTemplate>
                            <asp:CheckBox runat="server" Checked='<%# Bind("Attivo") %>' Enabled="false" ID="Attivo"></asp:CheckBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>

                    <HeaderStyle CssClass="GridviewScrollHeader" />
                    <RowStyle CssClass="GridviewScrollItem" />
                    <PagerStyle CssClass="GridviewScrollPager" />

                </asp:GridView>
            </div>
        </ContentTemplate>
        <Triggers>
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
