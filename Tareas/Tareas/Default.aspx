<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Tareas.Tarea.Default" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxHtmlEditor.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHtmlEditor" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxTabControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxDataView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.XtraReports.v10.1.Web, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraReports.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v10.1.Linq, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Data.Linq" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 124px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    

    <asp:SqlDataSource ID="sqlSeguimientoCerrado" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TareasMDFLocal %>" 
        SelectCommand="t_seguimiento_cerrado" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter Name="FK_ESTADO" Type="Int32" DefaultValue="4" />
            <asp:SessionParameter Name="FK_TAREA" SessionField="TareaID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    

    <asp:SqlDataSource ID="sqlDescripcionTarea" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TareasMDFLocal %>" 
        SelectCommand="SELECT [tarea_descripcion] FROM [Tarea] WHERE ([id] = @id)">
        <SelectParameters>
            <asp:SessionParameter Name="id" SessionField="TareaID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    

    <asp:SqlDataSource ID="sqlSeguimientoTarea" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TareasMDFLocal %>" 
        
        SelectCommand="SELECT seguimiento_descripcion, fecha_creacion, fecha_modificacion, id, fk_estado, fk_tarea FROM Tareas_Seguimiento WHERE (fk_tarea = @TareaID)" 
        
        
        InsertCommand="INSERT INTO Tareas_Seguimiento(seguimiento_descripcion, fk_estado, fecha_creacion, fecha_modificacion, fk_tarea) VALUES (@seguimiento_descripcion, @fk_estado, @fecha_creacion, @fecha_modifiacion, @fk_tarea)" 
        DeleteCommand="DELETE FROM Tareas_Seguimiento WHERE (id = @id)" 
        UpdateCommand="UPDATE Tareas_Seguimiento SET seguimiento_descripcion = @seguimiento_descripcion, fk_estado = @fk_estado, fecha_creacion = @fecha_creacion, fecha_modificacion = @fecha_modificacion, fk_tarea = @fk_tarea WHERE (id = @id)">
        <DeleteParameters>
            <asp:Parameter Name="id" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="seguimiento_descripcion" DbType="String"/>
            <asp:Parameter Name="fk_estado" DbType="Int16"/>
            <asp:Parameter Name="fecha_creacion" DbType="DateTime"/>
            <asp:Parameter Name="fecha_modifiacion" DbType="DateTime"/>
            <asp:SessionParameter Name="fk_tarea" DbType="Int16" SessionField="TareaID"/>
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="TareaID" SessionField="TareaID" Type="Int16"/>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="seguimiento_descripcion" />
            <asp:Parameter Name="fk_estado" />
            <asp:Parameter Name="fecha_creacion" />
            <asp:Parameter Name="fecha_modificacion" />
            <asp:Parameter Name="fk_tarea" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
    </asp:SqlDataSource>

    

    <asp:SqlDataSource ID="sqlEstados" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TareasMDFLocal %>" 
        ProviderName="<%$ ConnectionStrings:TareasMDFLocal.ProviderName %>" 
        SelectCommand="SELECT estado_nombre, estado_id FROM Estado">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlCerrarTarea" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TareasMDFLocal %>" 
        InsertCommand="UPDATE dbo.Tarea SET fk_estado=4 WHERE id=@id" 
        ProviderName="<%$ ConnectionStrings:TareasMDFLocal.ProviderName %>">
        <InsertParameters>
            <asp:SessionParameter Name="id" SessionField="TareaID" />
        </InsertParameters>
    </asp:SqlDataSource>

    

    <asp:SqlDataSource ID="sqlEquipos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TareasMDFLocal %>" 
        
        SelectCommand="SELECT [equipo_ip], [equipo_ubicacion], [equipo_hostname], [id] FROM [Equipo]">
    </asp:SqlDataSource>

    

    <asp:SqlDataSource ID="sqlTareas" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TareasMDFLocal %>" 
        DeleteCommand="DELETE FROM [Tarea] WHERE [id] = @id" 
        SelectCommand="SELECT * FROM [Tarea] WHERE [fk_estado] <> 4" 
        InsertCommand="INSERT INTO [Tarea] ([tarea_titulo], [tarea_prioridad], [equipo_id], [fk_usuario_asignado], [fk_usuario], [fk_estado], [tarea_descripcion], [fecha_creacion], [fecha_modificacion]) VALUES (@tarea_titulo, @tarea_prioridad, @equipo_id, @fk_usuario_asignado, @fk_usuario, @fk_estado, @tarea_descripcion, @fecha_creacion, @fecha_modificacion)" 
        UpdateCommand="UPDATE [Tarea] SET [tarea_titulo] = @tarea_titulo, [tarea_prioridad] = @tarea_prioridad, [equipo_id] = @equipo_id, [fk_usuario_asignado] = @fk_usuario_asignado, [fk_usuario] = @fk_usuario, [fk_estado] = @fk_estado, [tarea_descripcion] = @tarea_descripcion, [fecha_creacion] = @fecha_creacion, [fecha_modificacion] = @fecha_modificacion WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="tarea_titulo" Type="String" />
            <asp:Parameter Name="tarea_prioridad" Type="String" />
            <asp:Parameter Name="equipo_id" Type="Int32" />
            <asp:Parameter DbType="Guid" Name="fk_usuario_asignado" />
            <asp:Parameter DbType="Guid" Name="fk_usuario" />
            <asp:Parameter Name="fk_estado" Type="Int32" />
            <asp:Parameter Name="tarea_descripcion" Type="String" />
            <asp:Parameter Name="fecha_creacion" Type="DateTime" />
            <asp:Parameter Name="fecha_modificacion" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="tarea_titulo" Type="String" />
            <asp:Parameter Name="tarea_prioridad" Type="String" />
            <asp:Parameter Name="equipo_id" Type="Int32" />
            <asp:Parameter DbType="Guid" Name="fk_usuario_asignado" />
            <asp:Parameter DbType="Guid" Name="fk_usuario" />
            <asp:Parameter Name="fk_estado" Type="Int32" />
            <asp:Parameter Name="tarea_descripcion" Type="String" />
            <asp:Parameter Name="fecha_creacion" Type="DateTime" />
            <asp:Parameter Name="fecha_modificacion" Type="DateTime" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    

    <asp:SqlDataSource ID="sqlUsuarios" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TareasMDFLocal %>" 
        SelectCommand="SELECT [UserName], [UserId] FROM [vw_aspnet_Users]">
    </asp:SqlDataSource>

    

    <asp:SqlDataSource ID="sqlGrupos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TareasMDFLocal %>" 
        SelectCommand="SELECT [function_nombre], [id] FROM [Funciones]">
    </asp:SqlDataSource>


    <dx:ASPxGridView ID="TareasGridView" runat="server" AutoGenerateColumns="False" 
        ClientIDMode="AutoID" DataSourceID="sqlTareas" Width="100%" 
        KeyFieldName="id"
            onrowvalidating="TareasGridView_RowValidating" 
            onstartrowediting="TareasGridView_StartRowEditing" 
            Caption="Listado de Tareas" 
            ondetailrowexpandedchanged="TareasGridView_DetailRowExpandedChanged" 
            oninitnewrow="TareasGridView_InitNewRow">
        <Columns>
            <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0" 
                ButtonType="Image" Width="80px" ShowSelectCheckbox="True">
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
                <ClearFilterButton Visible="True">
                </ClearFilterButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" 
                VisibleIndex="1" ShowInCustomizationForm="True" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="tarea_titulo" 
                VisibleIndex="1" ShowInCustomizationForm="True" Caption="Titulo">
                <PropertiesTextEdit>
                    <ValidationSettings CausesValidation="True">
                        <RequiredField ErrorText="El valor no puede ser nulo" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Prioridad" FieldName="tarea_prioridad" 
                VisibleIndex="2" Width="50px" ReadOnly="false">
                <PropertiesComboBox ValueType="System.String" EnableIncrementalFiltering="True" 
                    IncrementalFilteringMode="StartsWith" >
                    <Items>
                        <dx:ListEditItem Text="Baja" Value="Baja" />
                        <dx:ListEditItem Text="Media" Value="Media" />
                        <dx:ListEditItem Text="Alta" Value="Alta" />
                    </Items>
                    <ValidationSettings CausesValidation="True">
                        <RequiredField ErrorText="El valor no puede ser nulo" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>
                
                <Settings AllowAutoFilter="True" AllowAutoFilterTextInputTimer="True" 
                    FilterMode="DisplayText" />
                
