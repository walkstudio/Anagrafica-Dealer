using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AnagraficaDealerClassLib;
using System.Data;
using System.Dynamic;

namespace Spindox.AnagraficaDealer
{
    public partial class GestioneUtenti : System.Web.UI.Page
    {
        private AnagraficaDealerService proxyMtd;

        private int IDUtente
        {
            get
            {
                if (Session["IDUtente"] == null)
                {
                    Session["IDUtente"] = 0;
                }
                return (Int32)Session["IDUtente"];
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            proxyMtd = new AnagraficaDealerService();
            if (!IsPostBack)
            {

                if (IDUtente != 0)
                {
                    setUtente();
                    AggiungiUtenteButton.Visible = false;
                    ModicaUtenteButton.Visible = true;
                }
                else
                {
                    AggiungiUtenteButton.Visible = true;
                    ModicaUtenteButton.Visible = false;
                }
            }
        }

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

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Remove("IDUtente");
            }
        }

        protected void btnCercaUtente_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                //Utente utente = new Utente();
                if (!txtUsernameUtente.Text.Trim().Equals(""))
                {
                    DataTable utente = proxyMtd.getFromActiveDirectory(txtUsernameUtente.Text);

                    if (utente == null)
                    {
                        throw new Exception("Utente non esistente.");
                    }
                    else
                    {
                        txtUsernameUtente.Enabled = false;
                        txtNomeUtente.Text = utente.Rows[0]["Nome"].ToString();
                        txtCognomeUtente.Text = utente.Rows[0]["Cognome"].ToString();
                        txtEmailUtente.Text = utente.Rows[0]["Email"].ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                PopupMessaggio.ShowMsgBox(ex.Message, true);
            }
        }

        public void InitializeDatiUtente()
        {
            txtUsernameUtente.Text = "";
            txtNomeUtente.Text = "";
            txtCognomeUtente.Text = "";
            txtEmailUtente.Text = "";

            txtUsernameUtente.Enabled = true;
            ddlProfiloUtente.SelectedIndex = 0;

        }

        protected void btnResetUtente_Click(object sender, ImageClickEventArgs e)
        {
            txtUsernameUtente.Enabled = true;
            txtUsernameUtente.Text = "";
            txtNomeUtente.Text = "";
            txtCognomeUtente.Text = "";
            txtEmailUtente.Text = "";
        }

        protected void AggiungiUtenteButton_Click(object sender, ImageClickEventArgs e)
        {
            try
            {

                if (Page.IsValid)
                {
                   
                    Utente utente = new Utente();
                    //Profilo profilo = new Profilo();

                    utente.Nome = txtNomeUtente.Text;
                    utente.Cognome = txtCognomeUtente.Text;
                    utente.Email = txtEmailUtente.Text;
                    utente.UserID = txtUsernameUtente.Text;

                    utente.IDProfilo = Convert.ToInt32(ddlProfiloUtente.SelectedItem.Value);
                    //profilo.NomeProfilo = ddlProfiloUtente.SelectedItem.Text;

                    utente.CodRuolo = txtCodiceRuolo.Enabled ? txtCodiceRuolo.Text : "";

                    Boolean esiste = proxyMtd.InsertUtente(utente);
                   

                   
                        if (!esiste)
                        {
                            InitializeDatiUtente();
                            Response.Redirect("~/Utenti.aspx");
                        }
                        else
                        {
                            PopupMessaggio.ShowMsgBox("Utente gia presente.", false);
                        }
                    

                }
            }
            catch (Exception ex)
            {
                PopupMessaggio.ShowMsgBox("Errore :" + ex.Message, true);
            }
        }

        protected void ddlProfiloUtente_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ddlProfiloUtente.DataSource = proxyMtd.GetAllProfili();
                ddlProfiloUtente.DataValueField = "IDProfilo";
                ddlProfiloUtente.DataTextField = "NomeProfilo";
                ddlProfiloUtente.DataBind();
            }
        }

        protected void ddlProfiloUtente_Change(object sender, EventArgs e)
        {
            if(Page.IsPostBack)
            {
                int IDProfilo = Convert.ToInt32(ddlProfiloUtente.SelectedValue);
                //DataTable utente = proxyMtd.GetUtente(Convert.ToInt32(IDUtenteHiddenField.Value));
                DataTable codruolo = proxyMtd.IsCodRuoloActive(IDProfilo);

                txtCodiceRuolo.Enabled = codruolo.Rows[0]["CodiceRuoloAttivo"] as bool? ?? false;
                txtCodiceRuolo.ToolTip = "Ruolo associato per il profilo scelto: " + codruolo.Rows[0]["Ruolo"].ToString();

            }
        }

        protected void ModicaUtenteButton_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {


                    Utente utente = new Utente();

                    utente.IDUtente = Convert.ToInt32(IDUtenteHiddenField.Value);

                    utente.Nome = txtNomeUtente.Text;
                    utente.Cognome = txtCognomeUtente.Text;
                    utente.Email = txtEmailUtente.Text;
                    utente.UserID = txtUsernameUtente.Text;
                    utente.IDProfilo = Convert.ToInt32(ddlProfiloUtente.SelectedValue);

                    utente.CodRuolo = txtCodiceRuolo.Enabled ? txtCodiceRuolo.Text : "" ;


                    String error = proxyMtd.UpdateUtente(utente);

                    if (error != String.Empty)
                    {
                        PopupMessaggio.ShowMsgBox("Utente non modificato", false);
                    }
                    else
                    {
                        InitializeDatiUtente();
                        Response.Redirect("~/Utenti.aspx");
                    }

                }
            }
            catch (Exception ex)
            {
                PopupMessaggio.ShowMsgBox(ex.Message, true);
            }
        }

        private void setUtente()
        {
            DataTable dt = proxyMtd.GetUtente(IDUtente);

            IDUtenteHiddenField.Value = dt.Rows[0]["IDUtente"].ToString();

            txtNomeUtente.Text = dt.Rows[0]["Nome"].ToString();
            txtCognomeUtente.Text = dt.Rows[0]["Cognome"].ToString();
            txtEmailUtente.Text = dt.Rows[0]["Email"].ToString();
            txtUsernameUtente.Text = dt.Rows[0]["UserID"].ToString();

            ddlProfiloUtente.SelectedValue = dt.Rows[0]["IDProfilo"].ToString();
            txtCodiceRuolo.Text = dt.Rows[0]["CodRuolo"].ToString();
            txtCodiceRuolo.ToolTip = "Ruolo profilo associato: " + dt.Rows[0]["Ruolo"].ToString();

            txtCodiceRuolo.Enabled = dt.Rows[0]["CodiceRuoloAttivo"] as bool? ?? false;

            txtUsernameUtente.Enabled = false;
            btnCercaUtente.Visible = false;
            btnResetUtente.Visible = false;
        }
    }
}
