using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
namespace AppBase.Admin
{
    public partial class CrearUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)      {           
                // Reference the SpecifyRolesStep WizardStep           
                WizardStep SpecifyRolesStep = RegisterUserWithRoles.FindControl("SpecifyRolesStep") as WizardStep;  
                
                
                // Reference the RoleList CheckBoxList           
                
                CheckBoxList RoleList = SpecifyRolesStep.FindControl("RoleList") as CheckBoxList;           
                
                // Bind the set of roles to RoleList           

                RoleList.DataSource = System.Web.Security.Roles.GetAllRoles();           
                RoleList.DataBind();      
            } 
        }

        protected void RegisterUserWithRoles_ActiveStepChanged(object sender, EventArgs e)
        {
            // Have we JUST reached the Complete step?      

            if (RegisterUserWithRoles.ActiveStep.Title == "Completar")      
            {           
                // Reference the SpecifyRolesStep WizardStep           
                
                WizardStep SpecifyRolesStep = RegisterUserWithRoles.FindControl("SpecifyRolesStep") as WizardStep;           
                
                // Reference the RoleList CheckBoxList           
                
                CheckBoxList RoleList = SpecifyRolesStep.FindControl("RoleList") as CheckBoxList;           
                
                // Add the checked roles to the just-added user           
                
                foreach (ListItem li in RoleList.Items)           
                {                
                    if (li.Selected)                     
                        System.Web.Security.Roles.AddUserToRole(RegisterUserWithRoles.UserName, li.Text);           
                }      
            } 
        }
    }
}