using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Spindox.AnagraficaDealer.UserControl
{
    public partial class GestioneImportEccezioniSubMenuControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAggiungiImageButton_Click(object sender, ImageClickEventArgs e)
        {
            //Response.Redirect("~/GestioneImportEcc.aspx");
            ImportEccezioni imp = (ImportEccezioni)Parent.Page;
            imp.showAggiungiPopup();
        }

    }
}