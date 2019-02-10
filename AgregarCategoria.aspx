<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AgregarCategoria.aspx.vb" Inherits="ActulizarPlatos" %>

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
                <h2>Agregar Categorias</h2>
            </div>
        </div>
        <br />
    </div>
    <section id="content"><div class="ic"></div>
    <div class="wrapper">
        <table align="center" class="auto-style14">
            <tr>
                <td class="aligncenter">
                    <div class="aligncenter">
                        &nbsp;
                   <br/>
                    </div>
                    <table>
                        <tr>
                            <td colspan="2"><h4><a>Ingrese el nombre de la nueva categoria</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                            <td class="auto-style16"><strong>Imagen:</strong></td>

                            <td class="auto-style27">
                                <asp:Image ID="Image1" runat="server" width="250px" Height ="250px" CssClass="auto-style45"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<ajaxToolkit:AsyncFileUpload ID="AsyncFileUpload1" runat="server" 
                                    Height="31px" Width="401px" CssClass="auto-style34" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                
                            </td>
                            <td class="auto-style14">
                                &nbsp;</td>
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
                            <td class="auto-style12">&nbsp;</td>
                            <td>
                                <table class="auto-style3">
                                    <tr>
                                        <td class="auto-style13">
                    <asp:Button ID="btn_Imagen" runat="server" Text="Agregar Imagen" />
                                        </td>
                                        <td class="auto-style13">
                    <asp:Button ID="BtnGuardar" runat="server" Text="Guardar" />
                                        </td>
                                        <td>
                    <asp:Button ID="BtnLimpiar" runat="server" Text="Limpiar" />
                                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                                            </asp:ScriptManager>
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

