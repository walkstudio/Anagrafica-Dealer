<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Ricerca.aspx.cs" Inherits="Spindox.AnagraficaDealer.Ricerca" %>
<%@ Register src="UserControl/Menu/RicercaSubMenuControl.ascx" tagname="RicercaSubMenuControl" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeaderContentPlaceHolder" runat="server">



    <script type="text/javascript" language="javascript" src="Resources/Scripts/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" language="javascript" src="Resources/Scripts/jquery-ui-1.11.2.custom.min.js"></script>
    <script type="text/javascript" language="javascript" src="Resources/Scripts/jquery-ui_1.10.3.js"></script>
    <script type="text/javascript" language="javascript" src="Resources/Scripts/ui.dropdownchecklist.js"></script>
    <script type="text/javascript" language="javascript" src="Resources/Scripts/Ricerca.js"></script>
    <script type="text/javascript" language="javascript" src="Resources/Scripts/RicercaLoad.js"></script>
    <script type="text/javascript" language="javascript" src="Resources/Scripts/jquery.ui.datepicker-it.js"></script>
    <link href="Resources/Stylesheets/jquery-ui.css" rel="stylesheet" />
    <link href="Resources/Stylesheets/jquery-ui-1.11.2.custom.css" rel="stylesheet" />
    <link href="Resources/Stylesheets/ui.dropdownchecklist.themeroller.css" rel="stylesheet" />
    <link href="Resources/Stylesheets/Ricerca.css" rel="stylesheet" />

     <script type="text/javascript">
         var maxPager = parseInt("<%=ConfigurationManager.AppSettings["maxPager"]%>");
         var rowsShown = parseInt("<%=ConfigurationManager.AppSettings["rowsShown"]%>");
         window.onload = function selectMenuTab() {

            document.getElementById('divMenuRicerca').className = "divMenuSelectedTab";
            //document.getElementById('MainContentPlaceHolder_RicercaSubMenuControl_ricercaBaseSubMenu').className = "divSubMenuSelectedTab";
            //document.getElementById('ricercaBaseLabel').className = "labelSubMenuSelected";
        }

         $(document).ready(function () {

         });

    </script>
    <style type="text/css" >

  
        div.pager {
            text-align: center;
            margin: 1em 0;
        }

        div.pager span {
            display: inline-block;
            width: 1.8em;
            height: 1.8em;
            line-height: 1.8;
            text-align: center;
            cursor: pointer;
            background: #000;
            color: #fff;
            margin-right: 0.5em;
        }

        div.ui-datepicker{
         font-size:12px;
        }

        .no-close .ui-dialog-titlebar-close {
                display: none;
            }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <uc1:RicercaSubMenuControl ID="RicercaSubMenuControl" runat="server" Visible="false" />
    <br />

    <div id="divLoad" 
        style="position: absolute;
        left: 0;
        right: 0;
        top: 0;
        bottom: 0;
        background-color:darkgray;
        z-index:100;
        text-align:center;
        -ms-filter:'progid:DXImageTransform.Microsoft.Alpha(Opacity=95)';
        filter: alpha(opacity=95); 
        ">
       <span style="display: inline-block;
                  line-height: normal; top:50%;
                  vertical-align:middle;"><table border="0" style="height:500px"><tr><td><h2 style="color:white">CARICAMENTO DATI IN CORSO...</h2></td></tr></table>
           <%--<img src="Resources/Images/Ricerca/page-loader.gif" alt="Caricamento dati in corso..." />--%>
       </span>
 </div>
<div id="pageSteps" class="divRowSubMenuRicerca">
    <div id="stepNumber0" class="stepNumber">
        <table id="TblstepNumber_0" border="0" style="width:90%"  onclick="showHide(0)" class="linkSelected tabRaffinaRicercaSelected">
            <tr>
                <td>
                    <span id="link_0"  class="linkSelected"><strong>RICERCA BASE</strong></span>
                </td>
            </tr>
        </table>
    </div>
    <div id="stepNumber1" class="stepNumber">
        <table id="TblstepNumber_1" border="0" style="width:90%" class="linkUnselected tabRaffinaRicercaUnselected">
            <tr>
                <td>
                    <span id="link_1" class="linkUnselected"><strong>RAFFINA RICERCA</strong></span>
                </td>
            </tr>
        </table>
    </div>
    <div id="stepResults" class="stepNumber" style="visibility:hidden" >
        <table id="TblResults" border="0" style="width:90%" onclick="showHide(2)" class="linkUnselected tabRaffinaRicercaUnselected">
            <tr>
                <td>
                    <span id="link_Results" class="linkUnselected"  onclick="showHide(2);"><strong>RISULTATI</strong></span>
                </td>
            </tr>
        </table>
    </div>
</div>
<div style="clear:both"></div>

    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>

