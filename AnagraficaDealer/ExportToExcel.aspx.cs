using System.Data.SqlClient;
using System.Data;
using OfficeOpenXml;
using System.IO;
using OfficeOpenXml.Style;
using System.Drawing;
using System;
using AnagraficaDealerClassLib;
using System.Web;
using System.Xml;
using System.Reflection;
using System.Collections.Generic;
using System.Text.RegularExpressions;

namespace Spindox.AnagraficaDealer
{

    public partial class ExportToExcel : System.Web.UI.Page
    {
        private AnagraficaDealerService proxyMtd = new AnagraficaDealerService();
        private string[] colsToRemove = { "IDStato", "IDCanale", "IDRegione", "IDProvincia", "IDSegmentazioneCanale", "IDArea", "IDTipoDealer", "IDUtente" }; 
        
        protected void Page_Load(object sender, System.EventArgs e)
        {
            string queryExport = string.Empty;
            proxyMtd = new AnagraficaDealerClassLib.AnagraficaDealerService();

            HttpContext.Current.Session["User"] = (Context.User.Identity.Name.Split(new Char[] { '\\' }))[1];
            string user = HttpContext.Current.Session["User"].ToString();

            #region SOLO TEST
            //SOLO PER TEST:ELIMINARE
            //string test_queryExport = "<XML><FIELD id='IDTipoDealer' value='1' typeDb='combo' IDTipoDealer='1'/><FIELD clientid='txtDealerCode' id='Codice' value='' typeDb='text' IDTipoDealer='1'/><FIELD clientid='txtRagioneSociale' id='RagioneSociale' value='' typeDb='text' IDTipoDealer='1'/><FIELD clientid='txtPIVA' id='PIVA' value='' typeDb='text' IDTipoDealer='1'/><FIELD clientid='txtMasterDealerCode' id='MasterDealer' value='' typeDb='text' IDTipoDealer='2'/><FIELD clientid='txtLocalita' id='Localita' value='' typeDb='text' IDTipoDealer='1;2;3;5'/><FIELD clientid='txtZonaAssegnata' id='ZonaAssegnata' value='' typeDb='text' IDTipoDealer='3;4'/><FIELD clientid='txtFunzionario' id='Funzionario' value='' typeDb='text' IDTipoDealer='1;3;4;5'/><FIELD clientid='txtSupporti' id='Supporti' value='' typeDb='text' IDTipoDealer='1'/><FIELD clientid='txtCommittente' id='Cliente' value='' typeDb='text' IDTipoDealer='1'/><FIELD clientid='txtCFTitolare' id='CFTitolare' value='' typeDb='text' IDTipoDealer='1'/><FIELD clientid='txtCateneAM' id='DatiCateneAm' value='' typeDb='text' IDTipoDealer='5'/><FIELD clientid='txtCateneFunzionario' id='DatiCateneFunzionario' value='' typeDb='text' IDTipoDealer='5'/><FIELD clientid='txtInsegna' id='Insegna' value='' typeDb='text' IDTipoDealer='1'/><FIELD clientid='txtDimensioneMQ' id='DimensioneAreaVendita' value='' typeDb='text' IDTipoDealer='1'/><FIELD clientid='txtAffitto' id='ValoreAffitto' value='' typeDb='text' IDTipoDealer='1'/><FIELD clientid='txtTOTPT' id='PT' value='' typeDb='text' IDTipoDealer='1'/><FIELD clientid='txtTOTFT' id='FTE' value='' typeDb='text' IDTipoDealer='1'/><FIELD clientid='txtDataDisdetta' id='DataDisdetta' value='' typeDb='data' IDTipoDealer='2;3'/><FIELD clientid='txtDataTerminePreavviso' id='DataTerminePreavviso' value='' typeDb='data' IDTipoDealer='1'/><FIELD clientid='txtNomeContatto' id='NomeContatto' value='' typeDb='text' IDTipoDealer='1'/><FIELD id='Operativita' value='' typeDb='combo' IDTipoDealer='1'/><FIELD id='IDRegione' value='' typeDb='combo' IDTipoDealer='1;2;3;5'/><FIELD id='IDProvincia' value='' typeDb='combo' IDTipoDealer='1;2;3;5'/><FIELD id='ModelloVendita' value='' typeDb='combo' IDTipoDealer='3;4'/><FIELD id='SegmentazioneCanale' value='' typeDb='combo' IDTipoDealer='1;5'/><FIELD id='ShopInStore' value='' typeDb='combo' IDTipoDealer='5'/><FIELD id='Cluster' value='' typeDb='combo' IDTipoDealer='1'/><FIELD id='CentroAssistenzaTecnica' value='' typeDb='combo' IDTipoDealer='1'/><FIELD id='Disdetta' value='' typeDb='combo' IDTipoDealer='1;2;3;5'/><FIELD id='AreaDiCompetenza' value='' typeDb='combo' IDTipoDealer='1;5'/><FIELD id='IDStato' value='2' typeDb='combo' IDTipoDealer='1'/><FIELD id='IDCanale' value='6' typeDb='combo' IDTipoDealer='1'/><FIELD id='IDArea' value='' typeDb='combo' IDTipoDealer='1'/><FIELD id='IDAreaManager' value='' typeDb='combo' IDTipoDealer='1;3;4;5'/><RETURNFIELD value='IDDealer,Codice,Canale,RagioneSociale,Stato,Area'/><EXPORTFIELDS value='IDDealer,Codice,Canale,RagioneSociale,Stato,Area'/></XML>";
            //DataTable dt = CreateTestDT();//proxyMtd.RicercaDealer(queryExport, user);
            //queryExport = test_queryExport;
            //FINE TEST
            #endregion

            queryExport = HttpContext.Current.Session["ExportQuery"].ToString();

             XmlDocument xmlExport = new XmlDocument();
             xmlExport.LoadXml(queryExport);

             XmlDocument xmlExportTmp;

             List<DataTable> dtList = new List<DataTable>();

             string[] tipoDealer = xmlExport.SelectSingleNode("//FIELD[@id='IDTipoDealer']/@value").InnerText.Split(',');
             foreach (var dealer in tipoDealer)
             {
                 xmlExportTmp = new XmlDocument();
                 xmlExportTmp.LoadXml(queryExport);
                 XmlNodeList t = xmlExportTmp.SelectNodes("//EXPFIELD[not(contains(@IDTipoDealer,'"+dealer.ToString()+"'))]");
                 foreach (XmlNode node in t)
                 {
                     xmlExportTmp.SelectSingleNode("//EXPORTFIELDS").RemoveChild(node);
                     string tmpName = node.Attributes["id"].Value;
                     XmlNode expNode = xmlExportTmp.SelectSingleNode("//EXPFIELD[@id='" + tmpName + "']");
                     xmlExportTmp.SelectSingleNode("//EXPORTFIELDS").Attributes["value"].Value = xmlExportTmp.SelectSingleNode("//EXPORTFIELDS").Attributes["value"].Value.Replace(","+tmpName, "").Replace(",,", ",");
                 }
                 xmlExportTmp.SelectSingleNode("//RETURNFIELD").Attributes["value"].Value = xmlExportTmp.SelectSingleNode("//EXPORTFIELDS").Attributes["value"].Value;
                 xmlExportTmp.SelectSingleNode("//FIELD[@id='IDTipoDealer']").Attributes["value"].Value = dealer.ToString();
                 foreach(XmlNode f in xmlExportTmp.SelectNodes("//FIELD"))
                 {
                     f.Attributes["IDTipoDealer"].Value = dealer.ToString();
                 }
                 DataTable dt = proxyMtd.RicercaDealer(xmlExportTmp.InnerXml, user);

                 foreach (var col in colsToRemove)
                 {
                     if (dt.Columns.Contains(col.ToString()))
                     {
                         dt.Columns.Remove(col.ToString());
                     }
                 }
                 dtList.Add(dt);
             }

             xmlExport = null;
             xmlExportTmp = null;
            using (ExcelPackage pck = new ExcelPackage())
            {
                ExcelWorksheet ws;
                int i = 0;
                foreach(DataTable dt in dtList)
                {
                    string td = GetStringValue((TipoDealerDesc)Convert.ToInt32(tipoDealer[i]));
                    ws = pck.Workbook.Worksheets.Add(td);
                    ws.Cells["A1"].LoadFromDataTable(dt, true);
                    ws.Cells[1, 1, 1, dt.Columns.Count].Style.Font.Color.SetColor(System.Drawing.Color.White);
                    ws.Cells[1, 1, 1, dt.Columns.Count].Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                    ws.Cells[1, 1, 1, dt.Columns.Count].Style.Fill.BackgroundColor.SetColor(System.Drawing.Color.Red);
                    ws.Cells[ws.Dimension.Address].AutoFitColumns();
                    i++;
                }

                //Create the worksheet
                #region SOLO TEST
                //ws = pck.Workbook.Worksheets.Add("Dealer POS");
                ////Load the datatable into the sheet, starting from cell A1. Print the column names on row 1
                //ws.Cells["A1"].LoadFromDataTable(dt, true);
                ////ws.Cells[1, 1].Value = "UTENTE:";
                ////ws.Cells[1, 2].Value = Session["User"].ToString();
                //ws.Cells["A1"].Style.Font.Color.SetColor(System.Drawing.Color.White);
                //ws.Cells["A1"].Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                //ws.Cells["A1"].Style.Fill.BackgroundColor.SetColor(System.Drawing.Color.DarkGray);
                //ws.Cells["B1"].Style.Font.Color.SetColor(System.Drawing.Color.White);
                //ws.Cells["B1"].Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                //ws.Cells["B1"].Style.Fill.BackgroundColor.SetColor(System.Drawing.Color.DarkGray);

                //ws = pck.Workbook.Worksheets.Add("Dealer POS&POD");
                ////Load the datatable into the sheet, starting from cell A1. Print the column names on row 1
                //ws.Cells["A1"].LoadFromDataTable(dt, true);
                ////ws.Cells[1, 1].Value = "UTENTE:";
                ////ws.Cells[1, 2].Value = Session["User"].ToString();
                //ws.Cells["A1"].Style.Font.Color.SetColor(System.Drawing.Color.White);
                //ws.Cells["A1"].Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                //ws.Cells["A1"].Style.Fill.BackgroundColor.SetColor(System.Drawing.Color.DarkGray);
                //ws.Cells["B1"].Style.Font.Color.SetColor(System.Drawing.Color.White);
                //ws.Cells["B1"].Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                //ws.Cells["B1"].Style.Fill.BackgroundColor.SetColor(System.Drawing.Color.DarkGray);

                //ws = pck.Workbook.Worksheets.Add("Agenti Committenti");
                ////Load the datatable into the sheet, starting from cell A1. Print the column names on row 1
                //ws.Cells["A1"].LoadFromDataTable(dt, true);
                ////ws.Cells[1, 1].Value = "UTENTE:";
                ////ws.Cells[1, 2].Value = Session["User"].ToString();
                //ws.Cells["A1"].Style.Font.Color.SetColor(System.Drawing.Color.White);
                //ws.Cells["A1"].Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                //ws.Cells["A1"].Style.Fill.BackgroundColor.SetColor(System.Drawing.Color.DarkGray);
                //ws.Cells["B1"].Style.Font.Color.SetColor(System.Drawing.Color.White);
                //ws.Cells["B1"].Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                //ws.Cells["B1"].Style.Fill.BackgroundColor.SetColor(System.Drawing.Color.DarkGray);
                #endregion

                Byte[] fileBytes = pck.GetAsByteArray();
                Response.Clear();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", "attachment;filename=RicercaDealer.xlsx");
                Response.Charset = "";
                Response.ContentType = "application/vnd.ms-excel";
                StringWriter sw = new StringWriter();
                Response.BinaryWrite(fileBytes);
                Response.End();
            }
        }