<Settings FilterMode="DisplayText" AllowAutoFilterTextInputTimer="True" AllowAutoFilter="True"></Settings>
                
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Estado" FieldName="fk_estado" 
                VisibleIndex="4" Width="80px">
                <PropertiesComboBox DataSourceID="sqlEstados" 
                    ValueField="estado_id" ValueType="System.String" 
                    EnableIncrementalFiltering="True" IncrementalFilteringMode="StartsWith">
                    <Columns>
                        <dx:ListBoxColumn Caption="Nombre" FieldName="estado_nombre" />
                    </Columns>
                    <ValidationSettings CausesValidation="True">
                        <RequiredField ErrorText="El valor no puede ser nulo" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="equipo_id" 
                ShowInCustomizationForm="True" VisibleIndex="3" Caption="Equipo" 
                ToolTip="Equipo asociado de dicha Tarea.">
                <PropertiesComboBox DataSourceID="sqlEquipos" 
                    ValueType="System.String" ValueField="id" DisplayFormatInEditMode="True" 
                    EnableIncrementalFiltering="True" IncrementalFilteringMode="StartsWith">
                    <Columns>
                        <dx:ListBoxColumn FieldName="equipo_ip" Caption="Equipo" />
                    </Columns>
                    <ValidationSettings CausesValidation="True">
                        <RequiredField ErrorText="El valor no puede ser nulo" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Usuario Asignado" 
                FieldName="fk_usuario_asignado" VisibleIndex="5" Width="100px">
                <PropertiesComboBox ValueType="System.String" 
                    DataSourceID="sqlUsuarios" ValueField="UserId" 
                    EnableIncrementalFiltering="True" IncrementalFilteringMode="StartsWith">
                    <Columns>
                        <dx:ListBoxColumn FieldName="UserName" Name="Usuario" />
                    </Columns>
                    <ValidationSettings CausesValidation="True">
                        <RequiredField ErrorText="El valor no puede ser nulo" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Creado por" FieldName="fk_usuario" 
                VisibleIndex="6" Width="100px">
                <PropertiesComboBox DataSourceID="sqlUsuarios" ValueField="UserID" 
                    ValueType="System.String" EnableIncrementalFiltering="True" 
                    IncrementalFilteringMode="StartsWith">
                    <Columns>
                        <dx:ListBoxColumn FieldName="UserName" />
                    </Columns>
                </PropertiesComboBox>
                <EditCellStyle CssClass="hidden">
                </EditCellStyle>
                <EditFormCaptionStyle CssClass="hidden">
                </EditFormCaptionStyle>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataDateColumn Caption="Fecha Creacion" FieldName="fecha_creacion" 
                VisibleIndex="7">
                <PropertiesDateEdit DisplayFormatString="" EditFormat="DateTime">
                <ValidationSettings CausesValidation="True">
                        <RequiredField ErrorText="El valor no puede ser nulo" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn Caption="Fecha Modificacion" 
                FieldName="fecha_modificacion" VisibleIndex="8">
                <PropertiesDateEdit DisplayFormatString="">
                </PropertiesDateEdit>
                <EditFormSettings Visible="False" />

