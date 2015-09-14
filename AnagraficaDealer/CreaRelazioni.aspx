<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CreaRelazioni.aspx.cs" Inherits="Spindox.AnagraficaDealer.CreaRelazioni" %>

<%@ Register Src="~/UserControl/Menu/RelazioniSubMenuControl.ascx" TagPrefix="uc1" TagName="RelazioniSubMenuControl" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>
<%@ Register Src="~/UserControl/RagioniSocialiCorrelate/PopupAggiungiRelazioneDealer.ascx" TagPrefix="uc1" TagName="PopupAggiungiRelazioneDealer" %>
<%@ Register Src="~/UserControl/Popup/PopupMessaggio.ascx" TagPrefix="uc1" TagName="PopupMessaggio" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContentPlaceHolder" runat="Server">

    <script type="text/javascript">
        window.onload = function selectMenuTab() {
            document.getElementById('divMenuRelazioni').className = "divMenuSelectedTab";
            document.getElementById('MainContentPlaceHolder_RelazioniSubMenuControl_creaRelSubMenu').className = "divSubMenuSelectedTab";
            document.getElementById('creaRelTab').className = "labelSubMenuSelected";
        }

        function BindEvents() {
            $(document).ready(function () {
                document.getElementById('MainContentPlaceHolder_RelazioniSubMenuControl_creaRelSubMenu').className = "divSubMenuSelectedTab";
                document.getElementById('creaRelTab').className = "labelSubMenuSelected";

            });
        }

    </script>

