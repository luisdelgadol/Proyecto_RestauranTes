<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="MenuAdministrador_Reportes0.aspx.vb" Inherits="MenuAdministrador_Reportes0" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 227px;
        }
        .auto-style6 {
            text-align: left;
            height: 25px;
            background-color: #FFFFFF;
        }
        .auto-style13 {
            text-align: left;
            height: 63px;
            background-color: #FFFFFF;
        }
        .auto-style16 {
            text-align: left;
            height: 63px;
            width: 329px;
            background-color: #FFFFFF;
        }
        .auto-style17 {
            text-align: left;
            height: 25px;
            width: 329px;
            background-color: #FFFFFF;
        }
        .auto-style21 {
            text-align: right;
            height: 25px;
            font-weight: bold;
            left: 0px;
            top: 0px;
            width: 43%;
            font-size: small;
            color: #000000;
            background-color: #FFFFFF;
        }
        .auto-style22 {
            width: 43%;
            text-align: right;
            font-weight: bold;
            font-size: small;
            color: #000000;
            background-color: #FFFFFF;
        }
        .auto-style23 {
            width: 43%;
            text-align: right;
            height: 63px;
            font-weight: bold;
            left: 0px;
            top: 0px;
            font-size: small;
            color: #000000;
            background-color: #FFFFFF;
        }
        .auto-style24 {
            width: 43%;
            padding: 0;
            margin: 0 auto;
            font-size: 13px;
            line-height: 25px;
            text-align: right;
            background-color: #FFFFFF;
        }
        .auto-style25 {
            width: 329px;
            background-color: #FFFFFF;
        }
        .auto-style26 {
            text-align: left;
            width: 329px;
            background-color: #FFFFFF;
        }
        .auto-style27 {
            text-align: center;
            font-weight: bold;
            font-size: medium;
            color: #000000;
            background-color: #FFFFFF;
        }
        .auto-style28 {
            background-color: #FFFFFF;
        }
        .auto-style29 {
            text-align: center;
            background-color: #FFFFFF;
        }
        .auto-style30 {
            border: 3px outset #000000;
        }
    .auto-style31 {
        border: 1px solid #000000;
    }
    .auto-style32 {
        text-align: left;
        width: 18px;
        background-color: #FFFFFF;
    }
    .auto-style33 {
        text-align: left;
        height: 63px;
        width: 18px;
        background-color: #FFFFFF;
    }
    .auto-style34 {
        text-align: left;
        height: 25px;
        width: 18px;
        background-color: #FFFFFF;
    }
    .auto-style35 {
        width: 18px;
        background-color: #FFFFFF;
    }
    .auto-style36 {
        width: 43%;
        padding: 0;
        margin: 0 auto;
        font-size: 13px;
        line-height: 25px;
        text-align: right;
        background-color: #FFFFFF;
        height: 18px;
    }
    .auto-style37 {
        width: 18px;
        background-color: #FFFFFF;
        height: 18px;
    }
    .auto-style38 {
        width: 329px;
        background-color: #FFFFFF;
        height: 18px;
    }
    .auto-style39 {
        background-color: #FFFFFF;
        height: 18px;
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
                    <table style="width:100%;color: #0000FF;background-color: #CCFFFF;" class="auto-style30">
                        <tr>
                            <td class="auto-style27" colspan="4">
                                                             
                            <b>REPORTE DE INDICADORES CHEFS</b>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style22">
                                                             
                                CHEF:</td>
                            <td class="auto-style32">
                                                             
                                &nbsp;</td>
                            <td class="auto-style26">
                                                             
                                <asp:DropDownList ID="cboChef" runat="server" Height="20px" Width="30%" style="font-weight: 700; " CssClass="auto-style31" >
                                </asp:DropDownList>
                                                             
                            </td>
                            <td class="auto-style29">
                                                             
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style22">
                                                             
                                TIPO:</td>
                            <td class="auto-style32">
                                                             
                                &nbsp;</td>
                            <td class="auto-style26">
                                                             
                                <asp:DropDownList ID="cboTipo" runat="server" Height="20px" Width="30%" style="font-weight: 700; " CssClass="auto-style31" >
                                    <asp:ListItem>(Todos)</asp:ListItem>
                                    <asp:ListItem>Diario</asp:ListItem>
                                    <asp:ListItem>Mensual</asp:ListItem>
                                    <asp:ListItem>Anual</asp:ListItem>
                                </asp:DropDownList>
                                                             
                            </td>
                            <td class="auto-style29">
                                                             
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style23">
                                                             
                                INICIO:</td>
                            <td class="auto-style33">
                                                             
                                &nbsp;</td>
                            <td class="auto-style16">
                                                             
                                <asp:TextBox ID="txInicio" runat="server" Width="50%" BorderColor="Black" style="font-weight: 700; " CssClass="auto-style31" ></asp:TextBox>
                                                             
                            </td>
                            <td class="auto-style13">
                                                             
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style21">
                                                             
                                FINAL:</td>
                            <td class="auto-style34">
                                                             
                                &nbsp;</td>
                            <td class="auto-style17">
                                                             
                                <asp:TextBox ID="txFinal" runat="server" Width="50%" BorderColor="Black" style="font-weight: 700; " CssClass="auto-style31" ></asp:TextBox>
                                                             
                            </td>
                            <td class="auto-style6">
                                                             
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style24">
                                                             
                            </td>
                            <td class="auto-style35">
                                                             
                                &nbsp;</td>
                            <td class="auto-style25">
                                                             
                                <asp:Button ID="btnBuscar" runat="server" Height="30px" style="text-align: left" Text="Concultar" Width="128px" />
                                                             
                            </td>
                            <td class="auto-style28">
                                                             
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style36">
                                                             
                            </td>
                            <td class="auto-style37">
                                                             
                            </td>
                            <td class="auto-style38">
                                                             
                            </td>
                            <td class="auto-style39">
                                                             
                                </td>
                        </tr>
                    </table>
                    
                    <asp:GridView ID="GridView1" runat="server" Width="100%" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
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
                    
                    
                </div>
            </div>   
        </section>
    </div>


</asp:Content>