<div id="div_0" style="position:relative;width:90%;">
    <table id="tblAnagrafica" border="0" style="width:90%;border-style:solid;border-color:black;border-width:0px;background-color:#E6E7E8;">
        <tr>
            <td>
                <table border="0" style="width:100%" >
                    <tr>
                        <td style="width:150px"><label for="ddlMTipologia" class="label">Tipologia</label></td>
                        <td style="width:150px"><label for="txtDealerCode" class="label">Codice Dealer</label></td>
                        <td style="width:200px"><label for="txtRagioneSociale" class="label">Ragione Sociale</label></td>
                        <td style="width:150px"><label for="txtPIVA" class="label">P. IVA</label></td>
                    </tr>
                    <tr>
                        <td>
                            <select id="ddlMTipologia" Desc="IDTipoDealer" TitleSearch="Tipologia" style="visibility:hidden" showexport="no"  typedb="combo" multiple="multiple">
                            </select>
                        </td>
                        <td>
                            <div class="ui-widget" style="text-align:left">
                                <asp:TextBox ClientIDMode="Static" Desc="Codice" TitleSearch="Codice Dealer" showexport="no" ID="txtDealerCode" typedb="text" runat="server" Width="150px" Text="--Tutti--" CssClass="textbox" />
                            </div>
                        </td>
                        <td>
                            <div class="ui-widget" style="text-align:left">
                                <asp:TextBox ClientIDMode="Static" ID="txtRagioneSociale" TitleSearch="Ragione Sociale" showexport="no" Desc="RagioneSociale" Columns="50" typedb="text" runat="server" Text="--Tutti--" CssClass="textbox" />
                            </div>
                        </td>
                        <td>
                            <asp:TextBox ClientIDMode="Static" ID="txtPIVA" TitleSearch="P.IVA" Desc="PIVA" showexport="no" runat="server" typedb="text" Width="150px" Text="--Tutti--" CssClass="textbox" />
                        </td>
                    </tr>
                   <tr>
                        <td style="width:150px" ><label for="ddlMStato" class="label">Stato</label></td>
                        <td style="width:150px"><label for="ddlMCanale" class="label">Canale</label></td>
                        <td style="width:150px"><label for="ddlMArea" class="label">Area</label></td>
                        <td style="width:150px"><label for="ddlSOperativita" class="label">Operativit&agrave;</label></td>
                    </tr>
                    <tr>
                        <td>
                            <select id="ddlMStato" style="visibility:hidden" showexport="no" TitleSearch="Stato" Desc="IDStato" typedb="combo" multiple="multiple" >
                            </select>
                        </td>
                        <td>
                            <select id="ddlMCanale" style="visibility:hidden" showexport="no" TitleSearch="Canale" Desc="IDCanale" typedb="combo" multiple="multiple">
                            </select>
                        </td>
                        <td>
                            <select id="ddlMArea" style="visibility:hidden" showexport="no" TitleSearch="Area" Desc="IDArea" typedb="combo" multiple="multiple">
                            </select>
                        </td>
                        <td>
                            <select id="ddlSOperativita"  showexport="no" typedb="combo" TitleSearch="Operativita" Desc="IDOperativita" > 
                            </select>
                        </td>

                    </tr>
                    <tr>
                        <td style="width:300px" colspan="2">
                            <label for="ddlSClasse" class="label">Codice Master Dealer</label>
                        </td>
                        <td style="width:150px">&nbsp;</td>
                        <td style="width:150px">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="ui-widget" style="text-align:left">
                                <asp:TextBox ClientIDMode="Static" Desc="MasterDealer" showexport="no" ID="txtMasterDealerCode" typedb="text" runat="server" Width="150px" CssClass="textbox" />
                            </div>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>

                    </tr>
                </table>
            </td>

        </tr>
 <%--     <tr>
            <td style="width:150px" ><label for="ddlSClasse">Classe</label></td>
            <td style="width:150px"><label for="ddlSTipoAgenti">Tipo Agenti</label></td>
            <td style="width:150px">&nbsp;</td>
            <td style="width:150px">&nbsp;</td>
        </tr>
        <tr>
            <td>
                <select id="ddlSClasse" style="visibility:visible" Desc="Stato" typedb="combo" Desc="Classe">
                    <option value="">Seleziona la Classe</option>
                </select>
            </td>
            <td>
                <select id="ddlSTipoAgenti" style="visibility:visible" Desc="Canale" typedb="combo" Desc="TipoAgenti" >
                    <option value="">Seleziona il Tipo Agente</option>
                </select>
            </td>
            <td>
                &nbsp;
            </td>
            <td>
                &nbsp;
            </td>

        </tr>--%>
    </table>
</div>

