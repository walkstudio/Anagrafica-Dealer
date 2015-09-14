<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Profili.aspx.cs" Inherits="Spindox.AnagraficaDealer.Profili" %>
<%@ Register Src="~/UserControl/Menu/AmministrazioneSubMenuControl.ascx" TagPrefix="uc1" TagName="AmministrazioneSubMenuControl" %>
<%@ Register Src="~/UserControl/Menu/GestioneProfiliSubMenuControl.ascx" TagPrefix="uc1" TagName="GestioneProfiliSubMenuControl" %>
<%@ Register Src="~/UserControl/Popup/PopupElimina.ascx" TagPrefix="uc1" TagName="PopupElimina" %>
<%@ Register Src="~/UserControl/Popup/PopupMessaggio.ascx" TagPrefix="uc1" TagName="PopupMessaggio" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContentPlaceHolder" runat="server">
    <script type="text/javascript">
     
        window.onload = function selectMenuTab() {
            document.getElementById('MainContentPlaceHolder_AmministrazioneSubMenuControl_profiliSubMenu').className = "divSubMenuSelectedTab";
            document.getElementById('profiliTab').className = "labelSubMenuSelected";
        }

        function BindEvents() {
            $(document).ready(function () {
                document.getElementById('MainContentPlaceHolder_AmministrazioneSubMenuControl_profiliSubMenu').className = "divSubMenuSelectedTab";
                document.getElementById('profiliTab').className = "labelSubMenuSelected";
            });
            gridviewScroll();
        }

   
        $(document).ready(function () {
            gridviewScroll();
        });



        function gridviewScroll() {
            $('#<%=profiloGridView.ClientID%>').gridviewScroll({
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
    <ajx:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajx:ToolkitScriptManager>

    <asp:UpdatePanel ID="profiliUpdatePanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <script type="text/javascript">
                Sys.Application.add_load(BindEvents);
            </script>
            <uc1:AmministrazioneSubMenuControl runat="server" ID="AmministrazioneSubMenuControl" />
            <uc1:GestioneProfiliSubMenuControl runat="server" ID="GestioneProfiliSubMenuControl" />

            <div id="divGridView" class="divGridView">
                <asp:GridView ID="profiloGridView" runat="server" AutoGenerateColumns="False" GridLines="None" DataKeyNames="IDProfilo">

                    <Columns>
                        <asp:TemplateField ItemStyle-Width="50px">
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemTemplate>
                                <asp:CheckBox ID="cbSelected" runat="server" OnCheckedChanged="cbSelected_CheckedChanged"  AutoPostBack="true" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="IDProfilo" SortExpression="IDProfilo">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("IDProfilo") %>' ID="IDProfilo"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Nome" SortExpression="Nome">
                            <ItemTemplate>
                                <asp:Label runat="server" Text='<%# Bind("NomeProfilo") %>' ID="NomeProfilo"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cruscotto">
                            <ItemTemplate>
                                <asp:CheckBox runat="server" Enabled="False" Checked='<%# Bind("ArchivioCruscotto") %>' ID="archivioCruscottoCheckBox"></asp:CheckBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Database">
                            <ItemTemplate>
                                <asp:CheckBox runat="server" Enabled="False" Checked='<%# Bind("ArchivioDatabase") %>' ID="archivioDatabaseCheckBox"></asp:CheckBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Anomalie">
                            <ItemTemplate>
                                <asp:CheckBox runat="server" Enabled="False" Checked='<%# Bind("ReportAnomalie") %>' ID="reportAnomalieCheckBox"></asp:CheckBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Scarti">
                            <ItemTemplate>
                                <asp:CheckBox runat="server" Enabled="False" Checked='<%# Bind("ReportScarti") %>' ID="reportScartiCheckBox"></asp:CheckBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Amministrazione">
                            <ItemTemplate>
                                <asp:CheckBox runat="server" Enabled="False" Checked='<%# Bind("Amministrazione") %>' ID="amministrazioneCheckBox"></asp:CheckBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Portafoglio">
                            <ItemTemplate>
                                <asp:CheckBox runat="server" Enabled="False" Checked='<%# Bind("Portafoglio") %>' ID="portafoglioCheckBox"></asp:CheckBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Eccezioni">
                            <ItemTemplate>
                                <asp:CheckBox runat="server" Enabled="False" Checked='<%# Bind("Eccezioni") %>' ID="eccezioniCheckBox"></asp:CheckBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Rag. Soc. Correlate">
                            <ItemTemplate>
                                <asp:DropDownList ID="relazioniDropDownList" runat="server" CssClass="ddlMedium" DataSourceID="permissionXmlDataSource" DataTextField="Descrizione" DataValueField="PermissionId" Enabled="False" SelectedValue='<%# Bind("RagioniSocialiCorrelate") %>'>
                                </asp:DropDownList>
                                <asp:XmlDataSource ID="permissionXmlDataSource" runat="server" DataFile="~/App_Data/PermissionSezioniCampi.xml"></asp:XmlDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                    <HeaderStyle CssClass="GridviewScrollHeader" />
                    <RowStyle CssClass="GridviewScrollItem" />
                    <PagerStyle CssClass="GridviewScrollPager" />

                </asp:GridView>
            </div>
            <uc1:PopupElimina runat="server" ID="PopupElimina" />
            <uc1:PopupMessaggio runat="server" ID="PopupMessaggio" />
        </ContentTemplate>

    </asp:UpdatePanel>
</asp:Content>
