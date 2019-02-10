<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ConsulClientes.aspx.vb" Inherits="ConsulClientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row-bot">
        <div class="row-bot-bg">
            <div class="main">
                <h2>Consultar Clientes Activos</h2>
            </div>
        </div>
        <br />
    </div>
    <section id="content" class="aligncenter">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" CellSpacing="2" HorizontalAlign="Center">
    <Columns>
        <asp:BoundField DataField="IdPersona" HeaderText="IdPersona" SortExpression="IdPersona" >
        <HeaderStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="FechaIngreso" HeaderText="FechaIngreso" SortExpression="FechaIngreso" DataFormatString="{0:yyyy-MM-dd}" />
        <asp:BoundField DataField="Nombres" HeaderText="Nombres" SortExpression="Nombres" />
        <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" SortExpression="Apellidos" />
        <asp:BoundField DataField="FechaNacimiento" HeaderText="FechaNacimiento" SortExpression="FechaNacimiento" DataFormatString="{0:yyyy-MM-dd}" />
        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" >
        <HeaderStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="Estado" HeaderText="Estado" SortExpression="Estado" />
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

    </section>
    
    
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=DESKTOP-BC8EDH5\SQLEXPRESS;Initial Catalog=Restaurantes;Integrated Security=True"  SelectCommand="SELECT tbm_Clientes.IdPersona, tbm_Clientes.FechaIngreso, tbm_Personas.Nombres, tbm_Personas.Apellidos, tbm_Personas.FechaNacimiento, tbm_Personas.Email, tbm_Personas.Estado FROM tbm_Clientes INNER JOIN tbm_Personas ON tbm_Clientes.IdPersona = tbm_Personas.IdPersona"></asp:SqlDataSource>
</asp:Content>

