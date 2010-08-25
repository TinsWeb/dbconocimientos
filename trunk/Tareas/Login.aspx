<%@ Page Title="Iniciar sesión" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="Tareas.Account.Login" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .main
        {
            padding: 0px 0px;
            /*margin: 12px 8px 8px 8px;*/
            min-height: 420px;
            background-color: #000;
        }
        .page
        {
            background-color: #000000; 
        }
        .header
        {
            background-color: #fff;
        }

        
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
 

    
    <p id="registrar">

        <asp:HyperLink ID="RegisterHyperLink" runat="server" EnableViewState="false">Registrarse</asp:HyperLink> si no tiene una cuenta.
    </p>

    <asp:Login ID="loginTareas" runat="server" Font-Names="Verdana" 
        Font-Size="0.8em" RenderOuterTable="False">
        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
        <LayoutTemplate>
           
                            <div id="loginForm">
                             <h1>Ingresar datos para iniciar sesion</h1>
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Nombre de usuario:</asp:Label>
                              
                                    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                        ControlToValidate="UserName" 
                                        ErrorMessage="El nombre de usuario es obligatorio." 
                                        ToolTip="El nombre de usuario es obligatorio." ValidationGroup="loginTareas">*</asp:RequiredFieldValidator>
        
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Contraseña:</asp:Label>

                                    <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                        ControlToValidate="Password" ErrorMessage="La contraseña es obligatoria." 
                                        ToolTip="La contraseña es obligatoria." ValidationGroup="loginTareas">*</asp:RequiredFieldValidator>
                                    
                                    <asp:CheckBox ID="RememberMe" runat="server" 
                                        Text="Recordármelo la próxima vez." TextAlign="Left" />
                                    
                                    
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                        
                                    <asp:Button ID="LoginButton" runat="server" BackColor="#FFFBFF" 
                                        BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CommandName="Login" 
                                        Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" 
                                        Text="Inicio de sesión" ValidationGroup="loginTareas" />
                        </div>
        </LayoutTemplate>
        <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" 
            BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
        <TextBoxStyle Font-Size="0.8em" />
        <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" 
            ForeColor="White" />
    </asp:Login>
    
    </asp:Content>
