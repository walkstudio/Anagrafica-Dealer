<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="GestioneProfili.aspx.cs" Inherits="Spindox.AnagraficaDealer.GestioneProfili" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>

<%@ Register Src="~/UserControl/Menu/AmministrazioneSubMenuControl.ascx" TagPrefix="uc1" TagName="AmministrazioneSubMenuControl" %>
<%@ Register Src="~/UserControl/Menu/GestioneProfiliSubMenuControl.ascx" TagPrefix="uc1" TagName="GestioneProfiliSubMenuControl" %>
<%@ Register Src="~/UserControl/Popup/PopupAggiungiTipoDealer.ascx" TagPrefix="uc1" TagName="PopupAggiungiTipoDealer" %>
<%@ Register Src="~/UserControl/Popup/PopupMessaggio.ascx" TagPrefix="uc1" TagName="PopupMessaggio" %>

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
            gridviewScrollTipoDealer();
            gridviewScrollAbilitazioni();
        }

        $(document).ready(function () {
            gridviewScrollTipoDealer();
            gridviewScrollAbilitazioni();
        });

        function gridviewScrollTipoDealer() {
            $('#<%=tipoDealerGridView.ClientID%>').gridviewScroll({
                width: "99.99%",
                 height: 220,
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
        
         function gridviewScrollAbilitazioni() {
             $('#<%=autorizzazioneCampiGridView.ClientID%>').gridviewScroll({
                width: "99.99%",
                height: 220,
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

    <asp:HiddenField ID="IDProfiloHF" runat="server" />

    <uc1:AmministrazioneSubMenuControl runat="server" ID="AmministrazioneSubMenuControl" />
    <uc1:GestioneProfiliSubMenuControl runat="server" ID="GestioneProfiliSubMenuControl" />


    <asp:UpdatePanel ID="profiliUpdatePanel" runat="server" UpdateMode="Conditional">

        <ContentTemplate>
              <script type="text/javascript">
                  Sys.Application.add_load(BindEvents);
            </script>
            <table style="margin-left: 10px;">
                <tr>
                    <td colspan="4">
                        <table style="padding: 3px; margin: 3px">
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server" CssClass="lblSectionProfili" Text="Nome Profilo"></asp:Label>
                                    </td>
                                <td>
                                    <asp:TextBox ID="txtNomeProfilo" runat="server" CssClass="textBox txtBoxLarge" placeholder="--Nome profilo--" ToolTip="Nome profilo" ValidationGroup="btnSalvaProfilo"></asp:TextBox>
                                    <ajx:TextBoxWatermarkExtender ID="tbweNomeProfilo" runat="server" TargetControlID="txtNomeProfilo" WatermarkCssClass="watermark textBox txtBoxLarge" WatermarkText="--Nome profilo--">
                                    </ajx:TextBoxWatermarkExtender>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="rfvNomeProfilo" runat="server" ControlToValidate="txtNomeProfilo" CssClass="label" ErrorMessage="Nome profilo obbligatorio" ForeColor="Red" ValidationGroup="btnSalvaProfilo"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label runat="server" CssClass="lblSectionProfili" Text="Abilitazione sui Dealer"></asp:Label>
                    </td>
                    <td colspan="1">
                        <asp:ImageButton ID="btnAggiungiTipoDealer" runat="server" ImageUrl="/Resources/Images/Bottoni/btn_add_active.png" CssClass="imgBtn" OnClick="btnAggiungiTipoDealer_Click" />
                    </td>
                    <td colspan="1"></td>
                    <td>
                        <asp:Label runat="server" CssClass="lblSectionProfili" Text="Autorizzazioni sui Campi"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="divGridViewProfiliSmall">
                            <asp:GridView ID="tipoDealerGridView" runat="server" AutoGenerateColumns="False" GridLines="None" OnLoad="tipoDealerGridView_Load" Width="99.99%">
                                <Columns>
                                    <asp:TemplateField HeaderText="IDTipoDealer" SortExpression="IDTipoDealer" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("IDTipoDealer") %>' ID="IDTipoDealerLabel"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Tipo Dealer" SortExpression="NomeTipoDealer">
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Bind("NomeTipoDealer") %>' ID="nomeTipoDealerLabel"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Elimina">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="btnEliminaTipoDealer" runat="server" ImageUrl="/Resources/Images/Dettaglio/delete_active.png" Style="width: 20px; height: 20px; border: 0px solid" OnClick="btnEliminaTipoDealer_Click" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle CssClass="GridviewScrollHeader" />
                                <RowStyle CssClass="GridviewScrollItem" />
                                <PagerStyle CssClass="GridviewScrollPager" />
                            </asp:GridView>
                        </div>
                    </td>
                    <td colspan="1" class="tdColumn3Dettaglio"></td>
                    <td>
                        <div class="divGridViewProfiliLarge">
                            <asp:GridView ID="autorizzazioneCampiGridView" runat="server" AutoGenerateColumns="False" GridLines="None" OnLoad="autorizzazioniCampiGridView_Load" Width="99.99%">
                                <Columns>
                                    <asp:TemplateField HeaderText="Tabella" SortExpression="NomeTabella">
                                        <ItemTemplate>
                                            <asp:Label ID="NomeTabellaLabel" runat="server" Text='<%# Bind("NomeTabella") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Campo" SortExpression="NomeCampo">
                                        <ItemTemplate>
                                            <asp:Label ID="NomeCampoLabel" runat="server" Text='<%# Bind("NomeCampoFrontEnd") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Autorizzazione" SortExpression="Autorizzazione">
                                        <ItemTemplate>
                                            <asp:DropDownList ID="autorizzazioneDropDownList" runat="server" CssClass="ddlSmall" DataSourceID="permissionXmlDataSource0" DataTextField="Descrizione" DataValueField="PermissionId" Enabled='<%# Bind("PermessoModificabile") %>' SelectedValue='<%# Bind("Autorizzazione") %>'>
                                            </asp:DropDownList>
                                            <asp:XmlDataSource ID="permissionXmlDataSource0" runat="server" DataFile="~/App_Data/PermissionSezioniCampi.xml"></asp:XmlDataSource>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="IDAutorizzazioneCampi" SortExpression="IDAutorizzazioneCampi" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="IDAutorizzazioneCampiLabel" runat="server" Text='<%# Bind("IDAutorizzazioneCampi") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="IDCampoDati" SortExpression="IDCampoDati" Visible="False">
                                        <ItemTemplate>
                                            <asp:Label ID="IDCampoDatiLabel" runat="server" Text='<%# Bind("IDCampoDati") %>'></asp:Label>
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
                <tr>
                    <td colspan="4">
                        <table>
                            <tr>
                                <td colspan="11">
                                    <asp:Label ID="Label1" runat="server" CssClass="lblSectionProfili" Text="Abilitazioni generali"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="amministrazioneLabel" runat="server" CssClass="label" Text="Amministrazione"></asp:Label>
                                </td>
                                <td>
                                    <asp:CheckBox ID="amministrazioneCheckBox" runat="server" CssClass="chkBox" />
                                </td>
                                <td class="tdColumn3Dettaglio">&nbsp;</td>
                                <td>
                                    <asp:Label ID="lblPortafoglio" runat="server" CssClass="label" Text="Portafoglio"></asp:Label>
                                </td>
                                <td>
                                    <asp:CheckBox ID="portafoglioCheckBox" runat="server" CssClass="chkBox" />
                                </td>
                                <td class="tdColumn3Dettaglio">&nbsp;</td>
                                <td>
                                    <asp:Label ID="eccezioniLabel" runat="server" CssClass="label" Text="Eccezioni Import"></asp:Label>
                                </td>
                                <td>
                                    <asp:CheckBox ID="eccezioniCheckBox" runat="server" CssClass="chkBox" />
                                </td>
                                <td class="tdColumn3Dettaglio">&nbsp;</td>
                                <td>
                                    <asp:Label ID="relazioniLabel" runat="server" CssClass="label" Text="Ragioni Sociali Correlate"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="relazioniDropDownList" runat="server" CssClass="ddlSmall" DataSourceID="permissionXmlDataSource" DataTextField="Descrizione" DataValueField="PermissionId">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="databaseLabel" runat="server" CssClass="label" Text="Archivio Database"></asp:Label>
                                </td>
                                <td>
                                    <asp:CheckBox ID="databaseCheckBox" runat="server" CssClass="chkBox" />
                                </td>
                                <td class="tdColumn3Dettaglio">&nbsp;</td>
                                <td>
                                    <asp:Label ID="cruscottoLabel" runat="server" CssClass="label" Text="Archivio Cruscotto"></asp:Label>
                                </td>
                                <td>
                                    <asp:CheckBox ID="cruscottoCheckBox" runat="server" CssClass="chkBox" />
                                </td>
                                <td class="tdColumn3Dettaglio">&nbsp;</td>
                                <td>
                                    <asp:Label ID="scartiLabel" runat="server" CssClass="label" Text="Report Scarti"></asp:Label>
                                </td>
                                <td>
                                    <asp:CheckBox ID="scartiCheckBox" runat="server" CssClass="chkBox" />
                                </td>
                                <td class="tdColumn3Dettaglio">&nbsp;</td>
                                <td>
                                    <asp:Label ID="anomalieLabel" runat="server" CssClass="label" Text="Report Anomalie"></asp:Label>
                                    <asp:CheckBox ID="anomalieCheckBox" runat="server" CssClass="chkBox" />
                                       </td>
                                <td>
                                   
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:ImageButton ID="btnSalvaProfilo" runat="server" CssClass="imgBtn floatRight" ImageUrl="/Resources/Images/Bottoni/confirm1.png" OnClick="btnSalvaProfilo_Click" ValidationGroup="btnSalvaProfilo" />
                        <asp:XmlDataSource ID="permissionXmlDataSource" runat="server" DataFile="~/App_Data/PermissionSezioniCampi.xml"></asp:XmlDataSource>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnAggiungiTipoDealer" />
            <asp:PostBackTrigger ControlID="btnSalvaProfilo" />
        </Triggers>
    </asp:UpdatePanel>
    <uc1:PopupAggiungiTipoDealer runat="server" ID="PopupAggiungiTipoDealer" />
    <uc1:PopupMessaggio runat="server" ID="PopupMessaggio" />


</asp:Content>
