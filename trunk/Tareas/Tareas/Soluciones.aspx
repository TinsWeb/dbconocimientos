<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Soluciones.aspx.cs" Inherits="Tareas.Tareas.Soluciones" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxLoadingPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHeadline" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxRoundPanel" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="sqlSoluciones" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TareasMDFLocal %>" 
        SelectCommand="t_listar_soluciones" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqlSeguimientos" runat="server" 
    ConnectionString="<%$ ConnectionStrings:TareasMDFLocal %>" 
    SelectCommand="SELECT seguimiento_descripcion, fk_estado, fecha_creacion, fecha_modificacion, id FROM Tareas_Seguimiento WHERE (fk_tarea = @TareaID)">
        <SelectParameters>
            <asp:SessionParameter Name="TareaID" SessionField="TareaID" />
        </SelectParameters>
</asp:SqlDataSource>
 

    <dx:ASPxGridView runat="server" KeyFieldName="id" AutoGenerateColumns="False" Caption="Soluciones (Tareas Cerradas)" DataSourceID="sqlSoluciones" Width="100%" ClientIDMode="AutoID" ID="gridSoluciones"><Columns>
<dx:GridViewDataTextColumn FieldName="tarea_titulo" ShowInCustomizationForm="True" Caption="Tarea" VisibleIndex="0"></dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="tarea_descripcion" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
<EditFormSettings Visible="True"></EditFormSettings>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="tarea_id" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
<EditFormSettings Visible="False"></EditFormSettings>
</dx:GridViewDataTextColumn>
</Columns>

<Settings ShowPreview="True"></Settings>

<SettingsDetail ShowDetailRow="True" AllowOnlyOneMasterRowExpanded="True"></SettingsDetail>

<Templates><DetailRow>
                <dx:ASPxGridView ID="gridSeguimientos" runat="server" 
                    AutoGenerateColumns="False" ClientIDMode="AutoID" 
                    DataSourceID="sqlSeguimientos" KeyFieldName="id" 
                    onbeforeperformdataselect="gridSeguimientos_BeforePerformDataSelect" 
                    Width="100%">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="seguimiento_descripcion" VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="fk_estado" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="fecha_creacion" VisibleIndex="2">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataDateColumn FieldName="fecha_modificacion" VisibleIndex="3">
                        </dx:GridViewDataDateColumn>
                    </Columns>
                    <Settings ShowColumnHeaders="False" />
                    <SettingsDetail IsDetailGrid="True" />
                    <Templates>
                        <DataRow>
                            <div style="padding:5px">
                                <table class="templateTable">
                                    <tr>
                                        <td rowspan="4" style="width:100px">
                                            <%# Eval("seguimiento_descripcion") %>
                                        </td>
                                        <td class="caption" style="width:100px">
                                            <strong>Fecha Creacion</strong></td>
                                        <td style="width:100px">
                                            <%# Eval("fecha_creacion") %>
                                        </td>
                                        <td class="caption" style="width:100px">
                                            <strong>Fecha Modificacion</strong></td>
                                        <td style="width:100px">
                                            <%# Eval("fecha_modificacion")%>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </DataRow>
                    </Templates>
                </dx:ASPxGridView>
            
</DetailRow>
<PreviewRow>
                <h3>
                    Descripcion</h3>
                <table style="border:none">
                    <tbody>
                        <tr>
                            <td style="border:none;">
                                <%# Eval("tarea_descripcion") %>
                            </td>
                        </tr>
                    </tbody>
                </table>
            
</PreviewRow>
</Templates>
</dx:ASPxGridView>

</asp:Content>
