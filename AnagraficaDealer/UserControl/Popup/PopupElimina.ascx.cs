using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using AnagraficaDealerClassLib;


namespace Spindox.AnagraficaDealer.UserControl.RagioniSocialiCorrelate
{

    public class EliminaEventArgs : EventArgs
    {
        public EliminaEventArgs(string idObject, int gridIndex)
        {
            this.IDObject = idObject;
            this.GridIndex = gridIndex;
        }

        public EliminaEventArgs(string idObject)
        {
            this.IDObject = idObject;
        }

        public EliminaEventArgs(int gridIndex)
        {
            this.GridIndex = gridIndex;
        }

        public EliminaEventArgs()
        {
            
        }

        public string IDObject { get; set; }
        public int GridIndex { get; set; }
        
    }


    public delegate void EliminaEventHandler(object sender, EliminaEventArgs e);
    //public delegate void ChiudiEventHandler(object sender, EventArgs e);

    public partial class PopupElimina : System.Web.UI.UserControl
    {
        public event EliminaEventHandler EliminaButtonClicked;
        //public event ChiudiEventHandler ChiudiButtonClicked;
        public string IDObject
        {
            get
            {
                return IDObjectHF.Value;
            }
            set
            {
                IDObjectHF.Value = value;
            }
        }
        public int GridIndex
        {
            get
            {
                int gridIndex;
                bool parsed = Int32.TryParse(GridIndexHF.Value, out gridIndex);

                if (parsed)
                    return gridIndex;
                else
                    throw new Exception("Error: The passed parameter is not an integer.");
            }
            set
            {
                GridIndexHF.Value = value.ToString();
            }
        }

        public void Show(string msg)
        {
            lblPopupMessaggio.Text = msg;
            panelPopupElimina.Update();
            mpPopupElimina.Show();

        }

        public void Show(string msg, string idObject)
        {
            lblPopupMessaggio.Text = msg;
            IDObject = idObject;

            panelPopupElimina.Update();
            mpPopupElimina.Show();

        }

        public void Show(string msg, int gridIndex)
        {
            GridIndex = gridIndex;
            lblPopupMessaggio.Text = msg;
            panelPopupElimina.Update();
            mpPopupElimina.Show();

        }

        public void Show(string msg, string idObject, int gridIndex)
        {
            GridIndex = gridIndex;
            IDObject = idObject;
            lblPopupMessaggio.Text = msg;
            panelPopupElimina.Update();
            mpPopupElimina.Show();

        }

        public void Hide()
        {
            mpPopupElimina.Hide();
        }

        protected void btnChiudi_Click(object sender, ImageClickEventArgs e)
        {

                mpPopupElimina.Hide();
    
        }

        protected void btnElimina_Click(object sender, ImageClickEventArgs e)
        {
            if (EliminaButtonClicked != null)
            {
                EliminaEventArgs args = new EliminaEventArgs(IDObject, GridIndex);

                EliminaButtonClicked(sender, args);
                mpPopupElimina.Hide();
            }
        }

    }
}