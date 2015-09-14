using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Collections;
using System.Globalization;
using System.Dynamic;

namespace AnagraficaDealerClassLib
{

    public class SqlOperations : IDisposable
    {
        private SqlConnection con;
        private string connectionString;
        private string errorMessage = string.Empty;
        public string databaseConnection
        {
            set { connectionString = value; }
        }


        public void OpenConnection()
        {
            if (con == null)
            {
                con = new SqlConnection(connectionString);
                con.Open();
            }
        }
        public void CloseConnection()
        {
            if (con != null && con.State != ConnectionState.Closed)
            {
                con.Close();
            }
        }

        public string ExecuteProcedure(SqlCommandObject SQLobj, out DataTable dt)
        {
            dt = new DataTable();
            try
            {
                OpenConnection();
                SqlCommand cmd = new SqlCommand(SQLobj.SPName, con);
                if (SQLobj.SPParams != null)
                {
                    foreach (DbParameter dbParameter in SQLobj.SPParams)
                    {
                        SqlParameter parameter = new SqlParameter();
                        parameter.ParameterName = "@" + dbParameter.ParameterName;
                        parameter.DbType = dbParameter.DbType;
                        //parameter.Size = dbParameter.Size; //serve?
                        parameter.Direction = dbParameter.Direction;
                        parameter.Value = dbParameter.Value;
                        cmd.Parameters.Add(parameter);
                    }
                }
                cmd.CommandType = CommandType.StoredProcedure;

                #region DataReader
                SqlDataReader rdr = cmd.ExecuteReader();

                if (rdr.HasRows)
                {
                    dt.Load(rdr);
                }

                #endregion
            }
            catch (Exception ex)
            {
                errorMessage = String.Format(CultureInfo.CurrentCulture,
                                      "Exception Type: {0}, Message: {1}{2}",
                                      ex.GetType(),
                                      ex.Message,
                                      ex.InnerException == null ? String.Empty :
                                      String.Format(CultureInfo.CurrentCulture,
                                                   " InnerException Type: {0}, Message: {1}",
                                                   ex.InnerException.GetType(),
                                                   ex.InnerException.Message));
                dt = null;
                
            }
            CloseConnection();
            return errorMessage;
        }


        public string ExecuteProcedure(SqlCommandObject SQLobj, out DataTable dt, out List<ExpandoObject> paramOutList)
        {
            dt = new DataTable();
            dynamic paramOut = new ExpandoObject();
            paramOutList = new List<ExpandoObject>();
            try
            {
                OpenConnection();
                SqlCommand cmd = new SqlCommand(SQLobj.SPName, con);

                if (SQLobj.SPParams != null)
                {
                    foreach (DbParameter dbParameter in SQLobj.SPParams)
                    {
                        SqlParameter parameter = new SqlParameter();
                        parameter.ParameterName = "@" + dbParameter.ParameterName;
                        parameter.DbType = dbParameter.DbType;
                        //parameter.Size = dbParameter.Size; //serve?
                        if (dbParameter.Direction == ParameterDirection.Output)
                        {
                            paramOut.Nome = "@" + dbParameter.ParameterName;
                            paramOutList.Add(paramOut);
                        }
                        parameter.Direction = dbParameter.Direction;
                        parameter.Value = dbParameter.Value;
                        cmd.Parameters.Add(parameter);
                    }
                }
                cmd.CommandType = CommandType.StoredProcedure;

                #region DataReader
                SqlDataReader rdr = cmd.ExecuteReader();

                if (rdr.HasRows)
                {
                    dt.Load(rdr);
                }
                rdr.Close();

                foreach (dynamic eop in paramOutList)
                {
                    eop.Value = cmd.Parameters[eop.Nome].Value;
                }

                #endregion
            }
            catch (Exception ex)
            {
                errorMessage = String.Format(CultureInfo.CurrentCulture,
                                      "Exception Type: {0}, Message: {1}{2}",
                                      ex.GetType(),
                                      ex.Message,
                                      ex.InnerException == null ? String.Empty :
                                      String.Format(CultureInfo.CurrentCulture,
                                                   " InnerException Type: {0}, Message: {1}",
                                                   ex.InnerException.GetType(),
                                                   ex.InnerException.Message));
                dt = null;

            }
            CloseConnection();
            return errorMessage;
        }





        public void Dispose()
        {
            CloseConnection();
        }

    }

    public class SqlCommandObject
    {
        public string SPName;
        public DbParameter[] SPParams;
    }

}
