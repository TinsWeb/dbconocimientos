<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminUsuarios.aspx.cs" Inherits="AppBase.Admin.AdminUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <asp:Repeater ID="FilteringUI" runat="server" 
        onitemcommand="FilteringUI_ItemCommand">
     <ItemTemplate>
     <asp:LinkButton runat="server" ID="lnkFilter"
     Text='<%# Container.DataItem %>'
     CommandName='<%# Container.DataItem %>'></asp:LinkButton>
     </ItemTemplate>
     <SeparatorTemplate>|</SeparatorTemplate>
    </asp:Repeater>

    <asp:GridView ID="UserAccounts" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="UserName" HeaderText="UserName" />
            <asp:BoundField DataField="Email" HeaderText="Email" />
            <asp:CheckBoxField DataField="IsApproved" HeaderText="IsApproved" />
            <asp:CheckBoxField DataField="IsLockedOut" HeaderText="IsLockedOut" />
            <asp:CheckBoxField DataField="IsOnline" HeaderText="IsOnline" />
            <asp:BoundField DataField="Comment" HeaderText="Comment" />
        </Columns>
    </asp:GridView>
</asp:Content>
