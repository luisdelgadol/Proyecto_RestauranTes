<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="MenuAdministrador_Reportes1.aspx.vb" Inherits="MenuAdministrador_Reportes1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            text-align: left;
        }
        .auto-style6 {
            width: 40%;
            background-color: #FFFFFF;
        }
        .auto-style8 {
            text-align: left;
            width: 40%;
            font-size: 13px;
            line-height: 25px;
            margin: 0 auto;
            padding: 0;
            background-color: #FFFFFF;
        }
        .auto-style10 {
            text-align: right;
            width: 40%;
            color: #000000;
            background-color: #FFFFFF;
        }
        .auto-style11 {
            text-align: left;
            width: 87%;
            font-size: 13px;
            line-height: 25px;
            margin: 0 auto;
            padding: 0;
            background-color: #FFFFFF;
        }
        .auto-style12 {
            width: 100px;
            background-color: #FFFFFF;
        }
        .auto-style13 {
            background-color: #FFFFFF;
        }
        .auto-style14 {
            width: 100px;
            color: #000000;
            background-color: #FFFFFF;
        }
        .auto-style15 {
            color: #000000;
        }
        .auto-style16 {
            text-align: right;
            width: 40%;
            color: #000000;
        }
        .auto-style17 {
            text-align: right;
            width: 40%;
            color: #000000;
            background-color: #FFFFFF;
            height: 25px;
        }
        .auto-style18 {
            width: 100px;
            background-color: #FFFFFF;
            height: 25px;
        }
        .auto-style19 {
            text-align: left;
            width: 87%;
            font-size: 13px;
            line-height: 25px;
            margin: 0 auto;
            padding: 0;
            background-color: #FFFFFF;
            height: 25px;
        }
        .auto-style20 {
            margin-bottom: 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div>
        <div class="row-bot">
        	<div class="row-bot-bg">
            	<div class="main">
                	<h2>&nbsp;Menu Administrador</h2>
                </div>
            </div>
        </div>
        
        <section id="content"><div class="ic"></div>
            <div class="main2">
                <div>
                    <table style="width:100%;color: #0000FF;background-color: #CCFFFF;">
                        <tr class="auto-style15">
                            <td class="auto-style6">
                                                             
                                &nbsp;</td>
                            <td class="auto-style12">
                                                             
                                &nbsp;</td>
                            <td class="auto-style13" STYLE="TEXT-ALIGN: left; font-size: larger">
                            <b>REPORTE DE VENTAS</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Button1" runat="server" PostBackUrl="~/MenuAdministrador_Reportes2.aspx" Text="REPORTE PERSONAS" Width="180px" />
&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style17">
                                                             
                                CATEGORIA:</td>
                            <td class="auto-style18">
                                                             
                                </span></td>
                            <td class="auto-style19">
                                                             
                                <asp:DropDownList ID="cboTipo" runat="server" Height="20px" Width="30%" style="font-weight: 700; " AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Nombre" DataValueField="IdPlatCat" >
                                    <asp:ListItem></asp:ListItem>
                                </asp:DropDownList>
                                                             
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=JUANERAZO;Initial Catalog=Restaurantes;Integrated Security=True" SelectCommand="SELECT [Nombre], [IdPlatCat] FROM [tbm_Platos_Categoria]"></asp:SqlDataSource>
                                                             
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style17">
                                                             
                                PLATO<span class="auto-style15">:</td>
                            <td class="auto-style18">
                                                             
                                </span></td>
                            <td class="auto-style19">
                                                             
                                <asp:DropDownList ID="cboChef" runat="server" Height="20px" Width="30%" style="font-weight: 700; " DataSourceID="SqlDataSource1" DataTextField="Nombre" DataValueField="IdPlato" >
                                    <asp:ListItem></asp:ListItem>
                                </asp:DropDownList>
                                                             
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=JUANERAZO;Initial Catalog=Restaurantes;Integrated Security=True" SelectCommand="SELECT [Nombre], [IdPlatCat], [IdPlato] FROM [tbm_Platos] WHERE ([IdPlatCat] = @IdPlatCat)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="cboTipo" DefaultValue="" Name="IdPlatCat" PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                                             
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style10">
                                                             
                                INICIO:&nbsp;</td>
                            <td class="auto-style12">
                                                             
                            </td>
                            <td class="auto-style11">
                                                             
                                <asp:TextBox ID="txInicio" runat="server" Width="31%" BorderColor="Black" style="font-weight: 700; " ></asp:TextBox>
                                                             
                                <asp:ImageButton ID="cal1" runat="server" Height="16px" ImageUrl="~/images/calendario.png" ToolTip="Abrir calendario" />
                                <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" ShowGridLines="True" Width="220px">
                                    <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                                    <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                                    <OtherMonthDayStyle ForeColor="#CC9966" />
                                    <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                                    <SelectorStyle BackColor="#FFCC66" />
                                    <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                                    <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                                </asp:Calendar>
                                                             
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style16">
                                                             
                                FINAL:</td>
                            <td class="auto-style12">
                                                             
                                </td>
                            <td class="auto-style11">
                                                             
                                <asp:TextBox ID="txFinal" runat="server" Width="31%" BorderColor="Black" style="font-weight: 700; " ></asp:TextBox>
                                                             
                                <asp:ImageButton ID="cal2" runat="server" ImageUrl="~/images/calendario.png" AlternateText="Ver" Height="16px" ToolTip="Abrir calendario" />
                                <asp:Calendar ID="Calendar2" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" ShowGridLines="True" Width="220px">
                                    <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                                    <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                                    <OtherMonthDayStyle ForeColor="#CC9966" />
                                    <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                                    <SelectorStyle BackColor="#FFCC66" />
                                    <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                                    <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                                </asp:Calendar>
                                                             
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style8">
                                                             
                                &nbsp;</td>
                            <td class="auto-style14">
                                                             
                                &nbsp;</td>
                            <td class="auto-style13">
                                                             
                                <asp:Button ID="btnBuscar" runat="server" Height="30px" style="text-align: left" Text="Consultar todos " Width="128px" />
                                                             
                            </td>
                        </tr>
                    </table>
                    
                    <br />
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                    <asp:Panel ID="CABECERA" runat="server">
                        TABLA&nbsp;&nbsp;&nbsp;
                        <asp:Image ID="ARROWS" runat="server" ImageUrl="~/images/uparrow.jpg" />
                    </asp:Panel>
                    <asp:Panel ID="DATOS" runat="server">
                        <asp:GridView ID="GridView2" runat="server" Width="100%" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" AutoGenerateColumns="False" DataKeyNames="IdOrden" DataSourceID="SqlDataSource4" AllowPaging="True" AllowSorting="True" CssClass="auto-style20">
                            <Columns>
                                <asp:BoundField DataField="IdOrden" HeaderText="IdOrden" ReadOnly="True" SortExpression="IdOrden" />
                                <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                                <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
                                <asp:BoundField DataField="Nombres" HeaderText="Nombres" SortExpression="Nombres" />
                                <asp:BoundField DataField="Expr1" HeaderText="Expr1" SortExpression="Expr1" />
                                <asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente" />
                            </Columns>
                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FFF1D4" />
                            <SortedAscendingHeaderStyle BackColor="#B95C30" />
                            <SortedDescendingCellStyle BackColor="#F1E5CE" />
                            <SortedDescendingHeaderStyle BackColor="#93451F" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="Data Source=JUANERAZO;Initial Catalog=Restaurantes;Integrated Security=True" SelectCommand="SELECT a1.IdOrden, a1.Fecha, a1.Total, a3.Nombres, a4.Nombre AS Expr1, a1.Cliente FROM tbm_Ordenes AS a1 INNER JOIN tbm_Empleados AS a2 ON a1.IdEmpleado = a2.IdEmpleado INNER JOIN tbm_Personas AS a3 ON a2.IdPersona = a3.IdPersona INNER JOIN tbm_Sucursales AS a4 ON a1.IdSucursal = a4.IdSucursal"></asp:SqlDataSource>
                        <asp:GridView ID="GridView1" runat="server" Width="100%" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" AutoGenerateColumns="False" DataKeyNames="IdOrden" DataSourceID="SqlDataSource3" AllowPaging="True" AllowSorting="True">
                            <Columns>
                                <asp:BoundField DataField="IdOrden" HeaderText="IdOrden" ReadOnly="True" SortExpression="IdOrden" />
                                <asp:BoundField DataField="Cliente" HeaderText="Cliente" SortExpression="Cliente" />
                                <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
                                <asp:BoundField DataField="Fecha" HeaderText="Fecha" SortExpression="Fecha" />
                                <asp:BoundField DataField="Expr1" HeaderText="Sucursal" SortExpression="Expr1" />
                                <asp:BoundField DataField="Nombres" HeaderText="Usuario que atendio" SortExpression="Nombres" />
                            </Columns>
                            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FFF1D4" />
                            <SortedAscendingHeaderStyle BackColor="#B95C30" />
                            <SortedDescendingCellStyle BackColor="#F1E5CE" />
                            <SortedDescendingHeaderStyle BackColor="#93451F" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="Data Source=JUANERAZO;Initial Catalog=Restaurantes;Integrated Security=True" SelectCommand="SELECT a1.IdOrden, a1.Fecha, a1.Total, a3.Nombres, a4.Nombre AS Expr1, a1.Cliente FROM tbm_Ordenes AS a1 INNER JOIN tbm_Empleados AS a2 ON a1.IdEmpleado = a2.IdEmpleado INNER JOIN tbm_Personas AS a3 ON a2.IdPersona = a3.IdPersona INNER JOIN tbm_Sucursales AS a4 ON a1.IdSucursal = a4.IdSucursal INNER JOIN tbm_Orden_Detalle AS a5 ON a1.IdOrden = a5.IdOrden WHERE (a1.Fecha &gt;= @Fecha) AND (a1.Fecha &lt;= @Fecha2) AND (a5.IdPlato = @plato)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txInicio" DbType="Date" Name="Fecha" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txFinal" DbType="Date" Name="Fecha2" PropertyName="Text" />
                                <asp:ControlParameter ControlID="cboChef" Name="plato" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </asp:Panel>
                    <ajaxToolkit:CollapsiblePanelExtender ID="DATOS_CollapsiblePanelExtender" runat="server" BehaviorID="DATOS_CollapsiblePanelExtender" CollapseControlID="CABECERA" TargetControlID="DATOS" ExpandControlID="CABECERA" CollapsedImage="~/images/uparrow.jpg" ExpandedImage="~/images/downarrow.jpg" ImageControlID="ARROWS" CollapsedText="MOSTRAR DATOS" ExpandedText="RETRAER DATOS" />
                    <br />
                </div>
            </div>   
        </section>
    </div>


</asp:Content>

