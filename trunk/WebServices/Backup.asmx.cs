using System;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Globalization;
using System.IO;

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

        private string _hostEquipo;
        private string _fechaBackup;

        /// <returns>Un DataSet con los datos de la tabla Backups</returns>
        [WebMethod]
        public string EstadoBackup(int id)
        {
            // Establecer Conexion
            using (SqlConnection con = new SqlConnection { ConnectionString = ConfigurationManager.ConnectionStrings["TareasMDFLocal"].ConnectionString })
            {
                // Abre la conexion a la base de datos
                con.Open();

                // Crea un comando SQL 
                using (SqlCommand cmd = new SqlCommand(String.Format("ObtenerHostBackup {0}", id)) { CommandType = CommandType.Text, Connection = con })
                {

                    // Lee los datos y devuelve el primero que encuentra
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        _hostEquipo = reader[0].ToString().Trim();
                        _fechaBackup = ParseSQLDate(reader[1].ToString());
                    }

                    chequearEstado(_fechaBackup,_hostEquipo);
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
                return fecha.ToString("yyyy_MM_dd");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private string _userSamba = "nchavez";
        private string _passSamba = "strato1986";
        private int _counter = 0;
        private string _line;

        private string chequearEstado(string fecha,string hostname)
        {
            Console.WriteLine(String.Format("net use \\\\10.1.9.216\\Status /user:{0} {1}", _userSamba, _passSamba));

            try
            {
                StreamReader file = new System.IO.StreamReader(String.Format("\\\\10.1.9.216\\Status\\{0}\\{1}.txt", fecha, hostname));
                /*while ((_line = file.ReadLine()) != null)
                {
                    
                }*/
                _line = file.ReadLine();
                return "la puta madre";
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
    }
}