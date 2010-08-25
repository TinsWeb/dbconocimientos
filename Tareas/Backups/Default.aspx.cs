using DevExpress.Web.ASPxGridView;
using System;
using Tareas.TareasServices;
using System.IO;
using System.Data;


namespace Tareas.Backups
{
    public partial class Default : System.Web.UI.Page
    {


        private string _hostEquipo;
        private string _fechaBackup;

        protected void Page_Load(object sender, EventArgs e)
        {
            /*using (StreamWriter sw = new StreamWriter("\\\\10.1.9.216\\Status\\asd.txt"))
            {
                // Add some text to the file.
                sw.WriteLine("I am writing in the file");
                sw.WriteLine("-------------------");
                sw.WriteLine("The date is: " + DateTime.Now);

            }*/
            
            int counter = 0;
            string line;
            
            using (Backup backupService = new Backup())
            {
                /*DataSet hostBackup = backupService.EstadoBackup(4);
                _hostEquipo = hostBackup.Tables[0].Rows[0].ToString();
                _fechaBackup = hostBackup.Tables[0].Rows[1].ToString();*/

                string hostBackup = backupService.EstadoBackup(4);
            }
            
            // Read the file and display it line by line.
            /*
            String cmdString = String.Format("net use \\\\10.1.9.216\\Status /user:{0} {1}", _userSamba, _passSamba);
            Console.WriteLine(cmdString);

            try
            {
                StreamReader file = new System.IO.StreamReader("\\\\10.1.9.216\\Status\\2010_08_07\\correo.txt");
                while ((line = file.ReadLine()) != null)
                {
                    //Console.WriteLine(line);
                    counter++;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
            */



        }

        protected void gridBackups_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {

            // Valida la fila en edicion si no es una nueva fila
            if (!gridBackups.IsNewRowEditing)
                gridBackups.DoRowValidation();
           
        }

        protected void gridBackups_RowValidating(object sender, DevExpress.Web.Data.ASPxDataValidationEventArgs e)
        {
            // Checks for null values.
            foreach (GridViewColumn column in gridBackups.Columns)
            {
                GridViewDataColumn dataColumn = column as GridViewDataColumn;
                if (dataColumn == null) continue;
                if (e.NewValues[dataColumn.FieldName] == null)
                    e.Errors[dataColumn] = "El valor no puede ser nulo.";
            }

            // Displays the error row if there is at least one error.
            if (e.Errors.Count > 0) e.RowError = "Por favor llene todos los campos.";


            if (string.IsNullOrEmpty(e.RowError) && e.Errors.Count > 0)
                e.RowError = "Por favor, corrija todos los errores.";

        }

        protected void gridBackups_Seguimiento_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["BackupID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }

        protected void gridBackups_Seguimiento_InitNewRow(object sender, DevExpress.Web.Data.ASPxDataInitNewRowEventArgs e)
        {
            e.NewValues["fk_backup"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }


    }
}