<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ActulizarPlatos.aspx.vb" Inherits="ActulizarPlatos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3
        {
            width: 100%;
        }
        .auto-style7
        {
            text-align: right;
            height: 25px;
        }
        .auto-style8
        {
            height: 25px;
        }
        .auto-style9
        {
            text-align: right;
            height: 22px;
        }
        .auto-style10
        {
            height: 22px;
        }
        .auto-style11
        {
            width: 92px;
        }
        .auto-style12
        {
            width: 155px;
        }
        .auto-style13
        {
            width: 97px;
        }
        .auto-style14 {
            background-color: #F2F2F2;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row-bot">
        <div class="row-bot-bg">
            <div class="main">
                <h2>Mantenimiento de Platos</h2>
            </div>
        </div>
        <br />
    </div>
    <section id="content"><div class="ic"></div>
    <div class="wrapper">
        <table align="center" class="auto-style14">
            <tr>
                <td class="aligncenter">&nbsp;<table class="auto-style3">
                    <tr>
                        <td colspan="2"><h4><a>Buscar</a></h4></td>
                    </tr>
                    <tr>
                        <td class="auto-style11">Categorias</td>
                        <td><asp:DropDownList ID="CmbCategoria" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataTextField="Nombre" DataValueField="IdPlato">
                    <asp:ListItem Selected="True" Value="0">Seleccionar</asp:ListItem>
                    </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style11">Platos</td>
                        <td><asp:DropDownList ID="CmbPlatos" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataTextField="Nombre" DataValueField="IdPlato">
                        <asp:ListItem Selected="True" Value="0">Seleccionar</asp:ListItem>
                    </asp:DropDownList>
                        </td>
                    </tr>
                    </table>
                   <br/>
                    <table">
                        <tr>
                            <td colspan="2"><h4><a>DATOS DEL PLATO SELECCIONADO</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="LblMnesajes" runat="server"></asp:Label>
                                <asp:Label ID="LblMensaje2" runat="server"></asp:Label>
                                </h4></td>
                        </tr>
                        <tr>
                            <td class="auto-style12">Nombre</td>
                            <td>
                    <asp:TextBox ID="TxtNombre" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style12">Categoria</td>
                            <td><asp:DropDownList ID="CmbCategorias2" runat="server" DataTextField="Nombre" DataValueField="IdPlatCat">
                    </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style12">Estado</td>
                            <td>
                                <asp:DropDownList ID="CmbActivo" runat="server">
                                    <asp:ListItem Selected="True" Value="A">Activo</asp:ListItem>
                                    <asp:ListItem Value="I">Inactivo</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style12">Información</td>
                            <td>
                    <asp:TextBox ID="TxtInformacion" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style12">Precio</td>
                            <td>
                    <asp:TextBox ID="TxtPrecio" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style12">Tiempo Preparación</td>
                            <td>
                    <asp:TextBox ID="TxtTiempo" runat="server"></asp:TextBox>
                                Especificar tiempos en minutos</td>
                        </tr>
                        <tr>
                            <td class="auto-style12">&nbsp;</td>
                            <td>
                                <table class="auto-style3">
                                    <tr>
                                        <td class="auto-style13">
                    <asp:Button ID="BtnGuardar" runat="server" Text="Guardar" />
                                        </td>
                                        <td>
                    <asp:Button ID="BtnLimpiar" runat="server" Text="Limpiar" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="aligncenter">
                    &nbsp;</td>
            </tr>
        </table>
 
        <table class="auto-style3">
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style8">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9">&nbsp;</td>
                <td class="auto-style10">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="alignright">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="alignright">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="alignright">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>

 
    </div>
    </section>
</asp:Content>

