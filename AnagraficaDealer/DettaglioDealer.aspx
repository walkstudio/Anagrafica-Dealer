<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="DettaglioDealer.aspx.cs" Inherits="Spindox.AnagraficaDealer.DettaglioDealer" %>

<%@ Register Src="~/UserControl/Menu/RicercaSubMenuControl.ascx" TagPrefix="uc1" TagName="RicercaSubMenuControl" %>
<%@ Register Src="~/UserControl/DettaglioDealer/DettaglioStorico.ascx" TagPrefix="uc1" TagName="DettaglioStorico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContentPlaceHolder" runat="server">
    <link href="Resources/Stylesheets/AD-MasterPage.css" rel="stylesheet" />
    <link href="Resources/Stylesheets/AD-Stylesheet.css" rel="stylesheet" />
    <link href="Resources/Stylesheets/DettaglioDealer.css" rel="stylesheet" />

    <script language="javascript" type="text/javascript">
        function showHide(divNum) {
            for (i = 1; i <= 5; i++) {
                var curDiv = document.getElementById('div_' + i);
                curDiv.style.display = 'none';
                if (i == divNum) {
                    document.getElementById('link_' + i).className = 'labelSubMenuSelectedDD';
                    document.getElementById('stepNumber' + i).className = 'divSubMenuSelectedDD';
                } else {
                    document.getElementById('link_' + i).className = 'labelSubMenuDD';
                    document.getElementById('stepNumber' + i).className = 'divSubMenuDD';
                }
            }
            document.getElementById('div_' + divNum).style.display = 'block';
            document.getElementById('<%= divNumHiddenField.ClientID %>').value = divNum;
        }

    </script>

    <script type="text/javascript">
        window.onload = function selectMenuTab() {
            //document.getElementById('divMenuRicerca').className = "divMenuSelectedTab";
            //document.getElementById('MainContentPlaceHolder_RicercaSubMenuControl_dettaglioDealerSubMenu').className = "divSubMenuSelectedTab";
            //document.getElementById('dettaglioDealerLabel').className = "labelSubMenuSelectedDD";
            for (i = 1; i <= 5; i++) {
                if (i != document.getElementById('<%= divNumHiddenField.ClientID %>').value) {
                    document.getElementById('div_' + i).style.display = "none";
                }
                else
                {    
                    document.getElementById('<%= divNumHiddenField.ClientID %>').value = i;
                }
            }
        }
    </script>

       <script type="text/javascript">
           $(document).ready(function () {
               showHide(document.getElementById('<%= divNumHiddenField.ClientID %>').value)
            })
    </script>

           

<%--    <script type="text/javascript">

        function SaveDivNum(divNum) {
            document.getElementById('<%= divNumHiddenField.ClientID %>').value = divNum;
            document.getElementById('<%= Label1.ClientID %>').innerHTML = divNum;
        }
</script>--%>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <AjaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" EnableScriptGlobalization="True"></AjaxToolkit:ToolkitScriptManager>
    <uc1:RicercaSubMenuControl runat="server" ID="RicercaSubMenuControl" Visible="False" />
    <div id="pageSteps" class="divRowSubMenuDD">
        <div id="stepNumber1" class="divSubMenuSelectedDD">
            <a id="link_1" href="#" onclick="showHide(1);" class="labelSubMenuSelectedDD">ANAGRAFICA</a>
        </div>
        <div id="stepNumber2" class="divSubMenuDD">
            <a id="link_2" href="#" onclick="showHide(2);" class="labelSubMenuDD">DATI AMMINISTRATIVI</a>
        </div>
        <div id="stepNumber3" class="divSubMenuDD">
            <a id="link_3" href="#" onclick="showHide(3)" class="labelSubMenuDD">NEGOZIO</a>
        </div>
        <div id="stepNumber4" class="divSubMenuDD">
            <a id="link_4" href="#" onclick="showHide(4)" class="labelSubMenuDD">VENDITE</a>
        </div>
        <div id="stepNumber5" class="divSubMenuDD">
            <a id="link_5" href="#" onclick="showHide(5)" class="labelSubMenuDD">STORICO</a>
        </div>
        <div class="divSubMenuCodiceDealerTab">
            <asp:LinkButton ID="codiceDealerLinkButton" runat="server" Text="Codice Dealer:" CssClass="labelSubMenuDD" Enabled="false"></asp:LinkButton>
        </div>
    </div>
    <div id="panels">
        <div id="div_1">
            <asp:PlaceHolder ID="anagraficaPlaceHolder" runat="server"></asp:PlaceHolder>
        </div>
        <div id="div_2">
            <asp:PlaceHolder ID="datiAmministrativiPlaceHolder" runat="server"></asp:PlaceHolder>
        </div>
        <div id="div_3">
            <asp:PlaceHolder ID="negozioPlaceHolder" runat="server"></asp:PlaceHolder>
        </div>
        <div id="div_4">
            <asp:PlaceHolder ID="venditePlaceHolder" runat="server"></asp:PlaceHolder>
        </div>
        <div id="div_5">
            <uc1:DettaglioStorico runat="server" ID="DettaglioStorico" />
        </div>
        <div>
            <table style="width: 100%">
                <tr style="text-align: center">
                    <td style="width: 30%"></td>
                    <td style="color: #FF0000">
                        <asp:ValidationSummary ID="myValidationSummary" runat="server" ValidationGroup="ValidazioneControlli" ForeColor="Red" DisplayMode="List" CssClass="fontSize" />
                       
                    </td>
                    <td style="width: 30%"></td>
                </tr>
            </table>
        </div>
        <div id="div_Buttons" class="divFooterDD">
            <div class="divFooterInfo">
                <table>
                    <asp:Label ID="dataUltimaModificaLabel" runat="server" CssClass="labelDD"></asp:Label>
                </table>
                <table>
                    <asp:Label ID="dataUltimaModificaUtenteLabel" runat="server" CssClass="labelDD"></asp:Label>
                </table>
            </div>
            <div class="divFooterSalva">
                <asp:ImageButton ID="salvaImageButton" ImageUrl="~/Resources/Images/Bottoni/salva_active.png" OnClick="salvaImageButton_Click" runat="server" AlternateText="SALVA" CssClass="imgBtn" ValidationGroup="ValidazioneControlli" />
            </div>
             <div>
             <asp:Label ID="retCodeLabel" runat="server" ForeColor="Red" CssClass="labelDD"></asp:Label>
            </div>
        </div>
       
        <div style="text-align: center">
            <asp:Label ID="variazioniLabel" runat="server" ForeColor="Red" CssClass="labelDD"></asp:Label>
        </div>
    </div>
    <asp:HiddenField ID="IDDealerHiddenField" runat="server" />
    <asp:HiddenField ID="divNumHiddenField" runat="server" />
</asp:Content>
