using System;
using DevExpress.Web.ASPxGridView;
using System.Web.Security;
using DevExpress.Web.ASPxTabControl;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxHtmlEditor;


namespace Tareas.Tarea
{
    public partial class Default : Page
    {
        private int _detailRowVisibleIndex;
        private int _id_seguimiento;
        private int _contador_seguimientos;
        private bool _tareaInsert = true;
        private string _tarea_descripcion;



        protected void Page_Load(object sender, EventArgs e)
        {
            


            

        }


        protected void EquiposGridView_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["EquipoID2"] = (sender as ASPxGridView).GetMasterRowFieldValues("equipo_id");

        }

        protected void btnAgregarTarea_Click(object sender, EventArgs e)
        {
            TareasGridView.AddNewRow();
        }

        protected void TareasGridView_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            MembershipUser usuario = Membership.GetUser();
            string usuario_asignado;
            if (User.Identity.IsAuthenticated)
            {
                usuario_asignado = usuario.ProviderUserKey.ToString();
            }
            else
            {
                usuario_asignado = null;
            }

            e.NewValues["fk_usuario"] = usuario_asignado;
            e.NewValues["fecha_creacion"] = DateTime.Now;
        }


        protected void gridSeguimientos_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["TareaID"] = (sender as ASPxGridView).GetMasterRowKeyValue();

            DataView dv = (DataView)sqlSeguimientoCerrado.Select(DataSourceSelectArguments.Empty);

            if (dv.Count != 0)
            {
                (sender as ASPxGridView).Columns[0].Visible = false;
            }

            Session["tarea_descripcion"] = (sender as ASPxGridView).GetMasterRowFieldValues("tarea_descripcion");
            _tarea_descripcion = (sender as ASPxGridView).GetMasterRowFieldValues("tarea_descripcion").ToString();
        }

        protected void gridSeguimientos_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["fk_estado"] = (sender as ASPxGridView).GetMasterRowFieldValues("fk_estado");
            e.NewValues["fk_tarea"] = (sender as ASPxGridView).GetMasterRowKeyValue();
            e.NewValues["fecha_creacion"] = DateTime.Now;
        }

        protected void TareasGridView_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {

            // Valida la fila en edicion si no es una nueva fila
            if (!TareasGridView.IsNewRowEditing)
                TareasGridView.DoRowValidation();


        }

        protected void TareasGridView_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {
            /*
            // Checks for null values.
            foreach (GridViewColumn column in TareasGridView.Columns)
            {
                if (column.VisibleIndex != 0) { 

                    GridViewDataColumn dataColumn = column as GridViewDataColumn;
                    if (dataColumn == null) continue;
                    if (dataColumn.FieldName == "id") continue;
                    if (dataColumn.FieldName == "fk_usuario" ) continue;
                    if (dataColumn.FieldName == "fecha_modificacion") continue;
                    string html = "";
                    
                    if (dataColumn.FieldName == "tarea_descripcion")
                    {
                        ASPxHtmlEditor htmlEditor = TareasGridView.FindEditRowCellTemplateControl(dataColumn, "ASPxHtmlEditor1") as ASPxHtmlEditor;
                        if (htmlEditor.Html == "") {
                            e.Errors[dataColumn] = "La descripcion no puede estar vacia."; 
                        }
                        continue;
                    }
                
                    
                    if (e.NewValues[dataColumn.FieldName] == null)
                        e.Errors[dataColumn] = "El valor no puede ser nulo.";
                    

                }
            }

            // Displays the error row if there is at least one error.
            if (e.Errors.Count > 0) e.RowError = "Por favor llene todos los campos.";


            if (string.IsNullOrEmpty(e.RowError) && e.Errors.Count > 0)
                e.RowError = "Por favor, corrija todos los errores.";

            */

        }

        protected void gridSeguimientos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Session["TareaID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
            var fk_estado = e.NewValues["fk_estado"].ToString();

            if (fk_estado == "4")
            {
                CerrarSeguimiento(sender);
            }
        }

        protected void CerrarSeguimiento(object sender) {
      
            _tareaInsert = false;
            Session["TareaID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
            var asdasdasd = sqlCerrarTarea.Insert();
          
        }

        protected void TareasGridView_DetailRowExpandedChanged(object sender, ASPxGridViewDetailRowEventArgs e)
        {
            _detailRowVisibleIndex = e.VisibleIndex;
            ASPxPageControl tabControl = (sender as ASPxGridView).FindDetailRowTemplateControl(e.VisibleIndex, "pageTarea") as ASPxPageControl;
            Literal ltlDescripcion = tabControl.TabPages[0].FindControl("ltlDescripcion") as Literal;
            ltlDescripcion.Text = _tarea_descripcion;
            
        }




    }
}