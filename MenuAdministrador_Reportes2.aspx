<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="MenuAdministrador_Reportes2.aspx.vb" Inherits="MenuAdministrador_Reportes2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            text-align: left;
        }
        .auto-style6 {
            width: 40%;
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
        .auto-style13 {
            background-color: #FFFFFF;
        }
        .auto-style15 {
            color: #000000;
        }
        .auto-style17 {
            text-align: right;
            width: 40%;
            color: #000000;
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
                                                             
                                <asp:Button ID="Button1" runat="server" PostBackUrl="~/MenuAdministrador_Reportes3.aspx" Text="REPORTE PLATOS" />
                            </td>
                            <td class="auto-style13" STYLE="TEXT-ALIGN: left; font-size: larger">
                            <b>REPORTE DE PERSONAS </b></td>
                        </tr>
                        <tr>
                            <td class="auto-style17">
                                                             
                                TIPO :</td>
                            <td class="auto-style19">
                                                             
                                <asp:DropDownList ID="cbopersona" runat="server" Height="20px" Width="30%" style="font-weight: 700; " DataSourceID="SqlDataSource1" DataTextField="description" DataValueField="idRol" AppendDataBoundItems="True" >
                                    <asp:ListItem>(TODOS)</asp:ListItem>
                                </asp:DropDownList>
                                                             
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=JUANERAZO;Initial Catalog=Restaurantes;Integrated Security=True" SelectCommand="SELECT [idRol], [description] FROM [tbm_Rol]"></asp:SqlDataSource>
                                                             
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style17">
                                                             
                                &nbsp;</td>
                            <td class="auto-style19">
                                                             
                                <asp:Button ID="btnBuscar" runat="server" Height="30px" style="text-align: left" Text="Consultar " Width="128px" />
                                                             
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style10">
                                                             
                                &nbsp;</td>
                            <td class="auto-style11">
                                                             
                                &nbsp;</td>
                        </tr>
                        </table>
                    
                        <asp:GridView ID="GridView3" runat="server" Width="890px" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="IdPersona" DataSourceID="SqlDataSource2">
                            <Columns>
                                <asp:BoundField DataField="IdPersona" HeaderText="ID-Persona" ReadOnly="True" SortExpression="IdPersona" />
                                <asp:BoundField DataField="Nombres" HeaderText="Nombres" SortExpression="Nombres" />
                                <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
                                <asp:BoundField DataField="CI" HeaderText="CI" SortExpression="CI" />
                                <asp:BoundField DataField="idRol" HeaderText="iD-Rol" SortExpression="idRol" />
                                <asp:BoundField DataField="description" HeaderText="Descripcion" SortExpression="description" />
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
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=JUANERAZO;Initial Catalog=Restaurantes;Integrated Security=True" SelectCommand="SELECT tbm_Personas.IdPersona, tbm_Personas.Nombres, tbm_Personas.Apellidos, tbm_Personas.CI, tbm_Personas.idRol, tbm_Rol.description FROM tbm_Personas INNER JOIN tbm_Rol ON tbm_Personas.idRol = tbm_Rol.idRol">
                        <FilterParameters>
                            <asp:ControlParameter ControlID="cbopersona" Name="parRol" PropertyName="SelectedValue" />
                        </FilterParameters>
                    </asp:SqlDataSource>
                    
                    <br />
                    <br />
                </div>
            </div>   
        </section>
    </div>


</asp:Content>

