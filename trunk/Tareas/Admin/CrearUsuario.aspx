<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CrearUsuario.aspx.cs" Inherits="AppBase.Admin.CrearUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="contenidoCentrado">
        <asp:CreateUserWizard ID="RegisterUserWithRoles" runat="server" 
            ContinueDestinationPageUrl="~/Default.aspx" LoginCreatedUser="False" 
            onactivestepchanged="RegisterUserWithRoles_ActiveStepChanged">
            <WizardSteps>           
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">           
                </asp:CreateUserWizardStep>           
            
                <asp:WizardStep ID="SpecifyRolesStep" runat="server" StepType="Step"                
                Title="Specify Roles" AllowReturn="False">   
            
                    <asp:CheckBoxList ID="RoleList" runat="server">
                    </asp:CheckBoxList>
             
                </asp:WizardStep>           
            
                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">           
                </asp:CompleteWizardStep>      
             </WizardSteps>
        </asp:CreateUserWizard>
    </div>
</asp:Content>
