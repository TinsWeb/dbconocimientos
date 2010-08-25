<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Tareas.Equipo.Default" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxTabControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    

    <asp:SqlDataSource ID="sqlEquipos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TareasMDFLocal %>" 
        SelectCommand="SELECT * FROM [Equipo]" 
        DeleteCommand="DELETE FROM [Equipo] WHERE [id] = @id" 
        
        
        InsertCommand="INSERT INTO [Equipo] ([equipo_ip], [equipo_hostname], [equipo_ubicacion], [fk_funcion], [usuario], [pass]) VALUES (@equipo_ip, @equipo_hostname, @equipo_ubicacion, @fk_funcion, @usuario, @pass)" 
        UpdateCommand="UPDATE [Equipo] SET [equipo_ip] = @equipo_ip, [equipo_hostname] = @equipo_hostname, [equipo_ubicacion] = @equipo_ubicacion, [fk_funcion] = @fk_funcion, [usuario] = @usuario, [pass] = @pass WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="equipo_ip" Type="String" />
            <asp:Parameter Name="equipo_hostname" Type="String" />
            <asp:Parameter Name="equipo_ubicacion" Type="String" />
            <asp:Parameter Name="fk_funcion" Type="Int32" />
            <asp:Parameter Name="usuario" Type="String" />
            <asp:Parameter Name="pass" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="equipo_ip" Type="String" />
            <asp:Parameter Name="equipo_hostname" Type="String" />
            <asp:Parameter Name="equipo_ubicacion" Type="String" />
            <asp:Parameter Name="fk_funcion" Type="Int32" />
            <asp:Parameter Name="usuario" Type="String" />
            <asp:Parameter Name="pass" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    

    <asp:SqlDataSource ID="sqlTareas" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TareasMDFLocal %>" 
        InsertCommand="INSERT INTO [Tarea] ([tarea_titulo], [tarea_prioridad], [equipo_id], [fk_usuario_asignado], [fk_usuario], [fk_estado], [tarea_descripcion], [fecha_creacion], [fecha_modificacion]) VALUES (@tarea_titulo, @tarea_prioridad, @equipo_id, @fk_usuario_asignado, @fk_usuario, @fk_estado, @tarea_descripcion, @fecha_creacion, @fecha_modificacion)" 
        SelectCommand="SELECT * FROM [Tarea]" 
        DeleteCommand="DELETE FROM [Tarea] WHERE [id] = @id" 
        UpdateCommand="UPDATE [Tarea] SET [tarea_titulo] = @tarea_titulo, [tarea_prioridad] = @tarea_prioridad, [equipo_id] = @equipo_id, [fk_usuario_asignado] = @fk_usuario_asignado, [fk_usuario] = @fk_usuario, [fk_estado] = @fk_estado, [tarea_descripcion] = @tarea_descripcion, [fecha_creacion] = @fecha_creacion, [fecha_modificacion] = @fecha_modificacion WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="tarea_titulo" Type="String" />
            <asp:Parameter Name="tarea_prioridad" Type="String" />
            <asp:Parameter Name="equipo_id" Type="Int32" />
            <asp:Parameter Name="fk_usuario_asignado" Type="Object" />
            <asp:Parameter Name="fk_usuario" Type="Object" />
            <asp:Parameter Name="fk_estado" Type="Int32" />
            <asp:Parameter Name="tarea_descripcion" Type="String" />
            <asp:Parameter Name="fecha_creacion" Type="DateTime" />
            <asp:Parameter Name="fecha_modificacion" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="tarea_titulo" Type="String" />
            <asp:Parameter Name="tarea_prioridad" Type="String" />
            <asp:Parameter Name="equipo_id" Type="Int32" />
            <asp:Parameter Name="fk_usuario_asignado" Type="Object" />
            <asp:Parameter Name="fk_usuario" Type="Object" />
            <asp:Parameter Name="fk_estado" Type="Int32" />
            <asp:Parameter Name="tarea_descripcion" Type="String" />
            <asp:Parameter Name="fecha_creacion" Type="DateTime" />
            <asp:Parameter Name="fecha_modificacion" Type="DateTime" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    

    <asp:SqlDataSource ID="sqlGrupos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TareasMDFLocal %>" 
        SelectCommand="SELECT [function_nombre], [id] FROM [Funciones]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlServicios" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TareasMDFLocal %>" 
        SelectCommand="SELECT [equipo_id], [servicio_nombre] FROM [Servicio] WHERE ([id] = @id)">
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="EquipoID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    

        <dx:ASPxGridView ID="EquipoGridView" runat="server" AutoGenerateColumns="False" 
        ClientIDMode="AutoID" DataSourceID="sqlEquipos" KeyFieldName="id" 
        style="text-align: center" Width="100%" 
            onhtmldatacellprepared="EquipoGridView_HtmlDataCellPrepared" 
            onrowinserting="EquipoGridView_RowInserting" 
            onrowupdating="EquipoGridView_RowUpdating">
        <TotalSummary>
            <dx:ASPxSummaryItem DisplayFormat="Total:" />
        </TotalSummary>
        <Columns>
            <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0" ButtonType="Image" Width="80px">
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
            <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" 
                ShowInCustomizationForm="False" VisibleIndex="1" Visible="False">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="equipo_ip" VisibleIndex="1" 
                Caption="Direccion IP">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="equipo_hostname" VisibleIndex="2" 
                Caption="Hostname">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="equipo_ubicacion" VisibleIndex="3" 
                Caption="Ubicacion">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Grupo" FieldName="fk_funcion" 
                GroupIndex="0" ShowInCustomizationForm="True" SortIndex="0" 
                SortOrder="Ascending" VisibleIndex="4">
                <PropertiesComboBox DataSourceID="sqlGrupos" ValueField="id" 
                    ValueType="System.String">
                    <Columns>
                        <dx:ListBoxColumn Caption="Nombre" FieldName="function_nombre" />
                    </Columns>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn Caption="Usuario" FieldName="usuario" 
                ShowInCustomizationForm="True" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Contraseña" FieldName="pass" 
                ShowInCustomizationForm="True" VisibleIndex="6">
                <PropertiesTextEdit Password="True">
                </PropertiesTextEdit>
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
        </Columns>
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsEditing Mode="PopupEditForm" 
                PopupEditFormHorizontalAlign="WindowCenter" PopupEditFormModal="True" 
                PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="600px" />
            <Settings ShowGroupPanel="True" ShowFilterRow="True" 
                ShowGroupFooter="VisibleIfExpanded" />
            <SettingsText ConfirmDelete="Se van a eliminar las tareas y servicios asociados. Esta seguro?" />
            <SettingsLoadingPanel Text="Cargando&amp;hellip;" />
        <SettingsDetail ShowDetailRow="True" AllowOnlyOneMasterRowExpanded="True" />
        <Templates>
            <DetailRow>
                <br />
                <dx:ASPxPageControl ID="tabDetails" runat="server" ActiveTabIndex="1" 
                    ClientIDMode="AutoID" LoadingPanelText="Cargando&amp;hellip;" 
                    Width="100%">
                    <TabPages>
                        <dx:TabPage Name="tabTareas" Text="Tareas">
                            <ContentCollection>
                                <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxGridView ID="TareaGridView" runat="server" AutoGenerateColumns="False" 
                                        ClientIDMode="AutoID" DataSourceID="sqlTareas" KeyFieldName="id" 
                                        OnBeforePerformDataSelect="detailGrid_BeforePerformDataSelect" 
                                        style="margin-top: 0px" Width="100%" 
                                        OnInitNewRow="TareaGridView_InitNewRow">
                                        <Columns>
                                            <dx:GridViewCommandColumn ButtonType="Image" ShowInCustomizationForm="True" VisibleIndex="0" 
                                                Width="80px">
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
                                            <dx:GridViewDataTextColumn Caption="ID" FieldName="id" ReadOnly="True" 
                                                ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Titulo" FieldName="tarea_titulo" 
                                                ShowInCustomizationForm="True" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Prioridad" FieldName="tarea_prioridad" 
                                                ShowInCustomizationForm="True" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="equipo_id" ShowInCustomizationForm="False" 
                                                Visible="False" VisibleIndex="4">
                                                
                                                
                                                <EditFormSettings Visible="True"  />
                                                
                                                <EditCellStyle CssClass="hidden">
                                                </EditCellStyle>
                                                
                                                <EditFormCaptionStyle CssClass="hidden">
                                                </EditFormCaptionStyle>
                                                
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsBehavior ConfirmDelete="True" />
                                        <SettingsEditing Mode="EditForm" PopupEditFormHeight="200px" 
                                            PopupEditFormModal="True" PopupEditFormWidth="400px" />
                                        <SettingsText CommandCancel="Cancelar" CommandUpdate="Actualizar" />
                                        <SettingsLoadingPanel Text="Cargando&amp;hellip;" />
                                        <SettingsDetail AllowOnlyOneMasterRowExpanded="True" IsDetailGrid="True" />
                                        
                                    </dx:ASPxGridView>
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Name="tabServicios" Text="Servicios">
                            <ContentCollection>
                                <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxGridView ID="ServicioGridView" runat="server" 
                                        AutoGenerateColumns="False" ClientIDMode="AutoID" 
                                        DataSourceID="sqlServicios" KeyFieldName="id" Width="100%" 
                                        OnInitNewRow="ServicioGridView_InitNewRow">
                                        <Columns>
                                            <dx:GridViewCommandColumn ButtonType="Image" ShowInCustomizationForm="True" VisibleIndex="0" 
                                                Width="80px">
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
                                            <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" 
                                                ShowInCustomizationForm="True" VisibleIndex="1" Caption="Id" 
                                                Visible="False">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="servicio_nombre" 
                                                ShowInCustomizationForm="True" VisibleIndex="1" Caption="Nombre">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="equipo_id" ShowInCustomizationForm="True" 
                                                VisibleIndex="3" Caption="Equipo" Visible="False">
                                                <EditFormSettings Visible="True" />
                                                <EditCellStyle CssClass="hidden">
                                                </EditCellStyle>
                                                <EditFormCaptionStyle CssClass="hidden">
                                                </EditFormCaptionStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:ASPxGridView>
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                    </TabPages>
                </dx:ASPxPageControl>
                <br />
            </DetailRow>
        </Templates>
    </dx:ASPxGridView>

    <br />
</asp:Content>
