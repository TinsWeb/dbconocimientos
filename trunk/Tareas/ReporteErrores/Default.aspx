<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Tareas.ReporteErrores.Default" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="sqlReportes" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TareasMDFLocal %>" 
        SelectCommand="SELECT id, reporte_asunto, reporte_descripcion, fk_estado, fecha_creacion, fk_usuario FROM Reporte_Errores" 
        
        UpdateCommand="UPDATE Reporte_Errores SET reporte_asunto = @reporte_asunto, reporte_descripcion = @reporte_descripcion, fk_estado = @fk_estado, fecha_creacion = @fecha_creacion, fk_usuario = @fk_usuario WHERE id = @id" 
        DeleteCommand="DELETE FROM Reporte_Errores WHERE (id = @id)" 
        InsertCommand="INSERT INTO Reporte_Errores(reporte_asunto, reporte_descripcion, fk_estado, fecha_creacion, fk_usuario) VALUES (@reporte_asunto, @reporte_descripcion, @fk_estado, @fecha_creacion, @fk_usuario)">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlEstados" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TareasMDFLocal %>" 
        SelectCommand="SELECT [estado_nombre], [estado_id] FROM [Estado]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlUsuarios" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TareasMDFLocal %>" 
        SelectCommand="SELECT [UserId], [UserName] FROM [vw_aspnet_Users]">
    </asp:SqlDataSource>

    <dx:ASPxGridView ID="gridReportes" runat="server" AutoGenerateColumns="False" 
        ClientIDMode="AutoID" DataSourceID="sqlReportes" KeyFieldName="id" 
        PreviewFieldName="reporte_descripcion" Width="100%" 
        oninitnewrow="gridReportes_InitNewRow" Caption="Reporte de Errores" 
        KeyboardSupport="True" SummaryText="asdasd">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Image" Width="90px">
                <EditButton Visible="True">
                    <Image AlternateText="Editar" ToolTip="Editar" Url="~/Imagenes/ico/pencil.png">
                    </Image>
                </EditButton>
                <NewButton Visible="True">
                    <Image AlternateText="Nuevo" ToolTip="Nuevo" Url="~/Imagenes/ico/add.png">
                    </Image>
                </NewButton>
                <DeleteButton Visible="True">
                    <Image AlternateText="Eliminar" ToolTip="Eliminar" 
                        Url="~/Imagenes/ico/delete.png">
                    </Image>
                </DeleteButton>
                <CancelButton>
                    <Image AlternateText="Cancelar" ToolTip="Cancelar" 
                        Url="~/Imagenes/ico/remove-icon.png">
                    </Image>
                </CancelButton>
                <UpdateButton>
                    <Image AlternateText="Actualizar" ToolTip="Actualizar" 
                        Url="~/Imagenes/ico/accept-icon.png">
                    </Image>
                </UpdateButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="Asunto" FieldName="reporte_asunto" 
                VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Estado" FieldName="fk_estado" 
                VisibleIndex="2">
                <PropertiesComboBox DataSourceID="sqlEstados" ValueField="estado_id" 
                    ValueType="System.String">
                    <Columns>
                        <dx:ListBoxColumn Caption="Nombre" FieldName="estado_nombre" />
                    </Columns>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataDateColumn Caption="Fecha de Creacion" 
                FieldName="fecha_creacion" VisibleIndex="3">
                <PropertiesDateEdit EditFormat="DateTime">
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataComboBoxColumn Caption="Usuario" FieldName="fk_usuario" 
                VisibleIndex="4" ReadOnly="True">
                <PropertiesComboBox DataSourceID="sqlUsuarios" ValueField="UserId" 
                    ValueType="System.String">
                    <Columns>
                        <dx:ListBoxColumn Caption="Nombre" FieldName="UserName" />
                    </Columns>
                </PropertiesComboBox>
                <EditCellStyle CssClass="hidden">
                </EditCellStyle>
                <EditFormCaptionStyle CssClass="hidden">
                </EditFormCaptionStyle>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataMemoColumn Caption="Descripcion" 
                FieldName="reporte_descripcion" VisibleIndex="5" Visible="False">
                <PropertiesMemoEdit Rows="6">
                </PropertiesMemoEdit>
                <EditFormSettings Visible="True" ColumnSpan="3" />
            </dx:GridViewDataMemoColumn>
        </Columns>
        <SettingsBehavior ColumnResizeMode="Control" />
        <SettingsPager Mode="ShowAllRecords">
        </SettingsPager>
        <SettingsEditing Mode="PopupEditForm" 
            PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormModal="True" 
            PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="600px" />
        <Settings ShowFilterRow="True" ShowGroupPanel="True" ShowPreview="True" />
        <Templates>
            <PreviewRow>
               <h3>Descripcion</h3>
                                                     <table style="border:none">
                                                     <tbody>
                                                     <tr>
                         
                                                         <td style="border:none;"><%# Eval("reporte_descripcion") %></td>
                                                     </tr>
                                                     </tbody>
                                                 </table>
            </PreviewRow>
        </Templates>
    </dx:ASPxGridView>

</asp:Content>