<EditFormSettings Visible="False"></EditFormSettings>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataMemoColumn Caption="Descripcion" FieldName="tarea_descripcion" 
                Visible="False" VisibleIndex="7">

                <EditFormSettings ColumnSpan="3" Visible="True" RowSpan="5"></EditFormSettings>
                <PropertiesMemoEdit Rows="6" Height="500px">
                    <ValidationSettings CausesValidation="True">
                        <RequiredField ErrorText="El valor no puede ser nulo" IsRequired="True" />
                    </ValidationSettings>
                </PropertiesMemoEdit>
                <EditFormSettings ColumnSpan="3" Visible="True" />

                <EditItemTemplate>
                    <dx:ASPxHtmlEditor ID="ASPxHtmlEditor1" runat="server" ClientIDMode="AutoID" 
                        Html='<%# Bind("tarea_descripcion") %>' Width="100%" Height="300px">
                        <Settings AllowHtmlView="False" AllowPreview="False" />
                        <SettingsImageUpload UploadImageFolder="~/Imagenes/Subidas/">
                        </SettingsImageUpload>
                    </dx:ASPxHtmlEditor>
                </EditItemTemplate>
                
            </dx:GridViewDataMemoColumn>
        </Columns>
        <SettingsBehavior AllowFocusedRow="True" />
        <SettingsEditing Mode="PopupEditForm" PopupEditFormModal="True" 
            PopupEditFormWidth="100%" PopupEditFormHorizontalAlign="WindowCenter" 
            PopupEditFormVerticalAlign="WindowCenter" />
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
        <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ShowDetailRow="True" />

<SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>

<SettingsEditing Mode="PopupEditForm" PopupEditFormWidth="600px" 
            PopupEditFormHorizontalAlign="WindowCenter" 
            PopupEditFormVerticalAlign="WindowCenter" PopupEditFormModal="True"></SettingsEditing>

<Settings ShowFilterRow="True" ShowGroupPanel="True"></Settings>

<SettingsDetail ShowDetailRow="True" AllowOnlyOneMasterRowExpanded="True"></SettingsDetail>

        <Styles>
            <PopupEditFormWindowContent>
                <Paddings Padding="20px" />
<Paddings Padding="20px"></Paddings>
            </PopupEditFormWindowContent>
            <FocusedRow BackColor="#E9E9E9" ForeColor="#333333">
            </FocusedRow>
        </Styles>
        <Templates>
            <DetailRow>
                <br />
                <dx:ASPxPageControl ID="pageTarea" runat="server" ActiveTabIndex="0" 
                    ClientIDMode="AutoID" Width="100%">
                    <TabPages>
                        <dx:TabPage Name="tabDescripcion" Text="Descripcion">
                            <ContentCollection>
                                <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                    <h2>Descripcion: </h2>
                                    <asp:Literal ID="ltlDescripcion" runat="server"></asp:Literal>
                                    
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Text="Seguimientos">
                            <ContentCollection>
                                <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                    <dx:ASPxGridView ID="gridSeguimientos" runat="server" 
                                        AutoGenerateColumns="False" ClientIDMode="AutoID" 
                                        DataSourceID="sqlSeguimientoTarea" 
                                        OnBeforePerformDataSelect="gridSeguimientos_BeforePerformDataSelect" 
                                        Width="100%" OnInitNewRow="gridSeguimientos_InitNewRow" 
                                        OnRowInserting="gridSeguimientos_RowInserting" 
                                        KeyFieldName="id">
                                        <Columns>
                                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                                                <EditButton Visible="True">
                                                </EditButton>
                                                <NewButton Visible="True">
                                                </NewButton>
                                                <DeleteButton Visible="True">
                                                </DeleteButton>
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn FieldName="seguimiento_descripcion" 
                                                ShowInCustomizationForm="True" VisibleIndex="1" Caption="Descripcion" 
                                                Visible="False">
                                                <EditFormSettings Visible="True" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataDateColumn FieldName="fecha_creacion" 
                                                ShowInCustomizationForm="True" VisibleIndex="1">
                                            </dx:GridViewDataDateColumn>
                                            <dx:GridViewDataDateColumn FieldName="fecha_modificacion" 
                                                ShowInCustomizationForm="True" VisibleIndex="2">
                                            </dx:GridViewDataDateColumn>
                                            <dx:GridViewDataTextColumn FieldName="id" 
                                                ShowInCustomizationForm="True" VisibleIndex="4" ReadOnly="True" 
                                                Visible="False">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataComboBoxColumn FieldName="fk_estado" 
                                                ShowInCustomizationForm="True" VisibleIndex="3">
                                                <PropertiesComboBox DataSourceID="sqlEstados" ValueField="estado_id" 
                                                    ValueType="System.String"><Columns><dx:ListBoxColumn Caption="Nombre" FieldName="estado_nombre" /></Columns></PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                            <dx:GridViewDataTextColumn FieldName="fk_tarea" 
                                                ShowInCustomizationForm="True" VisibleIndex="6" Visible="False">
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
                                        <Settings ShowPreview="True" ShowGroupPanel="True" ShowFilterRow="True" />
                                        <SettingsDetail IsDetailGrid="True" />
                                        <Templates>
                                            
                                        <PreviewRow>
                                                     <h3>Descripcion</h3>
                                                     <table style="border:none">
                                                     <tbody>
                                                     <tr>
                         
                                                         <td style="border:none;"><%# Eval("seguimiento_descripcion") %></td>
                                                     </tr>
                                                     </tbody>
                                                 </table>

                                            </PreviewRow>
                                            
                                        </Templates>
                                    </dx:ASPxGridView>
                                </dx:ContentControl>
                            </ContentCollection>
                        </dx:TabPage>
                        <dx:TabPage Text="Equipo">
                            <ContentCollection>
                                <dx:ContentControl runat="server" SupportsDisabledAttribute="False">
                                    <dx:ASPxGridView ID="EquiposGridView" runat="server" 
                                        AutoGenerateColumns="False" ClientIDMode="AutoID" 
                                        DataSourceID="sqlEquipos" KeyFieldName="id" 
                                        OnBeforePerformDataSelect="EquiposGridView_BeforePerformDataSelect" 
                                        Width="100%">
                                        <Columns>
                                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn Caption="Direccion IP" FieldName="equipo_ip" 
                                                ShowInCustomizationForm="True" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Nombre de Host" FieldName="equipo_hostname" 
                                                ShowInCustomizationForm="True" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Ubicacion" FieldName="equipo_ubicacion" 
                                                ShowInCustomizationForm="True" VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataComboBoxColumn Caption="Grupo" FieldName="fk_funcion" 
                                                ShowInCustomizationForm="True" VisibleIndex="4">
                                                <PropertiesComboBox DataSourceID="sqlGrupos" ValueField="id" 
                                                    ValueType="System.String"><Columns><dx:ListBoxColumn Caption="Nombre" FieldName="function_nombre" /></Columns></PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                        </Columns>
                                        <SettingsPager Visible="False">
                                        </SettingsPager>
                                        <Settings ShowColumnHeaders="False" />
                                        <Templates>
                                            <DataRow>
                                                <table class="templateTable" style="width:100%;">
                                                    <tr>
                                                        <td class="style1">
                                                            Direccion IP</td>
                                                        <td>
                                                            <%# Eval("equipo_ip") %>
                                                        </td>
                                                        <td>Ubicacion</td>
                                                        <td><%# Eval("equipo_ubicacion") %></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style1">
                                                            Nomnbre de Host</td>
                                                        <td>
                                                            <%# Eval("equipo_hostname") %>
                                                        </td>
                                                        <td>
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style1">
                                                            &nbsp;</td>
                                                        <td>
                                                            &nbsp;</td>
                                                        <td>
                                                            &nbsp;</td>
                                                    </tr>
                                                </table>
                                            </DataRow>
                                        </Templates>
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

    
</asp:Content>
