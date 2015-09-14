using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Spindox.AnagraficaDealer.UserControl
{
    public partial class GestioneProfiliSubMenuControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void aggiungiProfiloImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Session.Remove("IDProfilo");
            Response.Redirect("~/GestioneProfili.aspx");
        }

        protected void modificaProfiloImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/GestioneProfili.aspx");
        }

        public void enableBtnModifica(bool enable)
        {
            if (enable)
            {
                modificaProfiloImageButton.Enabled = true;
                modificaProfiloImageButton.ImageUrl = "~/Resources/Images/Amministrazione/edit_active.png";
                modificaProfiloImageButton.CssClass = "imgSubMenu pointerCursor";

            }
            else
            {
                modificaProfiloImageButton.Enabled = false;
                modificaProfiloImageButton.ImageUrl = "~/Resources/Images/Amministrazione/edit_disabled.png";
                modificaProfiloImageButton.CssClass = "imgSubMenu noCursor";

            }
        }

        public void enableBtnElimina(bool enable)
        {
            if (enable)
            {
                eliminaProfiloImageButton.Enabled = true;
                eliminaProfiloImageButton.ImageUrl = "~/Resources/Images/Amministrazione/disable_active.png";
                eliminaProfiloImageButton.CssClass = "imgSubMenu pointerCursor";

            }
            else
            {
                eliminaProfiloImageButton.Enabled = false;
                eliminaProfiloImageButton.ImageUrl = "~/Resources/Images/Amministrazione/disable_disabled.png";
                eliminaProfiloImageButton.CssClass = "imgSubMenu noCursor";

            }
        }

        protected void eliminaProfiloImageButton_Click(object sender, ImageClickEventArgs e)
        {
            Profili prof = (Profili)Parent.Page;
            prof.showEliminaPopup();

        }

    }
}