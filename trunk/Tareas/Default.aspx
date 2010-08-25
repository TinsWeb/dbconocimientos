<%@ Page Title="Página principal" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Tareas._Default" %>

<%@ Register assembly="DevExpress.XtraCharts.v10.1.Web, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<%@ Register assembly="DevExpress.Web.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxRoundPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v10.1, Version=10.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:SqlDataSource ID="dsEquiposyTareas" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TareasMDFLocal %>" 
        SelectCommand="CantidadTareas_Por_Equipo" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sqlEquipos_x_Grupo" runat="server" 
        ConnectionString="<%$ ConnectionStrings:TareasMDFLocal %>" 
        SelectCommand="CantidadEquipos_Por_Grupo" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
        <div id="grid">
    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" HorizontalAlign="Center" 
        Width="100%">
        <PanelCollection>
<dx:PanelContent runat="server" SupportsDisabledAttribute="True">
    <dxchartsui:WebChartControl ID="WebChartControl1" runat="server" 
        AppearanceName="In A Fog" ClientIDMode="AutoID" DataSourceID="dsEquiposyTareas" 
        Height="200px" Width="300px">
        <diagramserializable>
            <cc1:XYDiagram>
                <axisx title-font="Tahoma, 10pt" title-text="Equipos" 
                    visibleinpanesserializable="-1">
                    <range sidemarginsenabled="True" />
<Range SideMarginsEnabled="True"></Range>
                </axisx>
                <axisy interlaced="True" title-alignment="Near" title-font="Tahoma, 10pt" 
                    title-text="Tareas Asignadas" title-visible="True" 
                    visibleinpanesserializable="-1" visible="False">
                    <range sidemarginsenabled="True" />
<Range SideMarginsEnabled="True"></Range>
                </axisy>
                <defaultpane enableaxisxscrolling="False" enableaxisxzooming="False" 
                    enableaxisyscrolling="False" enableaxisyzooming="False">
                </defaultpane>
            </cc1:XYDiagram>
        </diagramserializable>
        <fillstyle>
            <optionsserializable>
                <cc1:SolidFillOptions />
            </optionsserializable>
        </fillstyle>
        <legend>
            <fillstyle fillmode="Gradient">
                <optionsserializable>
                    <cc1:RectangleGradientFillOptions />
                </optionsserializable>
            </fillstyle>
        </legend>
        <seriesserializable>
            <cc1:Series ArgumentDataMember="equipo_ip" LegendText="Equipos" Name="Series 1" 
                SynchronizePointOptions="False" ValueDataMembersSerializable="CantidadTareas">
                <viewserializable>
                    <cc1:SideBySideBarSeriesView>
                    </cc1:SideBySideBarSeriesView>
                </viewserializable>
                <labelserializable>
                    <cc1:SideBySideBarSeriesLabel LineVisible="True">
                        <fillstyle>
                            <optionsserializable>
                                <cc1:SolidFillOptions />
                            </optionsserializable>
                        </fillstyle>
                    </cc1:SideBySideBarSeriesLabel>
                </labelserializable>
                <pointoptionsserializable>
                    <cc1:PointOptions>
                    </cc1:PointOptions>
                </pointoptionsserializable>
                <legendpointoptionsserializable>
                    <cc1:PointOptions PointView="Argument">
                    </cc1:PointOptions>
                </legendpointoptionsserializable>
            </cc1:Series>
        </seriesserializable>
        <seriestemplate>
            <viewserializable>
                <cc1:SideBySideBarSeriesView>
                </cc1:SideBySideBarSeriesView>
            </viewserializable>
            <labelserializable>
                <cc1:SideBySideBarSeriesLabel LineVisible="True">
                    <fillstyle>
                        <optionsserializable>
                            <cc1:SolidFillOptions />
                        </optionsserializable>
                    </fillstyle>
                </cc1:SideBySideBarSeriesLabel>
            </labelserializable>
            <pointoptionsserializable>
                <cc1:PointOptions>
                </cc1:PointOptions>
            </pointoptionsserializable>
            <legendpointoptionsserializable>
                <cc1:PointOptions>
                </cc1:PointOptions>
            </legendpointoptionsserializable>
        </seriestemplate>
        <titles>
            <cc1:ChartTitle Font="Tahoma, 12pt" Text="Cantidad de Tareas por Equipo" />
        </titles>
    </dxchartsui:WebChartControl>
            <dxchartsui:WebChartControl ID="WebChartControl2" runat="server" 
        ClientIDMode="AutoID" DataSourceID="sqlEquipos_x_Grupo" Height="200px" 
        Width="300px">
                <diagramserializable>
                    <cc1:XYDiagram>
                        <axisx visibleinpanesserializable="-1">
                            <range sidemarginsenabled="True" />
                        </axisx>
                        <axisy visible="False" visibleinpanesserializable="-1">
                            <range sidemarginsenabled="True" />
                        </axisy>
                        <defaultpane enableaxisxscrolling="False" enableaxisxzooming="False" 
                            enableaxisyscrolling="False" enableaxisyzooming="False">
                        </defaultpane>
                    </cc1:XYDiagram>
                </diagramserializable>
                <fillstyle>
                    <optionsserializable>
                        <cc1:SolidFillOptions />
                    </optionsserializable>
                </fillstyle>
                <seriesserializable>
                    <cc1:Series ArgumentDataMember="Grupo" LegendText="Grupos" Name="Series 1" 
                        ValueDataMembersSerializable="CantidadEquipos">
                        <viewserializable>
                            <cc1:SideBySideBarSeriesView>
                            </cc1:SideBySideBarSeriesView>
                        </viewserializable>
                        <labelserializable>
                            <cc1:SideBySideBarSeriesLabel LineVisible="True">
                                <fillstyle>
                                    <optionsserializable>
                                        <cc1:SolidFillOptions />
                                    </optionsserializable>
                                </fillstyle>
                            </cc1:SideBySideBarSeriesLabel>
                        </labelserializable>
                        <pointoptionsserializable>
                            <cc1:PointOptions>
                            </cc1:PointOptions>
                        </pointoptionsserializable>
                        <legendpointoptionsserializable>
                            <cc1:PointOptions>
                            </cc1:PointOptions>
                        </legendpointoptionsserializable>
                    </cc1:Series>
                </seriesserializable>
                <seriestemplate>
                    <viewserializable>
                        <cc1:SideBySideBarSeriesView>
                        </cc1:SideBySideBarSeriesView>
                    </viewserializable>
                    <labelserializable>
                        <cc1:SideBySideBarSeriesLabel LineVisible="True">
                            <fillstyle>
                                <optionsserializable>
                                    <cc1:SolidFillOptions />
                                </optionsserializable>
                            </fillstyle>
                        </cc1:SideBySideBarSeriesLabel>
                    </labelserializable>
                    <pointoptionsserializable>
                        <cc1:PointOptions>
                        </cc1:PointOptions>
                    </pointoptionsserializable>
                    <legendpointoptionsserializable>
                        <cc1:PointOptions>
                        </cc1:PointOptions>
                    </legendpointoptionsserializable>
                </seriestemplate>
                <titles>
                    <cc1:ChartTitle Font="Tahoma, 13pt" Text="Cantidad de Equipos por Grupos" />
                </titles>
    </dxchartsui:WebChartControl>
            </dx:PanelContent>
</PanelCollection>
    </dx:ASPxRoundPanel>
    </div>
    <br />
    <br />
    <asp:Literal ID="ltlTexto" runat="server"></asp:Literal>
    <br />
    </asp:Content>
