using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AnagraficaDealerClassLib;
using System.Data;

namespace Spindox.AnagraficaDealer
{
    public partial class GestioneProfili : System.Web.UI.Page
    {
        private AnagraficaDealerService proxyMtd;
        private int IDProfilo
        {
            get
            {
                if (Session["IDProfilo"] == null)
                {
                    Session["IDProfilo"] = 0;
                }
                return (Int32)Session["IDProfilo"];
            }
        }
        private DataTable TipoDealerTable
        {
            get
            {
                if (ViewState["TipoDealerTable"] == null)
                {
                    DataTable dt = new DataTable();
                    dt.Columns.Add("IDTipoDealer", typeof(int));
                    dt.Columns.Add("NomeTipoDealer", typeof(string));
                    ViewState["TipoDealerTable"] = dt;
                }
                return (DataTable)ViewState["TipoDealerTable"];
            }
            set
            {
                ViewState["TipoDealerTable"] = value;
            }
        }
        //private DataTable AutorizzazioneCampiTable
        //{
        //    get
        //    {
        //        if (ViewState["AutorizzazioneCampiTable"] == null)
        //        {
        //            DataTable dt = new DataTable();
        //            dt.Columns.Add("IDAutorizzazioneCampi", typeof(int));
        //            dt.Columns.Add("Autorizzazione", typeof(int));
        //            dt.Columns.Add("IDCampoDati", typeof(int));
        //            ViewState["AutorizzazioneCampiTable"] = dt;
        //        }
        //        return (DataTable)ViewState["AutorizzazioneCampiTable"];
        //    }
        //    set
        //    {
        //        ViewState["AutorizzazioneCampiTable"] = value;
        //    }
        //}
        protected void Page_Init(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Session["UserID"] == null || Session["UserID"].ToString() == "" || Session["Amministrazione"].ToString() == "False")
                {
                    Response.Redirect("~/AccessoNegato.aspx");
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            PopupAggiungiTipoDealer.AggiungiButtonClicked += new UserControl.RagioniSocialiCorrelate.AggiungiTipoDealerEventHandler(PopupAggiungiTipoDealer_AggiungiButtonClicked);
            //PopupAggiungiProfiloAssociazioni.AggiungiButtonClicked += new UserControl.Popup.AggiungiAbilitazioneEventHandler(PopupAggiungiProfiloAbilitazioni_AggiungiButtonClicked);
            proxyMtd = new AnagraficaDealerService();

            if (!IsPostBack)
            {
                IDProfiloHF.Value = IDProfilo.ToString();
                if (IDProfilo != 0)
                {
                    setProfilo();
                }
            }
        }

        private void setProfilo()
        {
            try
            {
                int IDProfiloTmp = Convert.ToInt32(IDProfiloHF.Value.ToString());

                DataTable dt = proxyMtd.GetProfilo(IDProfiloTmp);

                txtNomeProfilo.Text = dt.Rows[0]["NomeProfilo"].ToString();
                cruscottoCheckBox.Checked = Convert.ToBoolean(dt.Rows[0]["ArchivioCruscotto"]);
                databaseCheckBox.Checked=Convert.ToBoolean(dt.Rows[0]["ArchivioDatabase"]);
                anomalieCheckBox.Checked=Convert.ToBoolean(dt.Rows[0]["ReportAnomalie"]);
                scartiCheckBox.Checked=Convert.ToBoolean(dt.Rows[0]["ReportScarti"]);
                amministrazioneCheckBox.Checked=Convert.ToBoolean(dt.Rows[0]["Amministrazione"]);
                portafoglioCheckBox.Checked=Convert.ToBoolean(dt.Rows[0]["Portafoglio"]);
                relazioniDropDownList.SelectedValue = Convert.ToString(dt.Rows[0]["RagioniSocialiCorrelate"]);
                eccezioniCheckBox.Checked = Convert.ToBoolean(dt.Rows[0]["Eccezioni"]);
                ddlRuolo.SelectedValue = Convert.ToString(dt.Rows[0]["IDRuolo"]);

            }
            catch (Exception ex)
            {
                PopupMessaggio.ShowMsgBox(ex.Message, true);
            }
        }

        //protected void btnEliminaAssociazione_Click(object sender, ImageClickEventArgs e)
        //{
        //    ImageButton btn = (ImageButton)sender;
        //    GridViewRow gvr = (GridViewRow)btn.NamingContainer;

        //    AutorizzazioneCampiTable.Rows.RemoveAt(gvr.RowIndex);
        //    autorizzazioneCampiGridView.DataSource = AutorizzazioneCampiTable;
        //    autorizzazioneCampiGridView.DataBind();

        //}

        protected void btnEliminaTipoDealer_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            TipoDealerTable.Rows.RemoveAt(gvr.RowIndex);
            tipoDealerGridView.DataSource = TipoDealerTable;
            tipoDealerGridView.DataBind();
        }

        protected void btnAggiungiTipoDealer_Click(object sender, ImageClickEventArgs e)
        {
            PopupAggiungiTipoDealer.Show();
        }

        //protected void btnAggiungiAbilitazione_Click(object sender, ImageClickEventArgs e)
        //{
        //    PopupAggiungiProfiloAssociazioni.Show();
        //}


        private void PopupAggiungiTipoDealer_AggiungiButtonClicked(object sender, UserControl.RagioniSocialiCorrelate.AggiungiTipoDealerEventArgs e)
        {
            bool valido = validaInserimentoTipoDealer(e.IDTipoDealer);

            if (valido || TipoDealerTable.Rows.Count == 0)
            {
                DataRow dr = TipoDealerTable.NewRow();
                dr[0] = e.IDTipoDealer;
                dr[1] = e.NomeTipoDealer;

                TipoDealerTable.Rows.Add(dr);
                tipoDealerGridView.DataSource = TipoDealerTable;
                tipoDealerGridView.DataBind();

                profiliUpdatePanel.Update();

                PopupAggiungiTipoDealer.Hide();
            }
            else
            {
                PopupAggiungiTipoDealer.setErrorMessage("Abilitazione non inserita:" + Environment.NewLine + " l'abilitazione è già presente.");
            }
        }