</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <ajx:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajx:ToolkitScriptManager>


    <uc1:RelazioniSubMenuControl runat="server" ID="RelazioniSubMenuControl" />

    <asp:UpdatePanel ID="creaRelUpdatePanel" runat="server" UpdateMode="Conditional">

        <ContentTemplate>

                       <script type="text/javascript">
                Sys.Application.add_load(BindEvents);
            </script>


                <table id="tableREP" runat="server" class="tableCreaRelazione">
                    <tr>
                        <td>
                            <label class="label">Nome Relazione: </label>
                        </td>
                         <td colspan="5">
                            <asp:TextBox ID="txtNomeRelazione" runat="server" CssClass="textBox txtBoxLarge"></asp:TextBox>
                            <ajx:TextBoxWatermarkExtender ID="TBWENomerRelazione" runat="server" TargetControlID="txtNomeRelazione" WatermarkText="--Nome Relazione--" WatermarkCssClass="watermark textBox txtBoxLarge"></ajx:TextBoxWatermarkExtender>
                            <asp:RequiredFieldValidator ID="RFVNomeRelazione" runat="server" ErrorMessage="*" ControlToValidate="txtNomeRelazione" ValidationGroup="SalvaBtn"></asp:RequiredFieldValidator>

                        </td>
                    </tr>
                    <tr>
                        <td class="tdCol1Amministrazione tdSpace" rowspan="1" colspan="3">
                            <label class="lblSectionAmministazione">Dealer 1</label>
                        </td>
                         <td class="tdCol1Amministrazione tdSpace" rowspan="1" colspan="3">
                            <label class="lblSectionAmministazione">Dealer 2</label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="1" class="tdLbl3">
                            <label class="label">Tipo Dealer : </label>
                        </td>

                        <td class="tdTXT" colspan="1">
                            <asp:DropDownList ID="ddlTipoDealer1" runat="server" CssClass="ddlStyle ddlMediumRicerca" BackColor="White" Enabled="False">
                                <asp:ListItem Value="1" Text="Consumer" Enabled="true" Selected="false"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td colspan="1">

                            <asp:ImageButton ID="btnResetDealer1" CssClass="imgCercaUtente" runat="server" ImageAlign="Bottom" ImageUrl="~/Resources/Images/Master/Reset-icon.png" ToolTip="Reset Dealer 1" OnClick="btnResetDealer1_Click" Width="16px" />
                        </td>
                        <td colspan="1" class="tdLbl3">
                            <label class="label">Tipo Dealer : </label>
                        </td>
                        <td class="tdTXT">
                            <asp:DropDownList ID="ddlTipoDealer2" runat="server" CssClass="ddlStyle ddlMediumRicerca">
                                <asp:ListItem Value="1" Text="Consumer" Selected="True"></asp:ListItem>
                                <asp:ListItem Value="2" Text="Business"></asp:ListItem>

                            </asp:DropDownList>
                        </td>
                        <td class="tdBTN" colspan="1">

                            <asp:ImageButton ID="btnResetDealer2" CssClass="imgCercaUtente" runat="server" ImageAlign="Bottom" ImageUrl="~/Resources/Images/Master/Reset-icon.png" ToolTip="Reset Dealer 2" OnClick="btnResetDealer2_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdLbl3">
                            <asp:RadioButton ID="RBCodiceDealer1" runat="server" CssClass="label" Text="Codice Dealer" GroupName="RadioButtonList1" AutoPostBack="true" Checked="True" OnCheckedChanged="radioBtnDCCD_CheckedChanged" />
                        </td>
                        <td class="txtBoxLargeCR" colspan="1">
                            <asp:TextBox ID="TBCodiceDealer1" runat="server" CssClass="textBox txtBoxLarge"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RfvCodiceDealer1" runat="server" ErrorMessage="*" ControlToValidate="TBCodiceDealer1" ValidationGroup="SalvaBtn"></asp:RequiredFieldValidator>
                        <ajx:TextBoxWatermarkExtender ID="TBWECodiceDealer1" runat="server" TargetControlID="TBCodiceDealer1" WatermarkText="--Codice Dealer 1--" WatermarkCssClass="watermark textBox txtBoxLarge"></ajx:TextBoxWatermarkExtender>
                        </td>
                          <td colspan="1">
                            <asp:ImageButton ID="btnCD1" CssClass="imgCercaUtente" runat="server" ImageAlign="Bottom" ImageUrl="~/Resources/Images/Master/Search-icon.png" ToolTip="Cerca Dealer 1" OnClick="btnCercaDealer1_Click" Visible="true" />

                        </td>
                        <td class="tdLbl3">
                            <asp:RadioButton ID="RBCodiceDealer2" runat="server" CssClass="label" Text="Codice Dealer" GroupName="RadioButtonList2" AutoPostBack="true" Checked="True" OnCheckedChanged="radioBtnDCD_CheckedChanged" />

                        </td>
                        <td colspan="1" class="txtBoxLargeCR">
                            <asp:TextBox ID="TBCodiceDealer2" runat="server" CssClass="textBox txtBoxLarge" >
                            </asp:TextBox>
                               <asp:RequiredFieldValidator ID="RfvCodiceDealer2" runat="server" ErrorMessage="*" ControlToValidate="TBCodicedealer2" ValidationGroup="SalvaBtn"></asp:RequiredFieldValidator>
                        <ajx:TextBoxWatermarkExtender ID="TBWECodiceDealer2" runat="server" TargetControlID="TBCodicedealer2" WatermarkText="--Codice Dealer 2--" WatermarkCssClass="watermark textBox txtBoxLarge"></ajx:TextBoxWatermarkExtender>
                        </td>
                         <td class="tdBTN" colspan="1">
                            <asp:ImageButton ID="btnCD2" CssClass="imgCercaUtente" runat="server" ImageAlign="Bottom" ImageUrl="~/Resources/Images/Master/Search-icon.png" ToolTip="Cerca Dealer 2" OnClick="btnCercaDealer2_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td class="tdLbl3">
                            <asp:RadioButton ID="RBRagioneSociale1" runat="server" CssClass="label" Text="Ragione Sociale" GroupName="RadioButtonList1" AutoPostBack="true" OnCheckedChanged="radioBtnDCRS_CheckedChanged" />
                        </td>
                        <td class="txtBoxLargeCR" colspan="1">
                            <asp:TextBox ID="TBRagioneSociale1" runat="server" CssClass="textBox txtBoxLarge" ToolTip="Nome SG" Visible="true" Enabled="false"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RfvRagioneSociale1" runat="server" ErrorMessage="*" ControlToValidate="TBRagioneSociale1" ValidationGroup="SalvaBtn"></asp:RequiredFieldValidator>
                        <ajx:TextBoxWatermarkExtender ID="TBWERagioneSociale1" runat="server" TargetControlID="TBRagioneSociale1" WatermarkText="--Ragione Sociale 1--" WatermarkCssClass="watermark textBox txtBoxLarge"></ajx:TextBoxWatermarkExtender>
                             </td>
                        <td colspan="1">
                            <asp:ImageButton ID="btnRS1" CssClass="imgCercaUtente" runat="server" ImageAlign="Bottom" ImageUrl="~/Resources/Images/Master/Search-icon.png" ToolTip="Cerca Ragione Sociale 1" OnClick="btnCercaDealer1_Click" Visible="false" />
                        </td>
                         
                        <td class="tdLbl3">
                            <asp:RadioButton ID="RBRagioneSociale2" runat="server" CssClass="label" Text="Ragione Sociale" GroupName="RadioButtonList2" AutoPostBack="true" OnCheckedChanged="radioBtnDRS_CheckedChanged" />
                        </td>
                        <td colspan="1" class="txtBoxLargeCR">
                            <asp:TextBox ID="TBRagioneSociale2" runat="server" CssClass="textBox txtBoxLarge" Visible="true" Enabled="false">
                            </asp:TextBox>
                               <asp:RequiredFieldValidator ID="RfvRagioneSociale2" runat="server" ErrorMessage="*" ControlToValidate="TBRagioneSociale2" ValidationGroup="SalvaBtn"></asp:RequiredFieldValidator>
                        <ajx:TextBoxWatermarkExtender ID="TBWERagioneSociale2" runat="server" TargetControlID="TBRagioneSociale2" WatermarkText="--Ragione Sociale 2--" WatermarkCssClass="watermark textBox txtBoxLarge"></ajx:TextBoxWatermarkExtender>
                        </td>
                        <td class="tdBTN" colspan="1">
                            <asp:ImageButton ID="btnRS2" CssClass="imgCercaUtente" runat="server" ImageAlign="Bottom" ImageUrl="~/Resources/Images/Master/Search-icon.png" ToolTip="Cerca Dealer 2" OnClick="btnCercaDealer2_Click" visible="false"/>
                        </td>
                    </tr>
                    <tr>
                        <td><asp:HiddenField ID="IDDealerScelto1HF" runat="server"/></td>
                        <td colspan="2" class="txtBoxLarge">
                            <asp:TextBox ID="TBDealerScelto1" runat="server" CssClass="textBox txtBoxLarge" Visible="false" Enabled="false"></asp:TextBox>
                            <ajx:TextBoxWatermarkExtender ID="TBWEDealerScelto1" runat="server" TargetControlID="TBDealerScelto1" WatermarkText="--Dealer Scelto 1--" WatermarkCssClass="watermark textBox txtBoxLarge"></ajx:TextBoxWatermarkExtender>
                        </td>
                        <td><asp:HiddenField ID="IDDealerScelto2HF" runat="server"/></td>
                        <td colspan="2" class="txtBoxLarge">
                            <asp:TextBox ID="TBDealerScelto2" runat="server" CssClass="textBox txtBoxLarge" Visible="false" Enabled="false"></asp:TextBox>
                            <ajx:TextBoxWatermarkExtender ID="TBWEDealerScelto2" runat="server" TargetControlID="TBDealerScelto2" WatermarkText="--Dealer Scelto 2--" WatermarkCssClass="watermark textBox txtBoxLarge"></ajx:TextBoxWatermarkExtender>
                        </td>
                    </tr>
                       <tr><td class="tdSpace"></td></tr>
                    <tr>
                        <td class="tdAlignRight" colspan="6">
                            <asp:ImageButton ID="SalvaRSButton" runat="server" CssClass="imgBtn" ImageUrl="~/Resources/Images/Bottoni/btn_confirm_popup.png" OnClick="SalvaRSButton_Click" ValidationGroup="SalvaBtn" />
                        </td>
                    </tr>              
                </table>
            <uc1:PopupAggiungiRelazioneDealer runat="server" ID="PopupAggiungiRelazioneDealer" />
            <uc1:PopupMessaggio runat="server" ID="PopupMessaggio" />
        </ContentTemplate>

        <Triggers>

            <asp:AsyncPostBackTrigger ControlID="RBCodiceDealer1" />
            <asp:AsyncPostBackTrigger ControlID="RBCodiceDealer2" />
            <asp:AsyncPostBackTrigger ControlID="RBRagioneSociale1" />
            <asp:AsyncPostBackTrigger ControlID="RBRagioneSociale2" />
            <asp:AsyncPostBackTrigger ControlID="btnCD1" />
            <asp:AsyncPostBackTrigger ControlID="btnRS1" />
            <asp:AsyncPostBackTrigger ControlID="btnResetDealer1" />
            <asp:AsyncPostBackTrigger ControlID="btnCD2" />
            <asp:AsyncPostBackTrigger ControlID="btnRS2" />
            <asp:AsyncPostBackTrigger ControlID="btnResetDealer2" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
