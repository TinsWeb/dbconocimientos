<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminRoles.aspx.cs" Inherits="AppBase.Admin.Roles.AdminRoles" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="contenidoCentrado">
    <p>
        <b>Crear nuevo Rol: </b> <asp:TextBox ID="RoleName" runat="server"></asp:TextBox>
        <asp:Button ID="CreateRoleButton" runat="server" Text="Crear nuevo Rol" onclick="CreateRoleButton_Click" />
    </p>
    <p>
    <asp:GridView ID="RoleList" runat="server" AutoGenerateColumns="False" 
        onrowdeleting="RoleList_RowDeleting" BackColor="White" BorderColor="#CCCCCC" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" 
            GridLines="Horizontal">
        <Columns> 
            <asp:TemplateField HeaderText="Roles"> 
                <ItemTemplate> 
                    <asp:Label runat="server" ID="RoleNameLabel" Text='<%# Container.DataItem %>' /> 
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField DeleteText="Eliminar Rol" ShowDeleteButton="True" />
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
    </div>
</asp:Content>