        private bool validaInserimentoTipoDealer(int IDTipoDealer)
        {
            DataTable dt = TipoDealerTable;
            EnumerableRowCollection<DataRow> table = dt.AsEnumerable();


            bool insertValue = false;

            if (IDTipoDealer == 0)
            {
                insertValue = false;
            }
            else if (IDTipoDealer != 0)
            {
                var esisteTipoDealer = table.Any(myRow => myRow.Field<int>("IDTipoDealer") == IDTipoDealer);
                var allTipoDealer = table.Any(myRow => myRow.Field<int>("IDTipoDealer") == 0);
                if (!esisteTipoDealer && !allTipoDealer)
                {
                    insertValue = true;
                }
                else
                {
                    insertValue = false;
                }
            }
            return insertValue;

        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Remove("IDProfilo");
            }
        }

    
        protected void btnSalvaProfilo_Click(object sender, ImageClickEventArgs e)
        {
             try
            {
            
            Profilo myProfilo = new Profilo();
            myProfilo.IDProfilo = Convert.ToInt32(IDProfiloHF.Value);
            myProfilo.NomeProfilo = txtNomeProfilo.Text;
            myProfilo.ArchivioCruscotto = cruscottoCheckBox.Checked;
            myProfilo.ArchivioDatabase = databaseCheckBox.Checked;
            myProfilo.ReportAnomalie = anomalieCheckBox.Checked;
            myProfilo.ReportScarti = scartiCheckBox.Checked;
            myProfilo.Amministrazione = amministrazioneCheckBox.Checked;
            myProfilo.Portafoglio = portafoglioCheckBox.Checked;
            myProfilo.RagioniSocialiCorrelate = Convert.ToInt32(relazioniDropDownList.SelectedValue);
            myProfilo.Eccezioni = eccezioniCheckBox.Checked;

            myProfilo.IDRuolo = Convert.ToInt32(ddlRuolo.SelectedValue);

                List<TipoDealer> myTipoDealerList = new List<TipoDealer>();
            foreach (DataRow dr in TipoDealerTable.Rows)
            {
                TipoDealer myTipoDealer = new TipoDealer();
                myTipoDealer.IDTipoDealer = Convert.ToInt32(dr["IDTipoDealer"]);
                myTipoDealerList.Add(myTipoDealer);
            }

            List<AutorizzazioneCampi> myAutorizzazioneCampiList = new List<AutorizzazioneCampi>();
            foreach (GridViewRow myGridViewRow in autorizzazioneCampiGridView.Rows)
            {
                if(myGridViewRow.RowType == DataControlRowType.DataRow)
                    {
                    AutorizzazioneCampi myAutorizzazioneCampi = new AutorizzazioneCampi();
                    Label myIDAutorizzazioneCampiLabel = (Label)myGridViewRow.FindControl("IDAutorizzazioneCampiLabel");
                    DropDownList myAutorizzazioneLabel = (DropDownList)myGridViewRow.FindControl("autorizzazioneDropDownList");
                    Label myIDCampoDatiLabel = (Label)myGridViewRow.FindControl("IDCampoDatiLabel");

                    myAutorizzazioneCampi.IDAutorizzazioneCampi = Convert.ToInt32(myIDAutorizzazioneCampiLabel.Text);
                    myAutorizzazioneCampi.Autorizzazione = Convert.ToInt32(myAutorizzazioneLabel.SelectedValue);
                    myAutorizzazioneCampi.IDCampoDati = Convert.ToInt32(myIDCampoDatiLabel.Text);

                    myAutorizzazioneCampiList.Add(myAutorizzazioneCampi);
                     }
            }


                    if (myProfilo.IDProfilo == 0)
                    {
                        string error = proxyMtd.InsertProfilo(myProfilo, myTipoDealerList, myAutorizzazioneCampiList);

                        if (error != string.Empty)
                        {
                            throw new Exception(error);
                        }
                    }
                    else
                    {
                        string error = proxyMtd.UpdateProfilo(myProfilo, myTipoDealerList, myAutorizzazioneCampiList);

                        if (error != string.Empty)
                        {
                            throw new Exception(error);
                        }
                    }

                    Response.Redirect("~/Profili.aspx");

            }
            catch (Exception ex)
            {
                PopupMessaggio.ShowMsgBox(ex.Message, true);
            }


        }

        protected void tipoDealerGridView_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TipoDealerTable = proxyMtd.GetAllTipoDealer(Session["user"].ToString());
                tipoDealerGridView.DataSource = TipoDealerTable;
                tipoDealerGridView.DataBind();
            }
        }

        protected void autorizzazioniCampiGridView_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //AutorizzazioneCampiTable = proxyMtd.GetAllProfiloAutorizzazioneCampi(IDProfilo);
                //autorizzazioneCampiGridView.DataSource = AutorizzazioneCampiTable;
                //autorizzazioneCampiGridView.DataBind();
 
                autorizzazioneCampiGridView.DataSource = proxyMtd.AutorizzazioneCampi_Get(IDProfilo);
                autorizzazioneCampiGridView.DataBind();
            }
        }

        protected void ddlRuolo_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ddlRuolo.DataSource = proxyMtd.GetAllRuoli();
                ddlRuolo.DataValueField = "IDRuolo";
                ddlRuolo.DataTextField = "Ruolo";
                ddlRuolo.DataBind();
            }
        }
    }
}