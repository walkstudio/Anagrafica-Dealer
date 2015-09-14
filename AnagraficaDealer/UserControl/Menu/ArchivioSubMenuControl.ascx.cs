using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Spindox.AnagraficaDealer.UserControl.Menu
{
    public partial class ArchivioSubMenuControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

            if (Session["ArchivioDataBase"].ToString() == "True")
            {
                archivioDatabaseSubMenu.Visible = true;
           
            }

            if (Session["ArchivioCruscotto"].ToString() == "True")
            {
                archivioCruscottoSubMenu.Visible = true;
            }

             if (Session["ReportScarti"].ToString() == "True" || Session["ReportAnomalie"].ToString() == "True")
            {
                importazioniSubMenu.Visible = true;
            }


        }
    }
}