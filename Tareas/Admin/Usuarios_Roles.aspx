<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Usuarios_Roles.aspx.cs" Inherits="AppBase.Admin.Roles.Usuarios_Roles" %>

<%@ Register Assembly="Tareas" Namespace="Librerias" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <div class="contenidoCentrado">
         <table style="width: 80%;" class="tabla">
             <tr>
                 <td>
                     <h3>Administrar Roles por Usuario</h3> 
        <asp:Label ID="ActionStatus" runat="server" CssClass="Important"></asp:Label>
        <p>
        <b>Elija un usuario:</b>
        <asp:DropDownList ID="UserList" runat="server" AutoPostBack="True" 
            DataTextField="UserName" DataValueField="UserName" style="margin-bottom: 0px" 
                onselectedindexchanged="UserList_SelectedIndexChanged">
        </asp:DropDownList>
        </p>
        <p>
        <asp:Repeater ID="UsersRoleList" runat="server">
            <ItemTemplate>
                <asp:CheckBox runat="server" ID="RoleCheckBox" AutoPostBack="true"
                    Text='<%# Container.DataItem %>' OnCheckedChanged="RoleCheckBox_CheckChanged" />
                <br />
            </ItemTemplate> 
        </asp:Repeater>
        </p>
                 </td>
                 <td>
                     <h3>Administrar Usuarios por Roles</h3> 
            <p>      
                <b>Elegir un Rol:</b>      
                <asp:DropDownList ID="RoleList" runat="server" AutoPostBack="true" 
                    onselectedindexchanged="RoleList_SelectedIndexChanged"></asp:DropDownList> 
            </p>
            <p>      
                <asp:GridView ID="RolesUserList" runat="server" AutoGenerateColumns="False"           
                EmptyDataText="No users belong to this role." 
                    onrowdeleting="RolesUserList_RowDeleting" BackColor="White" 
                    BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                    ForeColor="Black" GridLines="Horizontal">           
                    <Columns>                
                        <asp:TemplateField HeaderText="Usuarios">                     
                            <ItemTemplate>                          
                                <asp:Label runat="server" id="UserNameLabel"                               
                                Text='<%# Container.DataItem %>'></asp:Label>                     
                            </ItemTemplate>                
                        </asp:TemplateField>          
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>      
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView> 
            </p>
        <p>      
                <p>
                    <b>Usuario:</b>      
                        <asp:TextBox ID="UserNameToAddToRole" runat="server"></asp:TextBox>      
                              
                        <asp:Button ID="AddUserToRoleButton" runat="server" Text="Agregar Usuario a Rol" 
                        onclick="AddUserToRoleButton_Click" /> 
                </p>
                
                </p>
                 </td>
                 
             </tr>
             
             
         </table>
        


        
    </div>
</asp:Content>