<div id="div_1" style="display:none;width:95%;">
    <table id="tblRaffinaRicerca" style="border: 1px solid darkgrey;">
        <tr >
            <td colspan="2">
                <label class="lblChoices">FILTRI ATTIVI:<label id="lblChoices"></label>
            </td>
        </tr>
    </table>  
    
    <div id="divMenuRaffinaRicerca" >
        <div id="divMenuRRDatiAnagrafici" class="stepNumber divSelected" >
            <table id="TblRRDatiAnagrafici" border="0" class="linkSelected tabRaffinaRicercaSelected" width="90%" onclick="showHideAvanzata('divRRDatiAnagrafici','TblRRDatiAnagrafici','divMenuRRDatiAnagrafici','linkRRDatiAnagrafici')">
                <tr>
                    <td>
                        <span id="linkRRDatiAnagrafici" class="linkSelected" ><strong>DATI ANAGRAFICI</strong></span>
                    </td>
                </tr>
            </table>
        </div>
        <div id="divMenuRRVendite" class="stepNumber divUnselected" >
            <table id="TblRRVendite" class="linkSelected tabRaffinaRicercaUnselected" width="90%" onclick="showHideAvanzata('divRRVendite','TblRRVendite','divMenuRRVendite','linkRRVendite')">
                <tr>
                    <td>
                        <span id="linkRRVendite"  class="linkUnselected"><strong>VENDITE</strong></span>
                    </td>
                </tr>
            </table>
        </div>
        <div id="divMenuRRNegozio" class="stepNumber divUnselected" >
            <table id="TblRRNegozio" class="linkSelected tabRaffinaRicercaUnselected" width="90%" onclick="showHideAvanzata('divRRNegozio','TblRRNegozio','divMenuRRNegozio','linkRRNegozio')">
                <tr>
                    <td>
                        <span id="linkRRNegozio"  class="linkUnselected"><strong>SCHEDA NEGOZIO</strong></span>
                    </td>
                </tr>
            </table>
        </div>
        <div id="divMenuRRDatiAmministrativi" class="stepNumber divUnselected">
            <table id="TblRRDatiAmministrativi" class="linkSelected tabRaffinaRicercaUnselected"  width="90%" onclick="showHideAvanzata('divRRDatiAmministrativi','TblRRDatiAmministrativi','divMenuRRDatiAmministrativi','linkRRDatiAmministrativi')">
                <tr>
                    <td>
                        <span id="linkRRDatiAmministrativi" class="linkUnselected"><strong>DATI AMMINISTRATIVI</strong></span>
                    </td>
                </tr>
            </table>
        </div>
        <div id="divMenuRRAvanzate" class="stepNumber divUnselected">
            <table id="TblRRAvanzate" class="linkSelected tabRaffinaRicercaUnselected" width="90%" onclick="showHideAvanzata('divRRAvanzate','TblRRAvanzate','divMenuRRAvanzate','linkRRAvanzate')">
                <tr>
                    <td>
                        <span id="linkRRAvanzate"  class="linkUnselected" ><strong>STORICO</strong></span>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div id="divRRDatiAnagrafici">
        <table border="0" style="width:90%;border-style:solid;border-color:black;border-width:0px;background-color:#E6E7E8;">
            <tr>
                <td>
                      <table border="0" style="width:100%">
                        <tr>
                            <td style="width:220px"><label for="ddlMRegione" class="label">Regione</label></td>
                            <td></td>
                            <td></td>
                            <td style="width:300px"><label for="ddlMProvincia" class="label">Provincia</label></td>
                            <td></td>
                            <td></td>
                            <td style="width:300px" colspan="3"><label for="txtLocalita" class="label">Localit&agrave;</label></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                           <td style="width:220px">
                                <select id="ddlMRegione" typedb="combo" Desc="IDRegione" multiple="multiple" >
                                    <option value="">Seleziona una Regione</option>
                                </select>
                            </td>
                            <td Desc="IDRegione" class="txtAlignRight">

                            </td>
                            <td class="ricercaSpace"></td>
                            <td style="width:300px">
                                <select id="ddlMProvincia" typedb="combo" Desc="IDProvincia" multiple="multiple" >
                                       <option value="">Seleziona una Provincia</option>
                                </select>
                            </td>
                            <td Desc="IDProvincia" class="txtAlignRight">

                            </td>
                            <td class="ricercaSpace"></td>
                            <td style="width:300px" colspan="3">
                                <div class="ui-widget" style="text-align:left">
                                    <asp:TextBox ClientIDMode="Static" Desc="Localita" showexport="no" ID="txtLocalita" typedb="text" runat="server" Columns="40" Text="--Localita'--"  CssClass="cmbRicerca" />
                                </div>
                            </td>
                            <td Desc="Localita" class="txtAlignRight">
                            </td>
                            <td class="ricercaSpace"></td>
                            <td >
                                &nbsp;</td>
                        </tr>
                        <!--
                        <tr>
                            <td style="width:220px"><label for="txtZonaAssegnata" class="label">Zona Assegnata</label></td>
                            <td></td>
                            <td></td>
                            <td colspan="7"></td>
                        </tr>
                        <tr>
                            <td>
                                <%--<asp:TextBox ClientIDMode="Static" ID="txtZonaAssegnata" typedb="text" Desc="ZonaAssegnata" runat="server" Columns="30" Text="--Zona Assegnata--" CssClass="cmbRicerca" />--%>
                            </td>
                            <td Desc="ZonaAssegnata" class="txtAlignRight">
                            </td>
                            <td class="ricercaSpace"></td>
                            <td colspan="7"></td>
                        </tr>
                        //-->
                        <tr>
                            <td class="label">CAP 
                            </td>
                            <td style="text-align:right">
                                <input type="checkbox" id="ExportchkCAP" typedb="export" title='Seleziona per esportare in Excel' Desc="CAP" />
                            </td>
                            <td class="ricercaSpace"></td>
                            <td class="label" >
                                Indirizzo 
                            </td>
                            <td style="text-align:right">
                                <input type="checkbox" id="ExportchkIndirizzo" typedb="export" title='Seleziona per esportare in Excel' Desc="Indirizzo" />
                            </td>
                            <td class="ricercaSpace"></td>
                            <td class="label">
                               Telefono 
                            </td>
                            <td style="text-align:center">
                                <input type="checkbox" id="ExportchkTelefono" typedb="export" title='Seleziona per esportare in Excel' Desc="Telefono" />
                            </td>  
                            <td class="ricercaSpace"></td>
                            <td style="text-align:right" class="label">
                                Fax 
                            </td>  
                            <td style="text-align:right">
                                <input type="checkbox" id="ExportchkFax" typedb="export" title='Seleziona per esportare in Excel' Desc="Fax" />
                            </td>
                            <td class="ricercaSpace"></td>
                            <td style="text-align:right">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="label">Email PEC 
                            </td>
                            <td style="text-align:right">
                                <input type="checkbox" id="ExportchkPEC" typedb="export" title='Seleziona per esportare in Excel' Desc="PEC" />
                            </td>
                            <td class="ricercaSpace"></td>
                            <td class="label">
                                Email Negozio 
                            </td>
                            <td style="text-align:right">
                                <input type="checkbox" id="ExportchkEmail" typedb="export" title='Seleziona per esportare in Excel' Desc="Email" />
                            </td>
                            <td class="ricercaSpace"></td>
                            <td class="label">
                                Email Titolare 
                            </td> 
                            <td style="text-align:center">
                                <input type="checkbox" id="ExportchkEmailTitolare" typedb="export" title='Seleziona per esportare in Excel' Desc="EmailTitolare" />
                            </td> 
                            <td class="ricercaSpace"></td> 
                            <td colspan="3" style="text-align:right">
                                </td>  
                        </tr>
                        
                    </table>  
                </td>
            </tr>
         </table>
    </div>

    <div id="divRRVendite" style="display:none">
        <table border="0" style="width:90%;border-style:solid;border-color:black;border-width:0px;background-color:#E6E7E8;">
            <tr>
                <td >
                    <table border="0" >
                        <tr>
                            <td><label for="ddlMAM" class="label">Area Manager</label></td>
                            <td></td>
                            <td></td>
                            <td><label for="txtFunzionario" class="label">Funzionario</label></td>
                            <td></td>
                            <td></td>
                            <td><label for="txtSupporti" class="label">Supporti</label></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td >
                                <select id="ddlMAM" Desc="IDAreaManager" style="visibility:hidden" typedb="combo" multiple="multiple">
                                </select>
                            </td>
                            <td Desc="AreaManager" class="txtAlignRight">

                            </td>
                            <td class="ricercaSpace"></td>
                            <td>
                                <asp:TextBox ClientIDMode="Static" ID="txtFunzionario" typedb="text" Desc="Funzionario" runat="server" Columns="30" Text="--Funzionario--" CssClass="textbox" />
                            </td>
                            <td Desc="Funzionario" class="txtAlignRight">

                            </td>
                            <td class="ricercaSpace"></td>
                            <td>
                                <asp:TextBox ClientIDMode="Static" ID="txtSupporti" typedb="text" Desc="Supporti" runat="server" Columns="40" Text="--Supporti--" CssClass="textbox" />
                            </td>
                            <td Desc="Supporti" class="txtAlignRight">
                            </td>
                            <td class="ricercaSpace"></td>
                        </tr>
                        <tr>
                            <td><label for="ddlSModelloVendita" class="label">Modello di Vendita</label></td>
                            <td></td>
                            <td></td>
                            <td><label for="ddlSSegmentazione" class="label">Segmentazione Canale</label></td>
                            <td></td>
                            <td></td>
                            <td><label for="txtZonaAssegnata" class="label">Zona Assegnata</label></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <select id="ddlSModelloVendita" typedb="combo" Desc="ModelloVendita" >
                                </select>
                            </td>
                            <td>&nbsp;</td>
                            <td class="ricercaSpace"></td>
                            <td>
                                <select id="ddlSSegmentazione" typedb="combo" Desc="SegmentazioneCanale" >
                                </select>
                            </td>
                            <td Desc="SegmentazioneCanale" class="txtAlignRight">
                            </td>
                            <td class="ricercaSpace"></td>
                            <td>
                                <asp:TextBox ClientIDMode="Static" ID="txtZonaAssegnata" typedb="text" Desc="ZonaAssegnata" runat="server" Columns="30" Text="--Zona Assegnata--" CssClass="cmbRicerca" />
                            </td>
                            <td Desc="ZonaAssegnata" class="txtAlignRight">
                            </td>
                            <td class="ricercaSpace"></td>
                        </tr>
                        <tr>        
                            <td class="label">Committente
                                <%--asp:TextBox ClientIDMode="Static" ID="txtCommittente" typedb="text" Desc="Cliente" runat="server" Columns="40" Text="--Committente--" Font-Size="12px" /--%>
                            </td>
                            <td Desc="Cliente" class="txtAlignRight">
                                <input type="checkbox" id="ExportchkCommittente" typedb="export" title='Seleziona per esportare in Excel' Desc="Cliente" />
                            </td>
                            <td class="ricercaSpace"></td>
                            <td class="label">
                                Magazzino
                            </td>
                            <td class="txtAlignRight">
                                <input type="checkbox" id="ExportchkMagazzino" typedb="export" title='Seleziona per esportare in Excel' Desc="Magazzino" />
                            </td>
                            <td class="ricercaSpace"></td>
                            <td class="label">Nome Titolare
                            </td>
                            <td class="txtAlignRight"> 
                                <input type="checkbox" id="ExportchkNomeTitolare" typedb="export" title='Seleziona per esportare in Excel' Desc="NomeTitolare" />
                            </td>
                            <td class="ricercaSpace"></td>
                        </tr>
                        <tr>
                            <td class="label">Codice Fiscale Titolare
                                <%--<asp:TextBox ClientIDMode="Static" ID="txtCFTitolare" typedb="text" Desc="CFTitolare" runat="server" Columns="30" Text="--Codice Fiscale Titolare--" Font-Size="12px" />--%>
                            </td>
                            <td class="txtAlignRight">
                                <input type="checkbox" id="ExportchkCFTitolare" typedb="export" title='Seleziona per esportare in Excel' Desc="CFTitolare" />
                            </td>
                            <td class="ricercaSpace"></td>
                            <td class="label">Dati Catene AM</td>
                            <td class="txtAlignRight">
                                <input type="checkbox" id="ExportchkCateneAM" typedb="export" title='Seleziona per esportare in Excel' Desc="DatiCateneAm" />
                            </td>
                            <td class="ricercaSpace"></td>
                            <td class="label">Dati Catene Funzionario</td>
                            <td class="txtAlignRight">
                                <input type="checkbox" id="ExportchkCateneFunzionario" typedb="export" title='Seleziona per esportare in Excel' Desc="DatiCateneFunzionario" />
                            </td>
                            <td class="ricercaSpace"></td>
                        </tr>
                        <!--tr>
                            <td class="label">
                                Gestori Condivisi
                            </td>
                            <td style="text-align:right">
                                <%--<input type="checkbox" id="ExportchkGestoriCondivisi" typedb="export" title='Seleziona per esportare in Excel' Desc="GestoriCondivisi">--%>
                            </td>
                            <td class="ricercaSpace"></td>
                            <td></td>
                            <td>
                            </td>
                            <td class="ricercaSpace"></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr-->
                        <!--tr>
                            <td >
                                <asp:TextBox ClientIDMode="Static" typedb="text" ID="txtCateneAM" Desc="DatiCateneAm" runat="server" Columns="30" Text="--Dati Catene AM--" Font-Size="12px" />
                            </td>
                            <td Desc="DatiCateneAm">
                             </td>
                            <td class="ricercaSpace"></td>
                            <td>
                                <asp:TextBox ClientIDMode="Static" typedb="text" ID="txtCateneFunzionario" Desc="DatiCateneFunzionario" runat="server" Columns="30" Text="--Dati Catene Funzionario--" Font-Size="12px" />
                            </td>
                            <td Desc="DatiCateneFunzionario">
                            </td>
                            <td class="ricercaSpace"></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr-->
                        <tr>
                            <td class="label">
                                Tipo Remunerazione
                            </td>
                            <td class="txtAlignRight">
                                <input type="checkbox" id="ExportchkTipoRemunerazione" typedb="export" title='Seleziona per esportare in Excel' Desc="TipoRemunerazione" />
                            </td>
                            <td class="ricercaSpace"></td>
                            <td class="label">
                                Fideiussione Commerciale
                            </td>
                            <td class="txtAlignRight">
                                <input type="checkbox" id="ExportchkFideiussioneCommerciale" typedb="export" title='Seleziona per esportare in Excel' Desc="FideiussioneCommerciale" />
                            </td>
                            <td class="ricercaSpace"></td>
                            <td class="label">Fideiussione Affitto</td>
                            <td class="txtAlignRight"> 
                                <input type="checkbox" id="ExportchkFideiussioneAffitto" typedb="export" title='Seleziona per esportare in Excel' Desc="FideiussioneAffitto" />
                            </td>
                            <td></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>

    <div id="divRRNegozio" style="display:none">
        <table border="0" style="width:90%;border-style:solid;border-color:black;border-width:0px;background-color:#E6E7E8;">
            <tr>
                <td >
                    <table border="0">
                        <tr>
                            <td><label for="ddlSCluster" class="label">Cluster</label></td>
                            <td></td>
                            <td></td>
                            <td><label for="txtCentroAssistenza" class="label">Centro Assistenza Tecnica</label></td>
                            <td></td>
                            <td></td>
                            <td colspan="2"></td>
                        </tr>
                        <tr>
                            <td>
                                <select id="ddlSCluster" typedb="combo" Desc="Cluster">
                                    <option value="">--Cluster--</option>
                                </select>
                            </td>
                            <td Desc="Cluster" class="txtAlignRight">
                            </td>
                            <td class="ricercaSpace"></td>
                            <td >
