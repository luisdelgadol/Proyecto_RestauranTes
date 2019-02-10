<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="MenuAdministrador_Reportes.aspx.vb" Inherits="MenuAdministrador_Reportes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            font-weight: 700;
            width: 30px;
            font-size: 13px;
            line-height: 25px;
            margin: 0 auto;
            padding: 0;
        }
        .auto-style10 {
            font-weight: 700;
            width: 945px;
            font-size: 13px;
            line-height: 25px;
            margin: 0 auto;
            padding: 0;
        }
        .auto-style14 {
            left: 0px;
            top: 0px;
            text-align: center;
            font-weight: bold;
            font-size: medium;
            color: #000000;
            background-color: #FFFFFF;
        }
        .auto-style15 {
            width: 20px;
            background-color: #FFFFFF;
        }
        .auto-style16 {
            left: 0px;
            top: 0px;
            width: 548px;
            text-align: right;
            background-color: #FFFFFF;
        }
        .auto-style17 {
            background-color: #FFFFFF;
        }
        .auto-style18 {
            width: 471px;
            background-color: #FFFFFF;
        }
        .auto-style19 {
            width: 100px;
            background-color: #FFFFFF;
        }
        .auto-style20 {
            color: #000000;
        }
    </style>
    <script runat=server>
        Protected Sub func(a As String)
            tx_Información.Text = a
        End Sub
        </script>

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
                <div class="auto-style10">
                    <table style="width:100%;color: #0000FF;background-color: #CCFFFF;">
                        <tr>
                            <td class="auto-style14" colspan="4" >
                                LECTURA DE COMENTARIOS</td>
                        </tr>
                        <tr>
                            <td class="auto-style16" >
                                <span class="auto-style20">MOSTRAR:
                            </td>
                            <td class="auto-style15">
                                &nbsp;
                            </td>
                            <td class="auto-style18">
                                <asp:RadioButton ID="rdbNoLeido" runat="server" Checked="True" GroupName="grp" Text="No Leidos" />
                                </span>
                            </td>
                            <td class="auto-style17">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style16">

                            </td>
                            <td class="auto-style15">
                                <span class="auto-style20">&nbsp;
                            </td>
                            <td class="auto-style18">
                                <asp:RadioButton ID="rdbTodos" runat="server" GroupName="grp" Text="Todos" />
                                </span>
                            </td>
                            <td class="auto-style17">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style16">

                            </td>
                            <td class="auto-style15">
                                &nbsp;
                            </td>
                            <td class="auto-style18">

                            </td>
                            <td class="auto-style19">

                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style16">

                            </td>
                            <td class="auto-style15">
                                &nbsp;
                            </td>
                            <td class="auto-style18">
                                <asp:Button ID="btnBuscar" runat="server" Height="31px" Text="BUSCAR" Width="149px" />
                            </td>
                            <td class="auto-style19">
                                &nbsp;</td>
                        </tr>                    
                    </table>
                    
                                                                   
                         <%
                             Dim intNumTotReg As Integer, i As Integer
                             Try
                                 intNumTotReg = dtbcat.Rows.Count
                             Catch ex As Exception
                                 intNumTotReg = 0
                             End Try
                             If intNumTotReg = 0 Then
                                 Response.Write("<BR>No se encontró ningún registro.</p>")
                             Else
                                 Response.Write("<table class='auto-style12' style='width:100%; border=Solid'>")
                                 Response.Write("<tr>")
                                 Response.Write("<td style='border=Solid'><b>Código</b></td>")
                                 Response.Write("<td style='border=Solid'><b>Nombre</b></td>")
                                 Response.Write("<td style='border=Solid'><b>Correo</b></td>")
                                 Response.Write("<td style='border=Solid'><b>Link</b></td>")
                                 Response.Write("<td style='border=Solid'><b>Fecha</b></td>")
                                 Response.Write("<td style='border=Solid'><b>Estado</b></td>")
                                 Response.Write("<td style='border=Solid'><b>Accion</b></td>")
                                 Response.Write("</tr>")
                                 For i = 0 To intNumTotReg - 1
                                     Response.Write("<tr>")
                                     Response.Write("<td style='border=Solid'>" & dtbcat.Rows(i).Item(0) & "</td>")
                                     Response.Write("<td style='border=Solid'>" & dtbcat.Rows(i).Item(1) & "</td>")
                                     Response.Write("<td style='border=Solid'>" & dtbcat.Rows(i).Item(2) & "</td>")
                                     Response.Write("<td style='border=Solid'>" & dtbcat.Rows(i).Item(3) & "</td>")
                                     Response.Write("<td style='border=Solid'>" & dtbcat.Rows(i).Item(4) & "</td>")
                                     Response.Write("<td style='border=Solid'>" & dtbcat.Rows(i).Item(5) & "</td>")
                                     Response.Write("<td style='border=Solid'><a href='MenuAdministrador_Reportes.aspx?v1=1&v2=" & dtbcat.Rows(i).Item(0) & "'>Leer " & dtbcat.Rows(i).Item(0) & "</a></td>")
                                     Response.Write("</tr>")
                                 Next
                                 Response.Write("</table>")
                                 con.Close()

                             End If






                            %>                         
                          
                        
                    <table style="width:100%">
                        <tr>
                            <td>
                                &nbsp;</td>                            
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="tx_Información" runat="server" Width="100%" BorderColor="Black" style="font-weight: 700; color: #FF0000" Height="91px" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                    </table>                            
                    
                </div>
            </div>   
        </section>
    </div>
</asp:Content>

