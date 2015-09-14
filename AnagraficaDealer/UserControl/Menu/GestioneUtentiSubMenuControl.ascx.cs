using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Spindox.AnagraficaDealer.UserControl
{
    public partial class GestioneUtentiSubMenuControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAggiungiImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/GestioneUtenti.aspx");
        }
        protected void btnModificaImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/GestioneUtenti.aspx");
        }

        protected void btnEliminaImageButton_Click(object sender, ImageClickEventArgs e)
        {
            //Server.Transfer("~/utenti.aspx");     
            Utenti utente = (Utenti)Parent.Page;
            utente.showEliminaPopup();
        }

        public void enableBtnModifica(bool enable)
        {
            if (enable)
            {
                btnModificaImageButton.Enabled = true;
                btnModificaImageButton.ImageUrl = "~/Resources/Images/Amministrazione/edit_active.png";
                btnModificaImageButton.CssClass = "imgSubMenu pointerCursor";            
            }
            else
            {
                btnModificaImageButton.Enabled = false;
                btnModificaImageButton.ImageUrl = "~/Resources/Images/Amministrazione/edit_disabled.png";
                btnModificaImageButton.CssClass = "imgSubMenu noCursor";
            }
        }

        public void enableBtnElimina(bool enable)
        {
            if (enable)
            {
                btnEliminaImageButton.Enabled = true;
                btnEliminaImageButton.ImageUrl = "~/Resources/Images/Amministrazione/disable_active.png";
                btnEliminaImageButton.CssClass = "imgSubMenu pointerCursor";
            }
            else
            {
                btnEliminaImageButton.Enabled = false;
                btnEliminaImageButton.ImageUrl = "~/Resources/Images/Amministrazione/disable_disabled.png";
                btnEliminaImageButton.CssClass = "imgSubMenu noCursor";
            }
        }
    }
}