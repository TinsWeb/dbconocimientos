<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Estados.aspx.cs" Inherits="Tareas.Tareas.Estadosç" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="sqlEquipos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TareasMDFLocal %>" 
        SelectCommand="SELECT [equipo_ip], [id] FROM [Equipo]">
    
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sqlTareas" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TareasMDFLocal %>" 
        SelectCommand="SELECT * FROM [Tarea] WHERE ([fk_estado] = @fk_estado)">
        <SelectParameters>
            <asp:SessionParameter Name="fk_estado" SessionField="EstadoID" Type="Int16" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="sqlEstados" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TareasMDFLocal %>" 
        DeleteCommand="DELETE FROM [Estado] WHERE [estado_id] = @estado_id" 
        InsertCommand="INSERT INTO [Estado] ([estado_nombre]) VALUES (@estado_nombre)" 
        SelectCommand="SELECT * FROM [Estado]" 
        UpdateCommand="UPDATE [Estado] SET [estado_nombre] = @estado_nombre WHERE [estado_id] = @estado_id">
        <DeleteParameters>
            <asp:Parameter Name="estado_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="estado_nombre" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="estado_nombre" Type="String" />
            <asp:Parameter Name="estado_id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlUsuarios" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TareasMDFLocal %>" 
        SelectCommand="SELECT [UserId], [UserName] FROM [vw_aspnet_Users]">
    </asp:SqlDataSource>

    <dx:ASPxGridView ID="gridEstados" runat="server" AutoGenerateColumns="False" 
        ClientIDMode="AutoID" DataSourceID="sqlEstados" KeyFieldName="estado_id" 
        Width="100%">
        <Columns>
            <dx:GridViewDataTextColumn Caption="Nombre" FieldName="estado_nombre" 
                VisibleIndex="0">
            </dx:GridViewDataTextColumn>
        </Columns>
        <SettingsDetail ShowDetailRow="True" />
        <Templates>
            <DetailRow>
                <dx:ASPxGridView ID="gridTareas" runat="server" AutoGenerateColumns="False" 
                    ClientIDMode="AutoID" DataSourceID="sqlTareas" KeyFieldName="id" 
                    Width="100%" 
                    onbeforeperformdataselect="gridTareas_BeforePerformDataSelect">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="tarea_titulo" VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="tarea_prioridad" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn FieldName="equipo_id" VisibleIndex="2">
                            <PropertiesComboBox DataSourceID="sqlEquipos" ValueField="id" 
                                ValueType="System.String">
                                <Columns>
                                    <dx:ListBoxColumn Caption="Direccion IP" FieldName="equipo_ip" />
                                </Columns>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataComboBoxColumn FieldName="fk_usuario_asignado" VisibleIndex="3">
                            <PropertiesComboBox DataSourceID="sqlUsuarios" ValueField="UserId" 
                                ValueType="System.String">
                                <Columns>
                                    <dx:ListBoxColumn Caption="Nombre" FieldName="UserName" />
                                </Columns>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataComboBoxColumn FieldName="fk_usuario" VisibleIndex="4">
                            <PropertiesComboBox DataSourceID="sqlUsuarios" ValueField="UserId" 
                                ValueType="System.String">
                                <Columns>
                                    <dx:ListBoxColumn Caption="Nombre" FieldName="UserName" />
                                </Columns>
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataTextColumn FieldName="tarea_descripcion" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="fecha_creacion" VisibleIndex="6">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataDateColumn FieldName="fecha_modificacion" VisibleIndex="7">
                        </dx:GridViewDataDateColumn>
                    </Columns>
                    <SettingsDetail IsDetailGrid="True" />
                </dx:ASPxGridView>
            </DetailRow>
        </Templates>
    </dx:ASPxGridView>

</asp:Content>