<%--                                <select id="ddlSTechAss" typedb="combo" Desc="CentroAssistenzaTecnica">
                                </select>--%>
                                <asp:TextBox ClientIDMode="Static" ID="txtCentroAssistenza" Desc="CentroAssistenzaTecnica" typedb="text" runat="server" Columns="40" Text="--Centro Assistenza Tecnica--" CssClass="textbox"/>
                            </td>
                            <td Desc="CentroAssistenzaTecnica" class="txtAlignRight">
                            </td>
                            <td class="ricercaSpace"></td>
                            <td class="label">
                                +12</td>
                            <td Desc="Piu12" class="txtAlignRight">
                              <input type="checkbox" id="ExportchkPiu12" typedb="export" title='Seleziona per esportare in Excel' Desc="Piu12" />
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                                Negozio Top
                            </td>
                            <td class="txtAlignRight">
                                <input type="checkbox" id="ExportchkNegozioTop" typedb="export" title='Seleziona per esportare in Excel' Desc="NegozioTop" />
                            </td>
                            <td class="ricercaSpace"></td>
                            <td class="label">
                                Centro Commerciale
                            </td>
                            <td class="txtAlignRight">
                                <input type="checkbox" id="ExportchkCentroComm" typedb="export" title='Seleziona per esportare in Excel' Desc="CentroCommerciale" />
                            </td>
                            <td class="ricercaSpace"></td>
                            <td class="label">
                                Orari Apertura
                            </td>
                            <td class="txtAlignRight">
                                <input type="checkbox" id="ExportchkOrariApertura" typedb="export" title='Seleziona per esportare in Excel' Desc="OrariApertura" />
                            </td>
                        </tr>
                        <tr>
                            <td class="label">Shop in Store
                                <%--<select id="ddlSShopInStore" typedb="combo" Desc="ShopInStore">
                                    <option value="">-- Shop In Store--</option>
                                    <option value="0,1">Tutti</option>
                                    <option value="0">SI</option>
                                    <option value="1">NO</option>
                                </select>--%> 
                            </td>
                            <td Desc="ShopInStore" class="txtAlignRight">
                                <input type="checkbox" id="ExportchkShopInStore" typedb="export" title='Seleziona per esportare in Excel' Desc="ShopInStore" />
                            </td>
                            <td class="ricercaSpace"></td>
                            <td class="label">Insegna
                                <%--<asp:TextBox ClientIDMode="Static" ID="txtInsegna" Desc="Insegna" typedb="text" runat="server" Columns="40" Text="--Insegna--" Font-Size="12px" />--%>
                            </td>
                            <td Desc="Insegna" class="txtAlignRight">
                                <input type="checkbox" id="ExportchkInsegna" typedb="export" title='Seleziona per esportare in Excel' Desc="Insegna" />
                            </td>
                            <td class="ricercaSpace"></td>
                            <td class="label">
                                 Tipologia di Arredi     
                            </td>
                            <td Desc="TipologiaArredo" style="text-align:right">
                                <input type="checkbox" id="ExportchkTipologiaArredo" typedb="export" title='Seleziona per esportare in Excel' Desc="TipologiaArredo" />
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                                Classificazione Master
                            </td>
                            <td style="text-align:right">
                                <input type="checkbox" id="ExportchkClassificazioneMaster" typedb="export" title='Seleziona per esportare in Excel' Desc="ClassificazioneMaster" /></td>
                           <td class="ricercaSpace"></td>
                             <td class="label">
                                Dimensione Area Vendita MQ <%--<asp:TextBox ClientIDMode="Static" typedb="text" ID="txtDimensioneMQ" Desc="DimensioneAreaVendita" runat="server" Columns="20" Text="--Area Vendita in MQ--" Font-Size="12px" />--%>
                            </td>
                            <td  Desc="DimensioneAreaVendita" class="txtAlignRight">
                                <input type="checkbox" id="ExportchkDimensioneAreaVendita" typedb="export" title='Seleziona per esportare in Excel' Desc="DimensioneAreaVendita" />
                            </td>
                            <td class="ricercaSpace"></td>
                            <td class="label">
                                Numero Vetrine
                            </td>
                            <td style="text-align:right">
                                <input type="checkbox" id="ExportchkNumeroVetrine" typedb="export" title='Seleziona per esportare in Excel' Desc="NumeroVetrine" />
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                                Latitudine
                                </td>
                            <td style="text-align:right">
                                <input type="checkbox" id="ExportchkLatitudine" typedb="export" title='Seleziona per esportare in Excel' Desc="Latitudine" /></td>
                            <td class="ricercaSpace"></td>
                            <td class="label">
                                Longitudine 
                            </td>
                            <td style="text-align:right">
                                <input type="checkbox" id="ExportchkLongitudine" typedb="export" title='Seleziona per esportare in Excel' Desc="Longitudine" /></td>
                            <td class="ricercaSpace"></td>
                            <td class="label">
                                Valore Affitto <%--<asp:TextBox ClientIDMode="Static" typedb="text" Desc="ValoreAffitto" ID="txtAffitto" runat="server" Columns="15" Text="--Valore Affitto--" Font-Size="12px" />--%>
                            </td>
                            <td Desc="ValoreAffitto" class="txtAlignRight">
                                <input type="checkbox" id="ExportchkValoreAffitto" typedb="export" title='Seleziona per esportare in Excel' Desc="ValoreAffitto" />
                            </td>
                        </tr>
                        <tr>
                            <td class="label">
                            Totale Addetti PT <%--<asp:TextBox ClientIDMode="Static" typedb="text" Desc="PT" ID="txtTOTPT" runat="server" Columns="12" Text="--Totale PT--" Font-Size="12px" />--%>
                            </td>
                            <td Desc="PT" class="txtAlignRight">
                                <input type="checkbox" id="ExportchkPT" typedb="export" title='Seleziona per esportare in Excel' Desc="PT" />
                            </td>
                            <td class="ricercaSpace"></td>
                            <td class="label">
                                Totale Addetti FTE <%--<asp:TextBox ClientIDMode="Static" typedb="text" Desc="FTE" ID="txtTOTFT" runat="server" Columns="10" Text="--Totale FT--" Font-Size="12px" />--%>
                            </td>
                            <td Desc="FTE" class="txtAlignRight">
                                <input type="checkbox" id="ExportchkFTE" typedb="export" title='Seleziona per esportare in Excel' Desc="FTE" />
                            </td>
                            <td class="ricercaSpace"></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
   
    <div id="divRRDatiAmministrativi" style="display:none">
        <table border="0" style="width:90%;border-style:solid;border-color:black;border-width:0px;background-color:#E6E7E8;" >
            <tr>
                <td>
                    <table border="0">
                    <tr>
                        <td class="label">Area Competenza</td>
                        <td></td>
                        <td></td>
                        <td class="label">Tipo Disdetta</td>
                        <td></td>
                        <td></td>
                        <td class="label">&nbsp;</td>
                        <td></td>
                        <td></td>
                        <td class="label">&nbsp;</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <select id="ddlSAreaCompetenza" typedb="combo" Desc="AreaDiCompetenza" >
                            </select>
                        </td>
                        <td Desc="AreaDiCompetenza" class="txtAlignRight">
                        </td>
                        <td class="ricercaSpace"></td>
                        <td >
                            <select id="ddlSDisdetta" typedb="combo" Desc="Disdetta">
                                <option value="">--Seleziona Disdetta--</option>
                                <option value="1">SI DA VODAFONE</option>
                                <option value="2">SI DA DEALER</option>
                                <option value="3">CONSENSUALE</option>
                            </select>
                        </td>
                        <td>&nbsp;</td>
                        <td class="ricercaSpace"></td>
                        <td>&nbsp;
                            <%--<asp:TextBox ClientIDMode="Static" ID="TextBox1" typedb="data" Desc="DataDisdetta" runat="server"  Columns="20" Text="--Data Disdetta--" Font-Size="12px" />--%>
                        </td>
                        <td >&nbsp;
                        </td>
                        <td class="ricercaSpace"></td>
                        <td>&nbsp;
                            <%--<asp:TextBox ClientIDMode="Static" ID="TextBox2" typedb="data" Desc="DataTerminePreavviso" runat="server" Columns="25" Text="--Data Termine Preavviso--" Font-Size="12px" />--%>
                        </td>
                        <td class="txtAlignRight">
                        </td>
                    </tr>
                    <tr>
                        <td class="label">
                            Condizioni Pagamento
                        </td>
                        <td style="text-align:right">
                            <input type="checkbox" id="ExportchkCondizioniPagamento" typedb="export" title='Seleziona per esportare in Excel' Desc="CondizioniPagamento" />
                        </td>
                        <td class="ricercaSpace"></td>
                        <td class="label">
                             Gruppo Prezzi
                        </td>
                        <td style="text-align:right">
                            <input type="checkbox" id="ExportchkGruppoPrezzi" typedb="export" title='Seleziona per esportare in Excel' Desc="GruppoPrezzi" />
                        </td>
                        <td class="ricercaSpace"></td>
                        <td class="label">
                            BOL
                        </td>
                        <td style="text-align:right"> 
                            <input type="checkbox" id="ExportchkBOL" typedb="export" title='Seleziona per esportare in Excel' Desc="BOL">
                        </td>
                        <td class="ricercaSpace"></td>
                        <td class="label">Codice Vogi
                        </td>
                        <td style="text-align:right"> 
                            <input type="checkbox" id="ExportchkCodiceVogi" typedb="export" title='Seleziona per esportare in Excel' Desc="CodiceVogi" />
                        </td>
                    </tr>
                    <tr>
                        <td class="label">Codice Fornitore
                        </td>
                        <td style="text-align:right"> 
                            <input type="checkbox" id="ExportchkCodiceFornitore" typedb="export" title='Seleziona per esportare in Excel' Desc="CodiceFornitore" />
                        </td>
                        <td class="ricercaSpace"></td>
                        <td class="label">
                            Data Contratto
                        </td>
                        <td style="text-align:right">
                            <input type="checkbox" id="ExportchkDataContratto" typedb="export" title='Seleziona per esportare in Excel' Desc="DataContratto" />
                        </td>
                        <td class="ricercaSpace"></td>
                        <!--
                        <td>
                            <asp:TextBox ClientIDMode="Static" ID="txtDataDisdetta" typedb="data" Desc="DataDisdetta" runat="server"  Columns="20" Text="--Data Disdetta--" Font-Size="12px" />
                        </td>
                        <td >&nbsp;
                        </td>
                        <td class="ricercaSpace"></td>
                        //-->
                        <td class="label">Data Invio Disdetta
                        </td>
                        <td style="text-align:right"> 
                            <input type="checkbox" id="ExportchkDataInvioDisdetta" typedb="export" title='Seleziona per esportare in Excel' Desc="DataInvioDisdetta" />
                        </td>
                        <td class="ricercaSpace"></td>
                        <td class="label">
                            Magazzino Centralizzato
                        </td>
                        <td style="text-align:right">
                            <input type="checkbox" id="ExportchkMagazzinoCentr" typedb="export" title='Seleziona per esportare in Excel' Desc="MagazzinoCentralizzato" />
                        </td>
                        <!--
                        <td >
                            <select id="ddlSDisdetta" typedb="combo" Desc="Disdetta">
                                <option value="">--Seleziona Disdetta--</option>
                                <option value="1">SI DA VODAFONE</option>
                                <option value="2">SI DA DEALER</option>
                                <option value="3">CONSENSUALE</option>
                            </select>
                        </td>
                        <td>&nbsp;</td>
                        //-->
                    </tr>
                    <tr>
                        <td class="label">Giorni Preavviso
                        </td>
                        <td style="text-align:right"> 
                            <input type="checkbox" id="ExportchkGiorniPreavviso" typedb="export" title='Seleziona per esportare in Excel' Desc="GiorniPreavviso" />
                        </td>
                        <td class="ricercaSpace"></td>
                        <td class="label">
                            Firma Digitale
                        </td>
                        <td style="text-align:right">
                            <input type="checkbox" id="ExportchkFirmaDigitale" typedb="export" title='Seleziona per esportare in Excel' Desc="FirmaDigitale" />
                        </td>
                        <td class="ricercaSpace"></td>
                        <!--td>
                            <asp:TextBox ClientIDMode="Static" ID="txtDataTerminePreavviso" typedb="data" Desc="DataTerminePreavviso" runat="server" Columns="25" Text="--Data Termine Preavviso--" Font-Size="12px" />
                        </td>
                        <td Desc="DataTerminePreavviso">
                        </td>
                        <td class="ricercaSpace"></td-->
                        <td class="label">Codice Vecchio
                        </td>
                        <td style="text-align:right"> 
                            <input type="checkbox" id="ExportchkVecchioCodice" typedb="export" title='Seleziona per esportare in Excel' Desc="VecchioCodice" />
                        </td>
                        <td class="ricercaSpace"></td>
                        <td class="label">Note
                        </td>
                        <td style="text-align:right"> <input type="checkbox" id="ExportchkNote" typedb="export" title='Seleziona per esportare in Excel' Desc="Note" />
                        </td>
                    </tr>
                    <!--
                    <tr>
                        <td class="label">
                            Magazzino Centralizzato
                        </td>
                        <td style="text-align:right">
                            <input type="checkbox" id="ExportchkMagazzinoCentr" typedb="export" title='Seleziona per esportare in Excel' Desc="MagazzinoCentralizzato" />
                        </td>
                        <td class="ricercaSpace"></td>
                        <td>
                            <select id="ddlSAreaCompetenza" typedb="combo" Desc="AreaDiCompetenza" >
                            </select>
                        </td>
                        <td Desc="AreaDiCompetenza">
                        </td>
                        <td colspan="4">
                            &nbsp;</td>
                    </tr>
                    //-->
                    <tr>
                        <td class="label">
                            Provincia Rea
                        </td>
                        <td style="text-align:right">
                            <input type="checkbox" id="ExportchkProvRea" typedb="export" title='Seleziona per esportare in Excel' Desc="ProvRea" />
                        </td>
                        <td class="ricercaSpace"></td>
                        <td class="label">
                            Rea
                        </td>
                        <td style="text-align:right">
                            <input type="checkbox" id="ExportchkRea" typedb="export" title='Seleziona per esportare in Excel' Desc="Rea" />
                        </td>
                        <td class="ricercaSpace"></td>
                        <!--
                        <td class="label">
                            Data Contratto
                        </td>
                        <td style="text-align:right">
                            <input type="checkbox" id="ExportchkDataContratto" typedb="export" title='Seleziona per esportare in Excel' Desc="DataContratto" />
                        </td>
                        <td class="ricercaSpace"></td>
                        <td class="label">
                            Firma Digitale
                        </td>
                        <td style="text-align:right">
                            <input type="checkbox" id="ExportchkFirmaDigitale" typedb="export" title='Seleziona per esportare in Excel' Desc="FirmaDigitale" />
                        </td>
                        //-->
                        <td colspan="5"></td>
                    </tr>
                </table>
               </td>
            </tr>
        </table>
    </div>
  <div id="divRRAvanzate" style="display:none">
        <table border="0" style="width:90%;border-style:solid;border-color:black;border-width:0px;background-color:#E6E7E8;">
            <tr>
                <td>
                   <table border="0" cellpadding="5px" >
                        <tr>
                            <td></td>
                            <td class="label">
                                Data Disdetta
                            </td>
                            <td class="label">
                                <input type="radio" onclick="HandleDateField('txtDisdettaDal', 'txtDisdettaAl', false);" name="rdDisdetta" Desc="DataDisdetta" typedb="dateperiod" value="All"/> Tutto&nbsp;
                                <input type="radio" onclick="HandleDateField('txtDisdettaDal', 'txtDisdettaAl', true);" name="rdDisdetta" Desc="DataDisdetta" typedb="dateperiod" value="Period"/>
                                Dal <asp:TextBox ClientIDMode="Static" ID ="txtDisdettaDal" typedb="dateperiod" Desc="DisdettaRange" runat="server" Columns="12" CssClass="textbox" />
                                &nbsp;
                                Al <asp:TextBox ClientIDMode="Static" ID="txtDisdettaAl" typedb="dateperiod" Desc="DisdettaRange" runat="server" Columns="12" CssClass="textbox" />
                            </td>
                        </tr>
                       <tr>
                            <td></td>
                            <td class="label">
                                Data Termine Preavviso
                            </td>
                            <td class="label">
                                <input type="radio" onclick="HandleDateField('txtPreavvisoDal', 'txtPreavvisoAl', false);" name="rdPreavviso" Desc="DataTerminePreavviso" typedb="dateperiod" value="All"/> Tutto&nbsp;
                                <input type="radio" onclick="HandleDateField('txtPreavvisoDal', 'txtPreavvisoAl', true);" name="rdPreavviso" Desc="DataTerminePreavviso" typedb="dateperiod" value="Period"/>
                                Dal <asp:TextBox ClientIDMode="Static" ID ="txtPreavvisoDal" typedb="dateperiod" Desc="DataTerminePreavviso" runat="server" Columns="12" CssClass="textbox" />
                                &nbsp;
                                Al <asp:TextBox ClientIDMode="Static" ID="txtPreavvisoAl" typedb="dateperiod" Desc="DataTerminePreavviso" runat="server" Columns="12" CssClass="textbox" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%--<input type="checkbox" id="ExportchkStoricoIndirizzo" typedb="export" title='Seleziona per esportare in Excel' Desc="StoricoIndirizzo" />--%>
                            </td>
                            <td class="label">
                                Data Trasloco
                            </td>
                            <td class="label">
                             <input type="radio" onclick="HandleDateField('txtTraslocoDal', 'txtTraslocoAl', false);" name="rdTrasloco" Desc="StoricoIndirizzo" typedb="dateperiod" value="All"/> Tutto&nbsp;
                             <input type="radio" onclick="HandleDateField('txtTraslocoDal', 'txtTraslocoAl', true);" name="rdTrasloco" Desc="StoricoIndirizzo" typedb="dateperiod" value="Period"/>
                                Dal <asp:TextBox ClientIDMode="Static" ID ="txtTraslocoDal" typedb="dateperiod" Desc="StoricoIndirizzo.DataInizio" runat="server" Columns="12" CssClass="textbox" />
                                &nbsp;
                                Al <asp:TextBox ClientIDMode="Static" ID="txtTraslocoAl" typedb="dateperiod" Desc="StoricoIndirizzo.DataFine" runat="server" Columns="12" CssClass="textbox" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%--<input type="checkbox" id="ExportchkStoricoCodice" typedb="export" title='Seleziona per esportare in Excel' Desc="StoricoCodice" />--%>
                            </td>
                            <td class="label">
                                Data Subentro
                            </td>
                            <td class="label">
                             <input type="radio" onclick="HandleDateField('txtSubentroDal', 'txtSubentroAl',false);" name="rdSubentro" typedb="dateperiod" Desc="StoricoCodice" value="All"/> Tutto&nbsp;
                             <input type="radio" onclick="HandleDateField('txtSubentroDal', 'txtSubentroAl', true);" name="rdSubentro" typedb="dateperiod" Desc="StoricoCodice" value="Period"/>
                                Dal <asp:TextBox ClientIDMode="Static" ID ="txtSubentroDal" typedb="dateperiod" Desc="StoricoCodice.DataInizio" runat="server" Columns="12" CssClass="textbox" />
                                &nbsp;
                                Al <asp:TextBox ClientIDMode="Static" ID="txtSubentroAl" typedb="dateperiod" Desc="StoricoCodice.DataFine" runat="server" Columns="12" CssClass="textbox" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%--<input type="checkbox" id="ExportchkStoricoCanale" typedb="export" title='Seleziona per esportare in Excel' Desc="StoricoCanale" />--%>
                            </td>
                            <td class="label">
                              Data Cambio Canale
                            </td>
                            <td class="label">
                             <input type="radio" onclick="HandleDateField('txtCambioCanaleDal', 'txtCambioCanaleAl', false);" name="rdCambioCanale" typedb="dateperiod" Desc="StoricoCanale" value="All"/> Tutto&nbsp;
                             <input type="radio" onclick="HandleDateField('txtCambioCanaleDal', 'txtCambioCanaleAl', true);" name="rdCambioCanale" typedb="dateperiod" StoricoCanale="Desc" value="Period"/>
                                Dal <asp:TextBox ClientIDMode="Static" typedb="dateperiod" ID ="txtCambioCanaleDal" Desc="StoricoCanale.DataInizio" runat="server" Columns="12" CssClass="textbox" />
                                &nbsp;
                                Al <asp:TextBox ClientIDMode="Static" typedb="dateperiod" ID="txtCambioCanaleAl" Desc="StoricoCanale.DataFine" runat="server" Columns="12" CssClass="textbox" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%--<input type="checkbox" id="ExportchkDataAperturaNegozio" typedb="export" title='Seleziona per esportare in Excel' Desc="DataAperturaNegozio" />--%>
                            </td>
                            <td class="label">
                               Data Apertura Negozio
                            </td>
                            <td class="label">
                             <input type="radio" onclick="HandleDateField('txtAperturaNegozioDal', 'txtAperturaNegozioAl', false);" name="rdAperturaNegozio" typedb="dateperiod" Desc="DataAperturaNegozio" value="All"/> Tutto&nbsp;
                             <input type="radio" onclick="HandleDateField('txtAperturaNegozioDal', 'txtAperturaNegozioAl', true);" name="rdAperturaNegozio" typedb="dateperiod" Desc="DataAperturaNegozio" value="Period"/>
                                Dal <asp:TextBox ClientIDMode="Static" typedb="dateperiod" ID ="txtAperturaNegozioDal" Desc="DataAperturaNegozioDal" runat="server" Columns="12" CssClass="textbox" />
                                &nbsp;
                                Al <asp:TextBox ClientIDMode="Static" typedb="dateperiod" ID="txtAperturaNegozioAl" Desc="DataAperturaNegozioAl" runat="server" Columns="12" CssClass="textbox" />
                            </td>
                        </tr>  
                        <tr>
                            <td>
                                <%--<input type="checkbox" id="ExportchkDataChiusuraNegozio" typedb="export" title='Seleziona per esportare in Excel' Desc="DataChiusuraNegozio" />--%>
                            </td>
                            <td class="label">
                               Data Chiusura Negozio
                            </td>
                            <td class="label">
                             <input type="radio" onclick="HandleDateField('txtChiusuraNegozioDal', 'txtChiusuraNegozioAl', false);" name="rdChiusuraNegozio" typedb="dateperiod" Desc="DataChiusuraNegozio" value="All"/> Tutto&nbsp;
                             <input type="radio" onclick="HandleDateField('txtChiusuraNegozioDal', 'txtChiusuraNegozioAl', true);" name="rdChiusuraNegozio" typedb="dateperiod" Desc="DataChiusuraNegozio" value="Period"/>
                                Dal <asp:TextBox ClientIDMode="Static" typedb="dateperiod" ID ="txtChiusuraNegozioDal" Desc="DataChiusuraNegozioDal" runat="server" Columns="12"  CssClass="textbox" />
                                &nbsp;
                                Al <asp:TextBox ClientIDMode="Static" typedb="dateperiod" ID="txtChiusuraNegozioAl" Desc="DataChiusuraNegozioAl" runat="server" Columns="12"  CssClass="textbox" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%--<input type="checkbox" id="ExportchkDataAperturaCodice" typedb="export" title='Seleziona per esportare in Excel' Desc="DataAperturaCodice" />--%>
                            </td>
                            <td class="label">
                               Data Apertura Codice
                            </td>
                            <td class="label">
                             <input type="radio" onclick="HandleDateField('txtAperturaCodiceDal', 'txtAperturaCodiceAl', false);" name="rdAperturaCodice" typedb="dateperiod" Desc="DataAperturaCodice" value="All"/> Tutto&nbsp;
                             <input type="radio" onclick="HandleDateField('txtAperturaCodiceDal', 'txtAperturaCodiceAl', true);" name="rdAperturaCodice" typedb="dateperiod" Desc="DataAperturaCodice" value="Period"/>
                                Dal <asp:TextBox ClientIDMode="Static" typedb="dateperiod" ID ="txtAperturaCodiceDal" Desc="DataAperturaCodiceDal" runat="server" Columns="12"  CssClass="textbox" />
                                &nbsp;
                                Al <asp:TextBox ClientIDMode="Static" typedb="dateperiod" ID="txtAperturaCodiceAl" Desc="DataAperturaCodiceAl" runat="server" Columns="12"  CssClass="textbox" />
                            </td>
                        </tr>  
                        <tr>
                            <td>
                                <%--<input type="checkbox" id="ExportchkDataChiusuraCodice" typedb="export" title='Seleziona per esportare in Excel' Desc="DataAperturaCodice" />--%>
                            </td>
                            <td class="label">
                               Data Chiusura Codice
                            </td>
                            <td class="label">
                             <input type="radio" onclick="HandleDateField('txtChiusuraCodiceDal', 'txtChiusuraCodiceAl', false);" name="rdChiusuraCodice" typedb="dateperiod" Desc="DataChiusuraCodice" value="All"/> Tutto&nbsp;
                             <input type="radio" onclick="HandleDateField('txtChiusuraCodiceDal', 'txtChiusuraCodiceAl', true);" name="rdChiusuraCodice" typedb="dateperiod" Desc="DataChiusuraCodice" value="Period"/>
                                Dal <asp:TextBox ClientIDMode="Static" typedb="dateperiod" ID ="txtChiusuraCodiceDal" Desc="DataChiusuraCodiceDal" runat="server" Columns="12"  CssClass="textbox" />
                                &nbsp;
                                Al <asp:TextBox ClientIDMode="Static" typedb="dateperiod" ID="txtChiusuraCodiceAl" Desc="DataChiusuraCodiceAl" runat="server" Columns="12"  CssClass="textbox" />
                            </td>
                        </tr>                             
                        <tr>
                            <td></td>
                            <td class="label">
                                Nome Contatto
                            </td>
                            <td>
                                <input type="checkbox" id="ExportchkNomeContatto" typedb="export" title='Seleziona per esportare in Excel' Desc="NomeContatto" />
                                <%--<asp:TextBox ClientIDMode="Static" ID="txtNomeContatto" typedb="text" Desc="NomeContatto" runat="server" Columns="60" Text="--Nome Contatto--" Font-Size="12px" />--%>
                            </td>
                        </tr> 
                    </table>
                </td>
            </tr> 
        </table>
    </div>
