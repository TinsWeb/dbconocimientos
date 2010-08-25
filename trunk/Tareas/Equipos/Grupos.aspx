<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Grupos.aspx.cs" Inherits="Tareas.Equipos.Grupos" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="sqlGrupos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TareasMDFLocal %>" 
        DeleteCommand="DELETE FROM [Funciones] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [Funciones] ([function_nombre]) VALUES (@function_nombre)" 
        SelectCommand="SELECT * FROM [Funciones]" 
        UpdateCommand="UPDATE [Funciones] SET [function_nombre] = @function_nombre WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="function_nombre" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="function_nombre" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlEquipos" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TareasMDFLocal %>" 
        DeleteCommand="DELETE FROM [Equipo] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [Equipo] ([equipo_ip], [equipo_hostname], [equipo_ubicacion], [fk_funcion], [usuario], [pass]) VALUES (@equipo_ip, @equipo_hostname, @equipo_ubicacion, @fk_funcion, @usuario, @pass)" 
        SelectCommand="SELECT * FROM [Equipo] WHERE fk_funcion = @fk_funcion" 
        
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
        <SelectParameters>
            <asp:SessionParameter Name="fk_funcion" SessionField="GrupoID" />
        </SelectParameters>
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

<dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
    ClientIDMode="AutoID" DataSourceID="sqlGrupos" KeyFieldName="id" 
    Width="100%" Caption="Grupos de Equipos">
    <Columns>
        <dx:GridViewCommandColumn VisibleIndex="0" Width="60px" ButtonType="Image" >
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
        <dx:GridViewDataTextColumn Caption="Nombre" FieldName="function_nombre" 
            VisibleIndex="1">
        </dx:GridViewDataTextColumn>
    </Columns>
    <SettingsEditing Mode="Inline" />
    <Settings ShowFilterRow="True" />
    <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ShowDetailRow="True" />
    <Styles>
        <TitlePanel Font-Bold="True">
        </TitlePanel>
    </Styles>
    <Templates>
        <DetailRow>
            <dx:ASPxGridView ID="gridEquipos" runat="server" AutoGenerateColumns="False" 
                ClientIDMode="AutoID" DataSourceID="sqlEquipos" KeyFieldName="id" 
                Width="100%" 
                onbeforeperformdataselect="gridEquipos_BeforePerformDataSelect">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="equipo_ip" VisibleIndex="0" 
                        Caption="Direccion IP">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="equipo_hostname" VisibleIndex="1" 
                        Caption="Nombre de Host">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="equipo_ubicacion" VisibleIndex="2" 
                        Caption="Ubicacion">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsDetail AllowOnlyOneMasterRowExpanded="True" IsDetailGrid="True" />
            </dx:ASPxGridView>
        </DetailRow>
    </Templates>
</dx:ASPxGridView>

</asp:Content>