        #region SOLO TEST
        //protected DataTable CreateTestDT()
        //{
        //    DataTable dtTmp = new DataTable();
        //    dtTmp.Columns.Add("TipoDealer", typeof(string));
        //    dtTmp.Columns.Add("Codice", typeof(string));
        //    dtTmp.Columns.Add("Canale", typeof(string));
        //    dtTmp.Columns.Add("RagioneSociale", typeof(string));
        //    dtTmp.Columns.Add("Stato", typeof(string));
        //    dtTmp.Columns.Add("Area", typeof(string));
        //    DataRow newRow = dtTmp.NewRow();
        //    Random rng = new Random();
        //    for (int i = 0; i < 1300; i++)
        //    {
        //        newRow = dtTmp.NewRow();
        //        newRow["TipoDealer"] = rng.Next(1,5).ToString();
        //        newRow["Codice"] = rng.Next(9999).ToString("00000") + "." + rng.Next(9999).ToString("00000");
        //        newRow["Canale"] = "I" + rng.Next(1,9).ToString("0");
        //        newRow["RagioneSociale"] = "Dealer Test " + i.ToString() + " srl";
        //        newRow["Stato"] = "Attivo";
        //        newRow["Area"] = "Nord Ovest";
        //        dtTmp.Rows.Add(newRow);
        //    }
        //    return dtTmp;
        //}

        #endregion

        public static string GetStringValue(Enum value)
        {
            string output = null;
            Type type = value.GetType();

            FieldInfo fi = type.GetField(value.ToString());
            StringValue[] attrs =
               fi.GetCustomAttributes(typeof(StringValue),
                                       false) as StringValue[];
            if (attrs.Length > 0)
            {
                output = attrs[0].Value;
            }

            return output;
        }
    }


    enum TipoDealerDesc
    {
        [StringValue("Committenti")]
        Committenti = 1,
        [StringValue("Pos&Pod")]
        PosPod = 2,
        [StringValue("PointOpen")]
        PointOpen = 3,
        [StringValue("Agenti Committenti")]
        AgentiCommittenti = 4,
        [StringValue("SubAgenti")]
        SubAgenti = 5
    }

    public class StringValue : System.Attribute
    {
        private string _value;
        public StringValue(string value)
        {
            _value = value;
        }
        public string Value
        {
            get { return _value; }
        }
    }
}