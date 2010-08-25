using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Globalization;

namespace WebServices
{
    /// <summary>
    /// Descripción breve de Service1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio Web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    [System.Web.Script.Services.ScriptService]
    public class Backup : System.Web.Services.WebService
    {

        private DataSet _ds = new DataSet();

        private DataTable _tabla;
        private DataRow _dr;
        private DataColumn _columnaHost;
        private DataColumn _columnaFecha;

        // ASDASDASDASD
        /// <returns>Un DataSet con los datos de la tabla Backups</returns>
        [WebMethod]
        public DataSet EstadoBackup(int id)
        {
            // Establecer Conexion
            using (SqlConnection con = new SqlConnection { ConnectionString = ConfigurationManager.ConnectionStrings["TareasMDFLocal"].ConnectionString })
            {
                // Abre la conexion a la base de datos
                con.Open();

                // Crea un comando SQL 
                using (SqlCommand cmd = new SqlCommand(String.Format("ObtenerHostBackup {0}", id)) { CommandType = CommandType.Text, Connection = con })
                {
                    _tabla = new DataTable();
                    _columnaHost = new DataColumn("HostName", Type.GetType("System.String"));
                    _columnaFecha = new DataColumn("Fecha", Type.GetType("System.String"));

                    _tabla.Columns.Add(_columnaHost);
                    _tabla.Columns.Add(_columnaFecha);
                    // Lee los datos y devuelve el primero que encuentra
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        _dr = _tabla.NewRow();
                        _dr["HostName"] = reader[0].ToString().Trim();

                        _dr["Fecha"] = ParseSQLDate(reader[1].ToString());

                        _tabla.Rows.Add(_dr);

                        _ds.Tables.Add(_tabla);
                     
                    }

                    return _ds;
                }
                // Cierra la conexion
                con.Close();
            }
            // Si no encuentra nada devuelve null
            return null;
            
        }


        private string ParseSQLDate(string _fecha)
        {
            try
            {

                DateTime fecha = DateTime.Parse(_fecha);
                return fecha.ToString("yyyy_dd_MM");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}