<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="GestioneUtenti.aspx.cs" Inherits="Spindox.AnagraficaDealer.GestioneUtenti" %>


<%@ Register Src="~/UserControl/Menu/AmministrazioneSubMenuControl.ascx" TagPrefix="uc1" TagName="AmministrazioneSubMenuControl" %>
<%@ Register Src="~/UserControl/Menu/GestioneUtentiSubMenuControl.ascx" TagPrefix="uc1" TagName="GestioneUtentiSubMenuControl" %>
<%@ Register Src="~/UserControl/Popup/PopupMessaggio.ascx" TagPrefix="uc1" TagName="PopupMessaggio" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajx" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContentPlaceHolder" runat="Server">

    <script type="text/javascript">
        window.onload = function selectMenuTab() {
            document.getElementById('MainContentPlaceHolder_AmministrazioneSubMenuControl_utentiSubMenu').className = "divSubMenuSelectedTab";
            document.getElementById('utentiTab').className = "labelSubMenuSelected";
        }
    </script>
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="Server">
    <ajx:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></ajx:ToolkitScriptManager>


    <asp:UpdatePanel ID="utenteUpdatePanel" runat="server" UpdateMode="Conditional">

        <ContentTemplate>
            <uc1:AmministrazioneSubMenuControl runat="server" ID="AmministrazioneSubMenuControl" />
            <uc1:GestioneUtentiSubMenuControl runat="server" ID="GestioneUtentiSubMenuControl" />
            <asp:HiddenField ID="IDUtenteHiddenField" runat="server" />

            <table style="margin-left: 10px;">
                <tr>
                    <td class="tdCol1Amministrazione tdSpace" rowspan="1" colspan="6">
                        <label class="lblSectionAmministazione">Anagrafica utente</label>
                    </td>
                </tr>
                <tr>
                    <td class="">
                        <asp:Label ID="lblUsername" runat="server" CssClass="label" Text="Username :"></asp:Label>
                    </td>
                    <td class="" colspan="1">
                        <asp:TextBox ID="txtUsernameUtente" runat="server" CssClass="textBox txtBoxLarge" ToolTip="Username utente" placeholder="--Username utente--"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RfvUsernameUtente" runat="server" ErrorMessage="*" ControlToValidate="txtUsernameUtente" ValidationGroup="ConfermaBtn"></asp:RequiredFieldValidator>
                        <ajx:TextBoxWatermarkExtender ID="TBWEUsernameUtente" runat="server" TargetControlID="txtUsernameUtente" WatermarkText="--Username utente--" WatermarkCssClass="watermark textBox txtBoxLarge"></ajx:TextBoxWatermarkExtender>
                    </td>
                    <td>
                        <asp:ImageButton ID="btnCercaUtente" CssClass="imgCercaUtente" runat="server" ImageAlign="Middle" ImageUrl="~/Resources/Images/Master/Search-icon.png" ToolTip="Cerca utente" OnClick="btnCercaUtente_Click" />

                        <asp:ImageButton ID="btnResetUtente" CssClass="imgCercaUtente" runat="server" ImageAlign="Middle" ImageUrl="~/Resources/Images/Master/Reset-icon.png" ToolTip="Reset utente" OnClick="btnResetUtente_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="">
                        <asp:Label ID="lblNome" runat="server" CssClass="label" Text="Nome :"></asp:Label>
                    </td>
                    <td class="">
                        <asp:TextBox ID="txtNomeUtente" runat="server" CssClass="textBox txtBoxLarge" ToolTip="Nome utente" placeholder="--Nome utente--" Enabled="false"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RfvNomeUtente" runat="server" ErrorMessage="*" ControlToValidate="txtNomeUtente" ValidationGroup="ConfermaBtn"></asp:RequiredFieldValidator>
                        <ajx:TextBoxWatermarkExtender ID="TBWENomeUtente" runat="server" TargetControlID="txtNomeUtente" WatermarkText="--Nome utente--" WatermarkCssClass="watermark textBox txtBoxLarge"></ajx:TextBoxWatermarkExtender>
                    </td>
                    <td class="">
                        <asp:Label ID="lblCognome" runat="server" CssClass="label" Text="Cognome :"></asp:Label>
                    </td>
                    <td colspan="5">

                        <asp:TextBox ID="txtCognomeUtente" runat="server" CssClass="textBox txtBoxLarge" ToolTip="Cognome utente" Enabled="false" placeholder="--Cognome utente--"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RfvCognomeUtente" runat="server" ErrorMessage="*" ControlToValidate="txtCognomeUtente" ValidationGroup="ConfermaBtn"></asp:RequiredFieldValidator>
                        <ajx:TextBoxWatermarkExtender ID="TBWECognomeUtente" runat="server" TargetControlID="txtCognomeUtente" WatermarkText="--Cognome utente--" WatermarkCssClass="watermark textBox txtBoxLarge"></ajx:TextBoxWatermarkExtender>
                    </td>
                </tr>
                <tr>
                    <td class="">
                        <asp:Label ID="lblEmail" runat="server" CssClass="label" Text="Email :"></asp:Label>
                    </td>
                    <td class="">
                        <asp:TextBox ID="txtEmailUtente" runat="server" CssClass="textBox txtBoxLarge" ToolTip="Email utente" placeholder="--Email utente--"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RfvEmailUtente" runat="server" ErrorMessage="*" ControlToValidate="txtEmailUtente" ValidationGroup="ConfermaBtn"></asp:RequiredFieldValidator>
                        <ajx:TextBoxWatermarkExtender ID="TBWEEmailUtente" runat="server" TargetControlID="txtEmailUtente" WatermarkText="--Email utente--" WatermarkCssClass="watermark textBox txtBoxLarge"></ajx:TextBoxWatermarkExtender>

                    </td>

                </tr>
                <tr>
                    <td class="tdSpace" colspan="3">
                        <label class="lblSectionAmministazione tdSpace">Profilo utente</label>
                    </td>
                    <td colspan="3">
                        <asp:Label ID="lblCodiceRuolo" runat="server" CssClass="lblSectionAmministazione tdSpace lblLeftPad5px" Text="Codice Ruolo"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="tdCol2Amministrazione" colspan="3">
                        <asp:DropDownList ID="ddlProfiloUtente" runat="server" CssClass="ddlStyle ddlMedium" OnLoad="ddlProfiloUtente_Load" OnSelectedIndexChanged="ddlProfiloUtente_Change" AutoPostBack="true"></asp:DropDownList>
                    </td>
                    <td colspan="3">
                        <asp:TextBox ID="txtCodiceRuolo" runat="server" CssClass="textBox txtBoxLarge" Enabled="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="6"></td>
                </tr>
                <tr class="">

                    <td colspan="3"></td>
                    <td class="tdAlignRight">
                        <asp:ImageButton ID="AggiungiUtenteButton" runat="server" CssClass="imgBtn" ImageUrl="~/Resources/Images/Bottoni/btn_confirm_popup.png" OnClick="AggiungiUtenteButton_Click" ValidationGroup="ConfermaBtn" />
                        <asp:ImageButton ID="ModicaUtenteButton" runat="server" CssClass="imgBtn" ImageUrl="~/Resources/Images/Bottoni/btn_confirm_popup.png" OnClick="ModicaUtenteButton_Click" ValidationGroup="ConfermaBtn" />
                    </td>

                </tr>

            </table>
                <uc1:PopupMessaggio runat="server" ID="PopupMessaggio" />
        </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="ddlProfiloUtente" EventName="SelectedIndexChanged"/>
    </Triggers>
    </asp:UpdatePanel>

</asp:Content>
