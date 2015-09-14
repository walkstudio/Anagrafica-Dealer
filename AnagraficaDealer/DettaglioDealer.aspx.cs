using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using AnagraficaDealerClassLib;
using System.Xml.Linq;
using System.IO;

namespace Spindox.AnagraficaDealer
{
    public partial class DettaglioDealer : System.Web.UI.Page
    {
        private AnagraficaDealerService proxyMtd = new AnagraficaDealerService();
        private int IDProfilo
        {
            get
                 {
                     return Convert.ToInt32(Session["IDProfilo"]);
                 }
            set
            {
                Session["IDProfilo"] = value;
            }
        }

        //private int IDTipoDealer
        //{
        //    get
        //    {
        //        return Convert.ToInt32(Session["IDTipoDealerTest"]);
        //    }
        //    set
        //    {
        //        Session["IDTipoDealerTest"] = value;
        //    }
        //}

        private int IDDealer
        {
            get
            {
                return Convert.ToInt32(IDDealerHiddenField.Value);
            }
            set
            {
                IDDealerHiddenField.Value = value.ToString();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (divNumHiddenField.Value == "")
            {
                divNumHiddenField.Value = Session["DivNumSelected"].ToString();                
            }
            else
            {
                Session["DivNumSelected"] = divNumHiddenField.Value;
            }

            if (Session["retCode"].ToString() != String.Empty)
            {
                retCodeLabel.Text = Session["retCode"].ToString();
                Session["retCode"] = String.Empty;
            }

            //Imposto un IDDealer di test in attesa della pagina di ricerca
            //IDDealer = Convert.ToInt32(Session["IDDealer"]);
            IDDealer = Convert.ToInt32(HttpContext.Current.Session["IDDealer"]);

            if(IDDealer != 0)
            {
                //Carico la lista dei campi da visualizzare con i relativi parametri
                List<AutorizzazioneCampi> myDealerCampiList = proxyMtd.AutorizzazioneCampi_GetList(IDProfilo, IDDealer);

                //Filtro la lista in modo tale da assegnare ad ogni Tabella i parametri corrispondenti
                List<AutorizzazioneCampi> filteredList;

                //Carico i dati relativi al Dealer
                DataTable myDealerDetailsDataTable = proxyMtd.GetDealer(IDDealer);
            
                filteredList = myDealerCampiList.Where(x => x.NomeTabella == "Anagrafica").ToList();
                anagraficaPlaceHolder.Controls.Add(CaricaTabella("Anagrafica", filteredList, myDealerDetailsDataTable));

                filteredList = myDealerCampiList.Where(x => x.NomeTabella == "Dati Amministrativi").ToList();
                datiAmministrativiPlaceHolder.Controls.Add(CaricaTabella("Dati Amministrativi", filteredList, myDealerDetailsDataTable));

                filteredList = myDealerCampiList.Where(x => x.NomeTabella == "Negozio").ToList();
                negozioPlaceHolder.Controls.Add(CaricaTabella("Negozio", filteredList, myDealerDetailsDataTable));

                filteredList = myDealerCampiList.Where(x => x.NomeTabella == "Vendite").ToList();
                venditePlaceHolder.Controls.Add(CaricaTabella("Vendite", filteredList, myDealerDetailsDataTable));

                List<DealerUpdateFields> myDealerUpdateFieldsList = new List<DealerUpdateFields>();
                myDealerUpdateFieldsList = AggiornaListaDati(myDealerUpdateFieldsList, false);
                Session["myDealerUpdateFieldsList"] = myDealerUpdateFieldsList;
                               
                dataUltimaModificaLabel.Text = "Ultima Importazione Scheda: " + ((DateTime)myDealerDetailsDataTable.Rows[0]["DataModifica"]).ToString("dd/MM/yyyy HH:mm");

                string DataModificaUtente = myDealerDetailsDataTable.Rows[0]["DataModificaUtente"].ToString();
                DataModificaUtente = DataModificaUtente == String.Empty ? "Mai aggiornata" : ((DateTime)myDealerDetailsDataTable.Rows[0]["DataModificaUtente"]).ToString("dd/MM/yyyy HH:mm");
                dataUltimaModificaUtenteLabel.Text = "Ultimo Aggiornamento Utente: " + DataModificaUtente;

                codiceDealerLinkButton.Text = "Codice Dealer: " + myDealerDetailsDataTable.Rows[0]["Codice"].ToString() +
                    " - Tipologia: " + myDealerDetailsDataTable.Rows[0]["NomeTipoDealer"].ToString();
            }
        }


        //Funzione di creazione a runtime dei campi relativi ad ogni tabella. Parametri in ingresso il nome tabella e la lista campi da visualizzare
        private Table CaricaTabella(String nomeTabella, List<AutorizzazioneCampi> myAutorizzazioneCampiList, DataTable myDealerDetailsDataTable)
        {
            //Creo la tabella nella quale inserire i controls
            Table myTable = new Table();
            myTable.ID = nomeTabella + "Table";
            myTable.CssClass = "tableDD";

            Int32 i = 0;
            //Effettuo un ciclo per settare le autorizzazioni sui Campi (myAutorizzazioneCampiList) in base al profilo utente e caricare i dettagli del Dealer selezionato (myDealerDetailsDataTable)
            foreach (AutorizzazioneCampi myAutorizzazioneCampi in myAutorizzazioneCampiList)
            {
                //Verifico che il Control vada caricato sulla tabella inviata (nomeTabella)
                if ((myAutorizzazioneCampi.NomeTabella == nomeTabella) & myAutorizzazioneCampi.Visibile)
                {
                    //Creo le label prendendo il text da NomeCampoFrontEnd definito a database
                    Label myLabel = new Label();
                    myLabel.ID = "Label_" + Convert.ToString(myAutorizzazioneCampi.NomeCampo);
                    myLabel.Text = myAutorizzazioneCampi.NomeCampoFrontEnd + ":";
                    myLabel.Visible = myAutorizzazioneCampi.Visibile;
                    myLabel.Enabled = myAutorizzazioneCampi.SolaLettura;
                    myLabel.CssClass = "labelDD";

                    //Creo un Control generico e poi ne faccio il cast appena ho individuato la tipologia
                    Control myRuntimeControl = new Control();
                    RegularExpressionValidator myRegularExpressionValidator = new RegularExpressionValidator();
                    AjaxControlToolkit.TextBoxWatermarkExtender myTextBoxWatermarkExtender = new AjaxControlToolkit.TextBoxWatermarkExtender();
                    AjaxControlToolkit.ModalPopupExtender myModalPopupExtender = new AjaxControlToolkit.ModalPopupExtender();
                    AjaxControlToolkit.CalendarExtender myCalendarExtender = new AjaxControlToolkit.CalendarExtender();

                    //Faccio il cast del Control sulla base di quanto definito a database ne setto le proprietà specifiche, validazione, extender e carico il valore da visualizzare.
                    switch (myAutorizzazioneCampi.TipoWebControl)
                    {
                        case("TextBox"):
                            #region CreazioneTextBox_Validazione
                            myRuntimeControl = new TextBox(); 
                            myRuntimeControl.ID = myAutorizzazioneCampi.TipoWebControl + "_" + Convert.ToString(myAutorizzazioneCampi.NomeCampo); 
                            this.Controls.Add(myRuntimeControl);
                            myRuntimeControl.Visible = myAutorizzazioneCampi.Visibile;
                            (myRuntimeControl as TextBox).ReadOnly = myAutorizzazioneCampi.SolaLettura;
                            (myRuntimeControl as TextBox).MaxLength = myAutorizzazioneCampi.LunghezzaMassima;
                            if (myAutorizzazioneCampi.SolaLettura)
                            {
                                (myRuntimeControl as TextBox).CssClass = "textBoxReadOnlyDD";
                                (myRuntimeControl as TextBox).ToolTip = "Campo non modificabile";
                            }
                            else
                            {
                                (myRuntimeControl as TextBox).CssClass = "textBoxDD";
                                (myRuntimeControl as TextBox).ToolTip = "Campo modificabile";
                            }
                            if (myAutorizzazioneCampi.TipoDato == "Note")
                            {
                                (myRuntimeControl as TextBox).TextMode = TextBoxMode.MultiLine;
                                (myRuntimeControl as TextBox).Rows = 5;
                                (myRuntimeControl as TextBox).MaxLength = 0;                                 
                                if (myAutorizzazioneCampi.SolaLettura)
                                {
                                    (myRuntimeControl as TextBox).CssClass = "noteReadOnlyDD";
                                }
                                else
                                {
                                    (myRuntimeControl as TextBox).CssClass = "noteDD";
                                }
                            }

                            if(myAutorizzazioneCampi.ValidaControlli)
                            {
                                myRegularExpressionValidator.ID = (myRuntimeControl as TextBox).ID + "_RegularExpressionValidator";
                                myRegularExpressionValidator.ForeColor = System.Drawing.Color.Red;
                                myRegularExpressionValidator.ControlToValidate = (myRuntimeControl as TextBox).ID;
                                myRegularExpressionValidator.ValidationGroup = "ValidazioneControlli";
                                myRegularExpressionValidator.Display = ValidatorDisplay.None;
                                myRegularExpressionValidator.ErrorMessage = myAutorizzazioneCampi.NomeTabella + " - " + myAutorizzazioneCampi.NomeCampoFrontEnd + ":";

                                if(myAutorizzazioneCampi.ValidaEmail)
                                {
                                    myRegularExpressionValidator.ValidationExpression = @"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*";
                                    myRegularExpressionValidator.ErrorMessage += " Indirizzo Email non valido";
                                   }
                                if (myAutorizzazioneCampi.ValidaData)
                                {
                                    myRegularExpressionValidator.ValidationExpression = @"^(3[01]|[12][0-9]|0?[1-9])/(1[0-2]|0?[1-9])/(?:[0-9]{2})?[0-9]{2}$";
                                    myRegularExpressionValidator.ErrorMessage += " Data non valida";

                                    myTextBoxWatermarkExtender.ID = (myRuntimeControl as TextBox).ID +  "_TextBoxWatermarkExtender";
                                    myTextBoxWatermarkExtender.BehaviorID = (myRuntimeControl as TextBox).ID + "_TextBoxWatermarkExtender";
                                    myTextBoxWatermarkExtender.TargetControlID = (myRuntimeControl as TextBox).ID;
                                    myTextBoxWatermarkExtender.WatermarkText = "--gg/mm/aaaa--";
                                    myTextBoxWatermarkExtender.WatermarkCssClass = "watermarkDD textBoxDD";

                                    myCalendarExtender.ID = (myRuntimeControl as TextBox).ID + "_TextBoxCalendarExtender";
                                    myCalendarExtender.BehaviorID = (myRuntimeControl as TextBox).ID + "_TextBoxCalendarExtender";
                                    myCalendarExtender.TargetControlID = (myRuntimeControl as TextBox).ID;
                                    myCalendarExtender.Format = "dd/MM/yyyy";
                    
                                    
                                }
                                if (myAutorizzazioneCampi.ValidaNumero)
                                {
                                    myRegularExpressionValidator.ValidationExpression = @"[0-9]+";
                                    myRegularExpressionValidator.ErrorMessage += " Numero non valido";
                                }
                                // if(myAutorizzazioneCampi.ValidaTelefono)
                                //{
                                //    myRegularExpressionValidator.ValidationExpression = @"^(1\s*[-\/\.]?)?(\((\d{3})\)|(\d{3}))\s*[-\/\.]?\s*(\d{3})\s*[-\/\.]?\s*(\d{4})\s*(([xX]|[eE][xX][tT])\.?\s*(\d+))*$";
                                //    myRegularExpressionValidator.ErrorMessage = "* Telefono non valido";
                                //}
                            }
                            #endregion
                            #region AssegnazioneValore
                            if (myDealerDetailsDataTable.Rows.Count > 0)
                            {
                                if (myDealerDetailsDataTable.Columns.Contains(myAutorizzazioneCampi.NomeCampo) &&
                                    (myDealerDetailsDataTable.Rows[0][myAutorizzazioneCampi.NomeCampo] != DBNull.Value))
                                {
                                    if (myAutorizzazioneCampi.TipoDato == "Data")
                                    {
                                        (myRuntimeControl as TextBox).Text = Convert.ToDateTime(myDealerDetailsDataTable.Rows[0][myAutorizzazioneCampi.NomeCampo]).ToShortDateString();
                                    }
                                    else
                                    {
                                        (myRuntimeControl as TextBox).Text = myDealerDetailsDataTable.Rows[0][myAutorizzazioneCampi.NomeCampo].ToString();
                                    }
                                }
                            }      
                            #endregion
                            break;
                        case("DropDownList"):
                            #region CreazioneDropDownList
                            myRuntimeControl = new DropDownList(); 
                            myRuntimeControl.ID = myAutorizzazioneCampi.TipoWebControl + "_" + Convert.ToString(myAutorizzazioneCampi.NomeCampo); 
                            this.Controls.Add(myRuntimeControl);
                            myRuntimeControl.Visible = myAutorizzazioneCampi.Visibile;
                            (myRuntimeControl as DropDownList).Enabled = !myAutorizzazioneCampi.SolaLettura;
                            (myRuntimeControl as DropDownList).CssClass = "dropDownListDD";
                            if (myAutorizzazioneCampi.SolaLettura)
                            {
                                (myRuntimeControl as DropDownList).ToolTip = "Campo non modificabile";
                             }
                            else
                            {
                                (myRuntimeControl as DropDownList).ToolTip = "Campo modificabile";

                            }
                            #endregion
                            #region AssegnazioneValore
                            DataTable myDropDownListDataTable = proxyMtd.Dealer_CaricaValoriMultipli(myAutorizzazioneCampi.NomeCampo);
                            Boolean listItemSelected = false;
                            string valoreCampo = "";

                            if(myDealerDetailsDataTable.Rows[0][myAutorizzazioneCampi.NomeCampo] != DBNull.Value)
                            {
                                valoreCampo = myDealerDetailsDataTable.Rows[0][myAutorizzazioneCampi.NomeCampo].ToString();
                            }
                            
                            foreach (DataRow myDataRow in myDropDownListDataTable.Rows)
                            {                                
                                ListItem myListItem = new ListItem();
                                myListItem.Text = myDataRow["Descrizione"].ToString();
                                myListItem.Value = myDataRow["ID"].ToString();
                                if (myListItem.Text == valoreCampo)
                                    {
                                        myListItem.Selected = true;
                                        listItemSelected = true;
                                    }
                                (myRuntimeControl as DropDownList).Items.Add(myListItem);
                            }
                            if (listItemSelected == false)
                            {
                                ListItem myListItem = new ListItem();
                                myListItem.Text = valoreCampo;
                                myListItem.Value = "-1";
                                myListItem.Selected = true;
                                (myRuntimeControl as DropDownList).Items.Insert(0, myListItem);
                            }
                            #endregion
                            break;
                        case("CheckBox"):
                            #region CreazioneCheckBox
                            myRuntimeControl = new CheckBox(); 
                            myRuntimeControl.ID = myAutorizzazioneCampi.TipoWebControl + "_" + Convert.ToString(myAutorizzazioneCampi.NomeCampo); 
                            this.Controls.Add(myRuntimeControl);
                            myRuntimeControl.Visible = myAutorizzazioneCampi.Visibile;
                            (myRuntimeControl as CheckBox).Enabled = !myAutorizzazioneCampi.SolaLettura;
                            if (myAutorizzazioneCampi.SolaLettura)
                            {
                                (myRuntimeControl as CheckBox).ToolTip = "Campo non modificabile";
                            }
                            else
                            {
                                (myRuntimeControl as CheckBox).ToolTip = "Campo modificabile";
                            }
                            #endregion
                            #region AssegnazioneValore
                            if (myDealerDetailsDataTable.Rows.Count > 0)
                            {
                                if (myDealerDetailsDataTable.Columns.Contains(myAutorizzazioneCampi.NomeCampo) &&
                                    (myDealerDetailsDataTable.Rows[0][myAutorizzazioneCampi.NomeCampo] != DBNull.Value))
                                {
                                    (myRuntimeControl as CheckBox).Checked = Convert.ToBoolean(myDealerDetailsDataTable.Rows[0][myAutorizzazioneCampi.NomeCampo]);
                                }
                            }
                            #endregion
                            break;
                        case ("CheckBoxList"):
                            #region CreazioneCheckBoxLit
                            myRuntimeControl = new CheckBoxList(); 
                            myRuntimeControl.ID = myAutorizzazioneCampi.TipoWebControl + "_" + Convert.ToString(myAutorizzazioneCampi.NomeCampo); 
                            this.Controls.Add(myRuntimeControl);
                            myRuntimeControl.Visible = myAutorizzazioneCampi.Visibile;
                            (myRuntimeControl as CheckBoxList).Enabled = !myAutorizzazioneCampi.SolaLettura;
                            (myRuntimeControl as CheckBoxList).RepeatDirection = RepeatDirection.Horizontal;
                            (myRuntimeControl as CheckBoxList).RepeatLayout = RepeatLayout.Flow;
                            (myRuntimeControl as CheckBoxList).Width = 254;
                            if (myAutorizzazioneCampi.SolaLettura)
                            {
                                (myRuntimeControl as CheckBoxList).CssClass = "checkBoxListReadOnlyDD";
                                (myRuntimeControl as CheckBoxList).ToolTip = "Campo non modificabile";
                            }
                            else
                            {
                                (myRuntimeControl as CheckBoxList).CssClass = "checkBoxListDD";
                                (myRuntimeControl as CheckBoxList).ToolTip = "Campo modificabile";
                            }
                            #endregion
                            #region AssegnazioneValore
                            DataTable myCheckBoxListDataTable = proxyMtd.Dealer_CaricaValoriMultipli(myAutorizzazioneCampi.NomeCampo);
                            DataTable myCheckBoxListSelectedDataTable = proxyMtd.Dealer_CaricaValoriMultipliSelected(IDDealer, myAutorizzazioneCampi.NomeCampo);
                            //Boolean checkItemSelected = false;
                            foreach (DataRow myDataRow in myCheckBoxListDataTable.Rows)
                            {                                
                                ListItem myListItem = new ListItem();
                                myListItem.Text = myDataRow["Descrizione"].ToString();
                                myListItem.Value = myDataRow["ID"].ToString();
                                foreach (DataRow myDataRowSelected in myCheckBoxListSelectedDataTable.Rows)
                                    if (myListItem.Text == myDataRowSelected["Descrizione"].ToString())
                                    {
                                        myListItem.Selected = true;
                                    }
                                (myRuntimeControl as CheckBoxList).Items.Add(myListItem);
                            }
                            #endregion
                            break;
                        case ("OrarioApertura"):
                            #region CreazioneOrarioApertura
                            myRuntimeControl = new Panel();
                            myRuntimeControl.ID = "Panel_OrarioApertura";
                            //(myRuntimeControl as Panel).BorderStyle = BorderStyle.Solid;
                            //(myRuntimeControl as Panel).BorderWidth = 1;
                            (myRuntimeControl as Panel).CssClass = "panelDD";
                            this.Controls.Add(myRuntimeControl);
                            myRuntimeControl.Visible = myAutorizzazioneCampi.Visibile;

                            this.Controls.Add(myRuntimeControl);

                            Table myOrarioTable = new Table();
                            myOrarioTable.ID = "Table_OrarioApertura";
                            myRuntimeControl.Controls.Add(myOrarioTable);

                            DataTable myOrarioAperturaDataTable = proxyMtd.Dealer_OrarioApertura_Get(IDDealer);

                            //Replico 4 blocchi dove poter definire l'orario di apertura
                            for (int blocco = 1; blocco <= 4; blocco++)
                            {
                                int riga = 1;
                                int cella = 1;

                                string idRiga = blocco + "_" + riga;
                                string idCella = blocco + "_" + riga + "_" + cella;

                                //Costruisco la riga con le DropDownList e le CheckBox
                                TableRow myTableRow = new TableRow();
                                TableCell myTableCell = new TableCell();

                                cella = 1;
                                myTableRow.ID = "myTableRow_" + idRiga;
                                myOrarioTable.Rows.Add(myTableRow);
                                riga++;
                                idRiga = blocco + "_" + riga;

                                myTableCell.ID = "myTableCell_" + idCella;
                                myTableRow.Cells.Add(myTableCell);
                                cella++;
                                idCella = blocco + "_" + riga + "_" + cella;

                                Label label1 = new Label();
                                label1.ID = "dalleMattinaLabel_" + idRiga ;
                                label1.Text = "dalle: ";
                                myTableCell.Controls.Add(label1);

                                DropDownList dalleMattinaDropDownList = new DropDownList();
                                dalleMattinaDropDownList.ID = "dalleMattinaDropDownList_" + idRiga;
                                dalleMattinaDropDownList.CssClass = "dropDownListSmallDD";
                                dalleMattinaDropDownList.Enabled = !myAutorizzazioneCampi.SolaLettura;
                                myTableCell.Controls.Add(dalleMattinaDropDownList);

                                myTableCell = new TableCell();
                                myTableCell.ID = "myTableCell_" + idCella;
                                   myTableRow.Cells.Add(myTableCell);
                                cella++;
                                idCella = blocco + "_" + riga + "_" + cella;

                                Label label2 = new Label();
                                label2.ID = "alleMattinaLabel_" + idRiga;
                                label2.Text = " alle: ";
                                myTableCell.Controls.Add(label2);
                                DropDownList alleMattinaDropDownList = new DropDownList();
                                alleMattinaDropDownList.ID = "alleMattinaDropDownList_" + idRiga;
                                alleMattinaDropDownList.CssClass = "dropDownListSmallDD";
                                alleMattinaDropDownList.Enabled = !myAutorizzazioneCampi.SolaLettura;
                                myTableCell.Controls.Add(alleMattinaDropDownList);
                                
                                myTableCell = new TableCell();
                                myTableCell.ID = "myTableCell_" + idCella;
                                myTableRow.Cells.Add(myTableCell);
                                cella++;
                                idCella = blocco + "_" + riga + "_" + cella;

                                Label label3 = new Label();
                                label3.ID = "dallePomeriggioLabel_" + idRiga;
                                label3.Text = " dalle: ";
                                myTableCell.Controls.Add(label3);

                                DropDownList dallePomeriggioDropDownList = new DropDownList();
                                dallePomeriggioDropDownList.ID = "dallePomeriggioDropDownList_" + idRiga;
                                dallePomeriggioDropDownList.CssClass = "dropDownListSmallDD";
                                dallePomeriggioDropDownList.Enabled = !myAutorizzazioneCampi.SolaLettura;
                                myTableCell.Controls.Add(dallePomeriggioDropDownList);
                                
                                myTableCell = new TableCell();
                                myTableCell.ID = "myTableCell_" + idCella;
                                myTableRow.Cells.Add(myTableCell);
                                cella++;
                                idCella = blocco + "_" + riga + "_" + cella;

                                Label label4 = new Label();
                                label4.ID = "allePomeriggioLabel_" + idRiga;
                                label4.Text = " alle: ";
                                myTableCell.Controls.Add(label4);

                                DropDownList allePomeriggioDropDownList = new DropDownList();
                                allePomeriggioDropDownList.ID = "allePomeriggioDropDownList_" + idRiga;
                                allePomeriggioDropDownList.CssClass = "dropDownListSmallDD";
                                allePomeriggioDropDownList.Enabled = !myAutorizzazioneCampi.SolaLettura;
                                myTableCell.Controls.Add(allePomeriggioDropDownList);

                                dalleMattinaDropDownList.Items.Add("--");
                                alleMattinaDropDownList.Items.Add("--");
                                dallePomeriggioDropDownList.Items.Add("--");
                                allePomeriggioDropDownList.Items.Add("--");

                                for (int j = 7; j <= 24; j++)
                                {
                                    dalleMattinaDropDownList.Items.Add(j + ":00");
                                    alleMattinaDropDownList.Items.Add(j + ":00");
                                    dallePomeriggioDropDownList.Items.Add(j + ":00");
                                    allePomeriggioDropDownList.Items.Add(j + ":00");
                                    if(j<24)
                                    {
                                        dalleMattinaDropDownList.Items.Add(j + ":30");
                                        alleMattinaDropDownList.Items.Add(j + ":30");
                                        dallePomeriggioDropDownList.Items.Add(j + ":30");
                                        allePomeriggioDropDownList.Items.Add(j + ":30");
                                    }
                                }

                                myTableCell = new TableCell();
                                myTableCell.ID = "myTableCell_" + idCella;
                                myTableCell.ColumnSpan = 4;
                                myTableRow.Cells.Add(myTableCell);
                                cella++;
                                idCella = blocco + "_" + riga + "_" + cella;

                                Label label5 = new Label();
                                label5.ID = "giorni_" + idRiga;
                                label5.Text = " - Giorni: ";
                                myTableCell.Controls.Add(label5);

                                CheckBoxList myGiorniCheckBoxList = new CheckBoxList();
                                myGiorniCheckBoxList.ID = "giorniCheckBoxList_" + idRiga;
                                myTableCell.Controls.Add(myGiorniCheckBoxList);

                                myGiorniCheckBoxList.Enabled = !myAutorizzazioneCampi.SolaLettura;
                                myGiorniCheckBoxList.RepeatDirection = RepeatDirection.Horizontal;
                                myGiorniCheckBoxList.RepeatLayout = RepeatLayout.Flow;
                                myGiorniCheckBoxList.Width = 254;
                                if (myAutorizzazioneCampi.SolaLettura)
                                {
                                    myGiorniCheckBoxList.CssClass = "checkBoxListReadOnlyDD";
                                    myGiorniCheckBoxList.ToolTip = "Campo non modificabile";
                                }
                                else
                                {
                                    myGiorniCheckBoxList.CssClass = "checkBoxListDD";
                                    myGiorniCheckBoxList.ToolTip = "Campo modificabile";
                                }
                                ListItem myGiornoListItem = new ListItem();
                                myGiornoListItem.Text = "Lu";
                                myGiornoListItem.Value = "Lu";
                                myGiorniCheckBoxList.Items.Add(myGiornoListItem);
                                myGiornoListItem = new ListItem();
                                myGiornoListItem.Text = "Ma";
                                myGiornoListItem.Value = "Ma";
                                myGiorniCheckBoxList.Items.Add(myGiornoListItem);
                                myGiornoListItem = new ListItem();
                                myGiornoListItem.Text = "Me";
                                myGiornoListItem.Value = "Me";
                                myGiorniCheckBoxList.Items.Add(myGiornoListItem);
                                myGiornoListItem = new ListItem();
                                myGiornoListItem.Text = "Gi";
                                myGiornoListItem.Value = "Gi";
                                myGiorniCheckBoxList.Items.Add(myGiornoListItem);
                                myGiornoListItem = new ListItem();
                                myGiornoListItem.Text = "Ve";
                                myGiornoListItem.Value = "Ve";
                                myGiorniCheckBoxList.Items.Add(myGiornoListItem);
                                myGiornoListItem = new ListItem();
                                myGiornoListItem.Text = "Sa";
                                myGiornoListItem.Value = "Sa";
                                myGiorniCheckBoxList.Items.Add(myGiornoListItem);
                                myGiornoListItem = new ListItem();
                                myGiornoListItem.Text = "Do";
                                myGiornoListItem.Value = "Do";
                                myGiorniCheckBoxList.Items.Add(myGiornoListItem);

                                #region AssegnazioneValore
                                if (blocco <= myOrarioAperturaDataTable.Rows.Count)
                                {

                                    foreach (ListItem myListItem in dalleMattinaDropDownList.Items)
                                    {
                                        if (myListItem.Text == myOrarioAperturaDataTable.Rows[blocco - 1]["dalleMattina"].ToString())
                                        {
                                            myListItem.Selected = true;
                                            break;
                                        }
                                    }

                                    foreach (ListItem myListItem in alleMattinaDropDownList.Items)
                                    {
                                        if (myListItem.Text == myOrarioAperturaDataTable.Rows[blocco - 1]["alleMattina"].ToString())
                                        {
                                            myListItem.Selected = true;
                                            break;
                                        }
                                    }

                                    foreach (ListItem myListItem in dallePomeriggioDropDownList.Items)
                                    {
                                        if (myListItem.Text == myOrarioAperturaDataTable.Rows[blocco - 1]["dallePomeriggio"].ToString())
                                        {
                                            myListItem.Selected = true;
                                            break;
                                        }
                                    }

                                    foreach (ListItem myListItem in allePomeriggioDropDownList.Items)
                                    {
                                        if (myListItem.Text == myOrarioAperturaDataTable.Rows[blocco - 1]["allePomeriggio"].ToString())
                                        {
                                            myListItem.Selected = true;
                                            break;
                                        }
                                    }

                                    myGiorniCheckBoxList.Items.FindByText("Lu").Selected = (Boolean)myOrarioAperturaDataTable.Rows[blocco - 1]["Lun"];
                                    myGiorniCheckBoxList.Items.FindByText("Ma").Selected = (Boolean)myOrarioAperturaDataTable.Rows[blocco - 1]["Mar"];
                                    myGiorniCheckBoxList.Items.FindByText("Me").Selected = (Boolean)myOrarioAperturaDataTable.Rows[blocco - 1]["Mer"];
                                    myGiorniCheckBoxList.Items.FindByText("Gi").Selected = (Boolean)myOrarioAperturaDataTable.Rows[blocco - 1]["Gio"];
                                    myGiorniCheckBoxList.Items.FindByText("Ve").Selected = (Boolean)myOrarioAperturaDataTable.Rows[blocco - 1]["Ven"];
                                    myGiorniCheckBoxList.Items.FindByText("Sa").Selected = (Boolean)myOrarioAperturaDataTable.Rows[blocco - 1]["Sab"];
                                    myGiorniCheckBoxList.Items.FindByText("Do").Selected = (Boolean)myOrarioAperturaDataTable.Rows[blocco - 1]["Dom"];
                                }

                            } 
                                #endregion
                            #endregion
                            break;
                    }
                    #region RenderingControl
                    List<AutorizzazioneCampi> filteredList;
                    filteredList = myAutorizzazioneCampiList.Where(x => x.Visibile == true && x.TipoDato != "OrarioApertura" && x.TipoDato != "Note").ToList();

                    if (myTable.Rows.Count < Math.Ceiling(filteredList.Count / 2.0))
                    {
                        TableRow tRow = new TableRow();
                        myTable.Rows.Add(tRow);                   

                        TableCell tCell1 = new TableCell();
                        tCell1.CssClass = "tableColumn1DD";
                        tRow.Cells.Add(tCell1);

                        TableCell tCell2 = new TableCell();
                        tCell2.CssClass = "tableColumn2DD";
                        tRow.Cells.Add(tCell2);

                        TableCell tCell3 = new TableCell();
                        tCell3.CssClass = "tableColumn3DD";
                        tRow.Cells.Add(tCell3);

                        TableCell tCell4 = new TableCell();
                        tCell4.CssClass = "tableColumn1DD";
                        tRow.Cells.Add(tCell4);

                        TableCell tCell5 = new TableCell();
                        tCell5.CssClass = "tableColumn2DD";
                        tRow.Cells.Add(tCell5);  

                        tCell1.Controls.Add(myLabel);
                        tCell2.Controls.Add(myRuntimeControl);
                        if (myAutorizzazioneCampi.ValidaControlli)
                        {
                            tCell2.Controls.Add(myRegularExpressionValidator);
                            if (myAutorizzazioneCampi.ValidaData)
                            {
                                tCell2.Controls.Add(myTextBoxWatermarkExtender);
                                tCell2.Controls.Add(myCalendarExtender);
                            }
                        }
                    }
                    else
                    {
                        if (myRuntimeControl.GetType() == typeof(Panel) || myAutorizzazioneCampi.TipoDato == "Note")
                        {
                            TableRow tRow = new TableRow();
                            myTable.Rows.Add(tRow);

                            TableCell tCell1 = new TableCell();
                            tCell1.CssClass = "tableColumn1DD";                       
                            tRow.Cells.Add(tCell1);

                            TableCell tCell2 = new TableCell();
                            //tCell2.CssClass = "tableColumn2DD";
                            tCell2.ColumnSpan = 4;
                            tRow.Cells.Add(tCell2);

                            tCell1.Controls.Add(myLabel);
                            tCell2.Controls.Add(myRuntimeControl);
                        }
                        else
                        {
                            Int32 riga = i - myTable.Rows.Count;
                            myTable.Rows[riga].Cells[3].Controls.Add(myLabel);
                            myTable.Rows[riga].Cells[4].Controls.Add(myRuntimeControl);
                            if (myAutorizzazioneCampi.ValidaControlli)
                            {
                                myTable.Rows[riga].Cells[4].Controls.Add(myRegularExpressionValidator);
                                if (myAutorizzazioneCampi.ValidaData)
                                {
                                    myTable.Rows[riga].Cells[4].Controls.Add(myTextBoxWatermarkExtender);
                                    myTable.Rows[riga].Cells[4].Controls.Add(myCalendarExtender);
                                }
                            }
                        }
                    }
                    i++;
                    #endregion
                }
            }
            return myTable;
        }

        private List<DealerUpdateFields> AggiornaListaDati(List<DealerUpdateFields> myDealerUpdateFieldsList, Boolean salvataggio = false)
        {
            // Faccio un ciclo per individuare tutti i controlli di tipo TextBox, DropdownList, CheckBox, CheckBoxList e OrarioApertura sulla pagina e caricare il dato su myDealerUpdateFieldsList. 
            // L'opzione nuovoValore mi permette di indicare alla function se si tratta di un primo caricamento degli oggetti in fase di page Load oppure se mi trovo
            // in fase di salvataggio dei dati e quindi devo raccogliere le variazioni.
            foreach (PlaceHolder myPlaceHolder in Master.FindControl("MainContentPlaceHolder").Controls.OfType <PlaceHolder>())
            {
                foreach (Table myTable in myPlaceHolder.Controls.OfType<Table>())
                {
                    foreach (TableRow myTableRow in myTable.Rows)
                    {
                        foreach (TableCell myTableCell in myTableRow.Cells)
                        {
                            foreach (Control myControl in myTableCell.Controls)
                            {
                                if (myControl.GetType() == typeof(TextBox) || 
                                        myControl.GetType() == typeof(DropDownList) ||
                                            myControl.GetType() == typeof(CheckBox) ||
                                                myControl.GetType() == typeof(CheckBoxList) ||
                                                    myControl.GetType() == typeof(Panel))
                                {

                                    // Carico il valore Text contenuto nelle TextBox
                                    if (myControl.ID.Split('_').First() == "TextBox")
                                    {
                                        if ((myControl as TextBox).ReadOnly == false)
                                        {
                                            // Verifico se devo caricare il valore di caricamento della pagina o il valore modificato dall'utente.
                                            if (salvataggio)
                                            {
                                                foreach (DealerUpdateFields myDealerUpdateFields in myDealerUpdateFieldsList)
                                                {
                                                    if (myDealerUpdateFields.NomeCampo == myControl.ID.Split('_').Last())
                                                    {
                                                        myDealerUpdateFields.DatoNuovo = (myControl as TextBox).Text;
                                                        break;
                                                    }
                                                }
                                            }
                                            else
                                            {
                                                DealerUpdateFields myDealerUpdateFields = new DealerUpdateFields();
                                                myDealerUpdateFields.NomeCampo = myControl.ID.Split('_').Last();
                                                myDealerUpdateFields.DatoVecchio = (myControl as TextBox).Text;
                                                myDealerUpdateFieldsList.Add(myDealerUpdateFields);                                     
                                            }
                                        }
                                    }

                                    // Carico il valore Checked contenuto nelle CheckBox
                                    if (myControl.ID.Split('_').First() == "CheckBox")
                                    {
                                        if ((myControl as CheckBox).Enabled == true)
                                        {
                                            // Verifico se devo caricare il valore di caricamento della pagina o il valore modificato dall'utente.
                                            if (salvataggio)
                                            {
                                                foreach (DealerUpdateFields myDealerUpdateFields in myDealerUpdateFieldsList)
                                                {
                                                    if (myDealerUpdateFields.NomeCampo == myControl.ID.Split('_').Last())
                                                    {
                                                        myDealerUpdateFields.DatoNuovo = (myControl as CheckBox).Checked.ToString();
                                                        break;
                                                    }
                                                }
                                            }
                                            else
                                            {
                                                DealerUpdateFields myDealerUpdateFields = new DealerUpdateFields();
                                                myDealerUpdateFields.NomeCampo = myControl.ID.Split('_').Last();
                                                myDealerUpdateFields.DatoVecchio = (myControl as CheckBox).Checked.ToString();
                                                myDealerUpdateFieldsList.Add(myDealerUpdateFields);                                             
                                            }
                                        }
                                    }

                                    // Carico il valore Text contenuto nelle DropDownList
                                    if (myControl.ID.Split('_').First() == "DropDownList")
                                    {
                                        if ((myControl as DropDownList).Enabled == true)
                                        {
                                            // Verifico se devo caricare il valore di caricamento della pagina o il valore modificato dall'utente.
                                            if (salvataggio)
                                            {
                                                foreach (DealerUpdateFields myDealerUpdateFields in myDealerUpdateFieldsList)
                                                {
                                                    if (myDealerUpdateFields.NomeCampo == myControl.ID.Split('_').Last())
                                                    {
                                                        myDealerUpdateFields.DatoNuovo = (myControl as DropDownList).SelectedItem.Text;
                                                        break;
                                                    }
                                                }
                                            }
                                            else
                                            {
                                                DealerUpdateFields myDealerUpdateFields = new DealerUpdateFields();
                                                myDealerUpdateFields.NomeCampo = myControl.ID.Split('_').Last();
                                                myDealerUpdateFields.DatoVecchio = (myControl as DropDownList).SelectedItem.Text;
                                                myDealerUpdateFieldsList.Add(myDealerUpdateFields);                                          
                                            }
                                        }
                                    }

                                    // Carico il valore Text contenuto nelle CheckBoxList
                                    if (myControl.ID.Split('_').First() == "CheckBoxList")
                                    {
                                        if ((myControl as CheckBoxList).Enabled == true)
                                        {
                                            // Verifico se devo caricare il valore di caricamento della pagina o il valore modificato dall'utente.
                                            if (salvataggio)
                                            {
                                                foreach (DealerUpdateFields myDealerUpdateFields in myDealerUpdateFieldsList)
                                                {
                                                     foreach (ListItem myListItem in (myControl as CheckBoxList).Items)
                                                     {
                                                        if (myDealerUpdateFields.NomeCampo == myControl.ID.Split('_').Last() && 
                                                            (myListItem.Selected == true))
                                                        {
                                                            myDealerUpdateFields.DatoNuovo += myListItem.Text + "|";
                                                            //break;
                                                        }
                                                        if (myDealerUpdateFields.DatoNuovo == null) { myDealerUpdateFields.DatoNuovo = ""; } 
                                                     }
                                                }
                                            }
                                            else
                                            {
                                                DealerUpdateFields myDealerUpdateFields = new DealerUpdateFields();
                                                myDealerUpdateFields.NomeCampo = myControl.ID.Split('_').Last();
                                                foreach (ListItem myListItem in (myControl as CheckBoxList).Items)
                                                {                     
                                                    if(myListItem.Selected == true)
                                                    {
                                                        myDealerUpdateFields.DatoVecchio += myListItem.Text + "|";
                                                    }
                                                    if (myDealerUpdateFields.DatoVecchio == null) { myDealerUpdateFields.DatoVecchio = ""; } 
                                                }
                                                myDealerUpdateFieldsList.Add(myDealerUpdateFields);
                                            }
                                        }
                                    }


                                    // Carico il valore Text contenuto nelle CheckBoxList
                                    if (myControl.ID.Split('_').First() == "Panel")
                                    {
                                        if ((myControl as Panel).Enabled == true)
                                        {
                                            // Verifico se devo caricare il valore di caricamento della pagina o il valore modificato dall'utente.
                                            if (salvataggio)
                                            {
                                                foreach (DealerUpdateFields myDealerUpdateFields in myDealerUpdateFieldsList)
                                                {
                                                    if (myDealerUpdateFields.NomeCampo == myControl.ID.Split('_').Last())
                                                    {
                                                        foreach (Table myOrarioTable in myControl.Controls.OfType<Table>())
                                                        {
                                                            foreach (TableRow myOrarioTableRow in myOrarioTable.Rows)
                                                            {
                                                                foreach (TableCell myOrarioTableCell in myOrarioTableRow.Cells)
                                                                {
                                                                    foreach (Control myOrarioControl in myOrarioTableCell.Controls)
                                                                    {
                                                                        if (myOrarioControl.GetType() == typeof(DropDownList))
                                                                        {                                                                       
                                                                            myDealerUpdateFields.DatoNuovo += (myOrarioControl as DropDownList).SelectedItem.Text + "|";
                                                                            break;
                                                                        }
                                                                        if (myOrarioControl.GetType() == typeof(CheckBoxList))
                                                                        {
                                                                            //myDealerUpdateFields.DatoNuovo += "(";
                                                                            foreach (ListItem myListItem in (myOrarioControl as CheckBoxList).Items)
                                                                            {
                                                                                if (myListItem.Selected == true)
                                                                                {
                                                                                    myDealerUpdateFields.DatoNuovo += myListItem.Text + "#";
                                                                                }
                                                                                if (myDealerUpdateFields.DatoNuovo == null) { myDealerUpdateFields.DatoNuovo = ""; }
                                                                            }
                                                                            //myDealerUpdateFields.DatoNuovo += ");";
                                                                            myDealerUpdateFields.DatoNuovo += ";";
                                                                        }  
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                            else
                                            {
                                                DealerUpdateFields myDealerUpdateFields = new DealerUpdateFields();
                                                myDealerUpdateFields.NomeCampo = myControl.ID.Split('_').Last();

                                                foreach (Table myOrarioTable in myControl.Controls.OfType<Table>())
                                                {
                                                    foreach (TableRow myOrarioTableRow in myOrarioTable.Rows)
                                                    {
                                                        foreach (TableCell myOrarioTableCell in myOrarioTableRow.Cells)
                                                        {
                                                            foreach (Control myOrarioControl in myOrarioTableCell.Controls)
                                                            {
                                                                if (myOrarioControl.GetType() == typeof(DropDownList))
                                                                {
                                                                    myDealerUpdateFields.NomeCampo = myControl.ID.Split('_').Last();
                                                                    myDealerUpdateFields.DatoVecchio += (myOrarioControl as DropDownList).SelectedItem.Text + "|";                                                     
                                                                }
                                                                if (myOrarioControl.GetType() == typeof(CheckBoxList))
                                                                {
                                                                    //myDealerUpdateFields.DatoVecchio += "(";
                                                                    foreach (ListItem myListItem in (myOrarioControl as CheckBoxList).Items)
                                                                    {
                                                                        if (myListItem.Selected == true)
                                                                        {
                                                                            myDealerUpdateFields.DatoVecchio += myListItem.Text + "#";
                                                                        }
                                                                    }
                                                                    //myDealerUpdateFields.DatoVecchio += ");";
                                                                    myDealerUpdateFields.DatoVecchio += ";";
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                                myDealerUpdateFieldsList.Add(myDealerUpdateFields);
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            return myDealerUpdateFieldsList;
        }

        protected void salvaImageButton_Click(object sender, ImageClickEventArgs e)
        {

            List<DealerUpdateFields> myDealerUpdateFieldsList = (List<DealerUpdateFields>)Session["myDealerUpdateFieldsList"];

            myDealerUpdateFieldsList = AggiornaListaDati(myDealerUpdateFieldsList, true);

            DealerUpdate myDealerUpdate = new DealerUpdate();
            myDealerUpdate.IDDealer = Convert.ToInt32(IDDealerHiddenField.Value);
            myDealerUpdate.DealerUpdateFieldsList = myDealerUpdateFieldsList;
           if ( myDealerUpdate.DealerUpdateFieldsList.Exists(x => x.IsDatoModificato == true))
            {
                int IDUtente = Convert.ToInt32(Session["IDUtente"]);
                string retcode = proxyMtd.UpdateDealer(IDUtente, myDealerUpdate);
                //variazioniLiteral.Text = "VARIAZIONI: ";
                //foreach(DealerUpdateFields myDealerUpdateFields in myDealerUpdateFieldsList)
                //{
                //    if(myDealerUpdateFields.IsDatoModificato)
                //        variazioniLiteral.Text += myDealerUpdateFields.NomeCampo + " -> V: " +  myDealerUpdateFields.DatoVecchio + " N: " + myDealerUpdateFields.DatoNuovo + "; ";
                //}
                retCodeLabel.Text = retcode;
                Session["retCode"] = retcode;
                Response.Redirect("DettaglioDealer.aspx");
            }
            else
            {
                retCodeLabel.Text = "Nessun dato da aggiornare";
                Session["retCode"] = "Nessun dato da aggiornare";
            }
        }
    }
}