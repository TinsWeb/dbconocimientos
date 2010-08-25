using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxGridView;
using System.Web.Security;
using Librerias;
using Tareas.Librerias;
using System.Collections;
namespace Tareas.Equipo
{
    public partial class Default : System.Web.UI.Page
    {
        //private string _plainText = "Hello, World!";    // original plaintext
        private string _passPhrase = "Pas5pr@se";        // can be any string
        private string _saltValue = "oNwGaXxa3AK5MvxKsKS3";        // can be any string
        private string _hashAlgorithm = "SHA1";             // can be "MD5"
        private int _passwordIterations = 2;                  // can be any number
        private string _initVector = "oteybl@EHA6tIWyN"; // must be 16 bytes
        private int _keySize = 256;                // can be 192 or 128
        ArrayList _updateCommand = new ArrayList();

        //string[] _updateCommand = { "equipo_ip", "equipo_hostname", "equipo_ubicacion", "fk_funcion", "usuario", "pass" };

        protected void Page_Load(object sender, EventArgs e)
        {
            
            _updateCommand.Add("equipo_ip");
            _updateCommand.Add("equipo_hostname");
            _updateCommand.Add("equipo_ubicacion");
            _updateCommand.Add("fk_funcion");
            _updateCommand.Add("usuario");
            _updateCommand.Add("pass");

            


            if (!HttpContext.Current.User.IsInRole("Administradores"))
            {
                EquipoGridView.Columns[7].Visible = false;
            }

            



        }

        protected string Desencriptar(string texto)
        {
            if (texto != String.Empty)
            {
                return RijndaelSimple.Decrypt(texto,
                                                        _passPhrase,
                                                        _saltValue,
                                                        _hashAlgorithm,
                                                        _passwordIterations,
                                                        _initVector,
                                                        _keySize);
            }
            else { return null; };
        }

        protected string Encriptar(string texto) {
            if (texto != String.Empty)
            {
            return RijndaelSimple.Encrypt(texto,
                                                    _passPhrase,
                                                    _saltValue,
                                                    _hashAlgorithm,
                                                    _passwordIterations,
                                                    _initVector,
                                                    _keySize);
            }
            else { return null; };
        }
        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            EquipoGridView.AddNewRow();
        }

        protected void detailGrid_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["EquipoID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void TareaGridView_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["equipo_id"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void ServicioGridView_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["equipo_id"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void EquipoGridView_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["pass"] = Encriptar(e.NewValues["pass"].ToString());
     
        }

        protected void EquipoGridView_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {

            if (e.DataColumn.FieldName == "pass")
            {
                e.Cell.Text = Desencriptar(e.CellValue.ToString());
            };
           
        }

        protected void EquipoGridView_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            if (e.NewValues["pass"] != null)
            {
                e.NewValues["pass"] = Encriptar(e.NewValues["pass"].ToString());
            }
            else {
              _updateCommand.Remove("pass");
            }

            sqlEquipos.UpdateCommand = ConsultaSQL.construirUpdate(_updateCommand);
        }



    }
}