</div>

<div id="divResults" style="position:relative;width:90%;display:none;padding-top:5px;" class="divGridView">
    <table border="0" style="width:90%;border-style:solid;border-color:black;border-width:0px">
        <tr>
            <td>
                <table border="0" cellpadding="5px" style="width:100%" id="grvResults" style="font-size:10pt;">
<!--<div id="divResults" style="display:none;width:100%;" class="divGridView">-->
                <!--<table cellspacing="0"  id="grvResults" width="1024" border="1" style="font-size:10pt;" >-->
                    <thead >
                        <tr class="GridviewScrollHeader">
                            <%--<th scope="col" style="visibility:hidden;width:1px;">Id</th>--%>
                            <th scope="col" style="padding-bottom:5px;padding-top:5px;width:80px">Codice</th>
                            <th scope="col" style="width:120px">Canale</th>
                            <th scope="col" style="width:470px;text-align:left" >Ragione Sociale</th>
                            <th scope="col" style="width:100px">Stato</th>
                            <th scope="col" style="width:100px">Area</th>
                        </tr>
                    </thead>
                    <tbody style="text-align:center;">
                        <tr style="display:none;visibility:hidden" >
                           <%-- <td style="padding-bottom:5px;padding-top:5px;width:80px">
                                <span id="NRiga" style="padding-bottom:5px;padding-top:5px;width:80px">&nbsp;</span>
                            </td>--%>
                            <td>
                                <span id="Codice">&nbsp;</span>
                            </td>
                            <td>
                                <span id="Canale">&nbsp;</span>
                            </td>
                            <td>
                                <span id="RagioneSociale" >&nbsp;</span>
                            </td>
                            <td>
                                <span id="Stato">&nbsp;</span>
                            </td>
                            <td>
                                <span id="Area">&nbsp;</span>
                            </td>
                        </tr>
                        </tbody>
                  </table>
                </td>
            </tr>
        </table>
                    <p id="pager"></p>
 </div>

    <div style="position: relative; bottom: 0; width: 90%; text-align: right;">
        <table border="0" style="position: relative; bottom: 0; width: 40%; text-align: right;">
            <tr>
                <td>
                    <span id="link_ricerca" class="buttonsRicerca" onclick="checkSearchFields(0);">
                        <img src="Resources/Images/Ricerca/cerca3.png" alt="Ricerca Dealer" style="width: 130px" />
                    </span>
                </td>
                <td>
                    <span id="link_raffinaricerca" class="buttonsRicerca">
                        <img src="Resources/Images/Ricerca/raffinaricerca.png" id="imgRaffinaRicerca" alt="Raffina Ricerca" style="width: 130px" />
                    </span>
                </td>
                <td>
                    <span id="link_esporta" class="buttonsRicerca">
                        <img src="Resources/Images/Ricerca/esporta.png" alt="Esporta in Excel" style="width: 130px" />
                    </span>
                </td>
                <td>
                    <span id="link_salvaricerca" class="buttonsRicerca">
                        <img src="Resources/Images/Ricerca/salvaricerca.png" alt="Salva Ricerca" style="width: 130px" />
                    </span>
                </td>
                <td>
                    <span id="link_caricaricerca" class="buttonsRicerca">
                        <img src="Resources/Images/Ricerca/caricaricerca.png" alt="Carica Ricerca" style="width: 130px" />
                    </span>
                </td>
            </tr>
        </table>
    </div>  
    <%if (ConfigurationManager.AppSettings["test"] == "true"){ %>  
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <textarea id="txtXMLRicerca" cols="50" rows="10"></textarea>
    <%} %>
     <div id="ModalPopup" class="divWaitPopupDisplay" style="display: none" ></div>
    <div id="dialog-message" title="Ricerca" style="display: none">
      <p style="font-size:9pt">
        <span id="msgDialogBox"></span>
      </p>
    </div>
</asp:Content>


