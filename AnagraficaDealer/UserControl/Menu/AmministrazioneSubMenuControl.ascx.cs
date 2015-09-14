﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Spindox.AnagraficaDealer.UserControl
{
    public partial class AmministrazioneSubMenuControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
            if (Session["Amministrazione"].ToString() == "True")
            {
                utentiSubMenu.Visible = true;
                profiliSubMenu.Visible = true;
            }
            
            if (Session["Eccezioni"].ToString() == "True")
            {
                importSubMenu.Visible = true;
            }
        }
    }
}