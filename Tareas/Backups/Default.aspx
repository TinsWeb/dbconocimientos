<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Tareas.Backups.Default" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="sqlBackups" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TareasMDFLocal %>" 
        DeleteCommand="DELETE FROM [Backups] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [Backups] ([backup_titulo], [fk_equipo], [fk_prioridad], [backup_descripcion], [backup_scripts], [backup_frecuencia], [backup_destino], [backup_fecha]) VALUES (@backup_titulo, @fk_equipo, @fk_prioridad, @backup_descripcion, @backup_scripts, @backup_frecuencia, @backup_destino, @backup_fecha)" 
        SelectCommand="SELECT * FROM [Backups]" 
        
    UpdateCommand="UPDATE [Backups] SET [backup_titulo] = @backup_titulo, [fk_equipo] = @fk_equipo, [fk_prioridad] = @fk_prioridad, [backup_descripcion] = @backup_descripcion, [backup_scripts] = @backup_scripts, [backup_frecuencia] = @backup_frecuencia, [backup_destino] = @backup_destino, [backup_fecha] = @backup_fecha WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="backup_titulo" Type="String" />
            <asp:Parameter Name="fk_equipo" Type="Int32" />
            <asp:Parameter Name="fk_prioridad" Type="Int32" />
            <asp:Parameter Name="backup_descripcion" Type="String" />
            <asp:Parameter Name="backup_scripts" Type="String" />
            <asp:Parameter Name="backup_frecuencia" Type="String" />
            <asp:Parameter Name="backup_destino" Type="String" />
            <asp:Parameter Name="backup_fecha" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="backup_titulo" Type="String" />
            <asp:Parameter Name="fk_equipo" Type="Int32" />
            <asp:Parameter Name="fk_prioridad" Type="Int32" />
            <asp:Parameter Name="backup_descripcion" Type="String" />
            <asp:Parameter Name="backup_scripts" Type="String" />
            <asp:Parameter Name="backup_frecuencia" Type="String" />
            <asp:Parameter Name="backup_destino" Type="String" />
            <asp:Parameter Name="backup_fecha" Type="DateTime" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlEquipos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TareasMDFLocal %>" 
        SelectCommand="SELECT [equipo_ip], [id] FROM [Equipo]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlPrioridades" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TareasMDFLocal %>" 
        SelectCommand="SELECT [prioridad_nombre], [id] FROM [Prioridades]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlBackup_Seguimiento" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TareasMDFLocal %>" 
        SelectCommand="SELECT * FROM [Backups_Seguimiento] WHERE ([fk_backup] = @fk_backup)">
        <SelectParameters>
            <asp:SessionParameter Name="fk_backup" SessionField="BackupID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <dx:ASPxGridView ID="gridBackups" runat="server" AutoGenerateColumns="False" 
        ClientIDMode="AutoID" DataSourceID="sqlBackups" KeyFieldName="id" 
        Width="100%" Caption="Listado de Backups" 
        onrowvalidating="gridBackups_RowValidating" 
        onstartrowediting="gridBackups_StartRowEditing">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0" ButtonType="Image">
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
            <dx:GridViewDataTextColumn FieldName="backup_titulo" 
                ShowInCustomizationForm="True" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="fk_equipo" 
                ShowInCustomizationForm="True" VisibleIndex="2">
                <PropertiesComboBox DataSourceID="sqlEquipos" ValueField="id" 
                    ValueType="System.Int32">
                    <Columns>
                        <dx:ListBoxColumn Caption="Nombre" FieldName="equipo_ip" />
                    </Columns>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="fk_prioridad" 
                ShowInCustomizationForm="True" VisibleIndex="3">
                <PropertiesComboBox DataSourceID="sqlPrioridades" ValueField="id" 
                    ValueType="System.Int32">
                    <Columns>
                        <dx:ListBoxColumn Caption="Nombre" FieldName="prioridad_nombre" />
                    </Columns>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="backup_descripcion" 
                ShowInCustomizationForm="True" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="backup_scripts" 
                ShowInCustomizationForm="True" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="backup_frecuencia" 
                ShowInCustomizationForm="True" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="backup_destino" 
                ShowInCustomizationForm="True" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="backup_fecha" VisibleIndex="8">
                <PropertiesDateEdit DisplayFormatString="">
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
        </Columns>
        <SettingsEditing Mode="PopupEditForm" 
            PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormModal="True" 
            PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="600px" />
        <Settings ShowFilterRow="True" />
        <SettingsDetail ShowDetailRow="True" />
        <Templates>
            <DetailRow>
                <dx:ASPxGridView ID="gridBackups_Seguimiento" runat="server" AutoGenerateColumns="False" 
                    ClientIDMode="AutoID" DataSourceID="sqlBackup_Seguimiento" 
                    KeyFieldName="id" Width="100%" 
                    
                    onbeforeperformdataselect="gridBackups_Seguimiento_BeforePerformDataSelect" 
                    Caption="Seguimientos" oninitnewrow="gridBackups_Seguimiento_InitNewRow">
                    <Columns>
                        <dx:GridViewCommandColumn VisibleIndex="0" Width="70px" ButtonType="Image">
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
                        <dx:GridViewDataDateColumn Caption="Fecha" FieldName="backup_fecha" 
                            VisibleIndex="1">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn Caption="Estado" FieldName="backup_estado" 
                            VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Check" FieldName="backup_check" 
                            VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="fk_backup" Visible="False" 
                            VisibleIndex="4">
                            <EditFormSettings Visible="True" />
                            <EditCellStyle CssClass="hidden">
                            </EditCellStyle>
                            <EditFormCaptionStyle CssClass="hidden">
                            </EditFormCaptionStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsEditing Mode="PopupEditForm" 
                        PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormModal="True" 
                        PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="600px" />
                    <Settings ShowFilterRow="True" ShowGroupPanel="True" />
                    <SettingsDetail IsDetailGrid="True" />
                </dx:ASPxGridView>
            </DetailRow>
        </Templates>
    </dx:ASPxGridView>
</asp:Content>
