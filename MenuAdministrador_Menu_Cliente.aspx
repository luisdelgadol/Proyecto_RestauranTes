<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="MenuAdministrador_Menu_Cliente.aspx.vb" Inherits="MenuAdministrador_Menu_Cliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            font-weight: 700;
        }
        .auto-style2 {
            text-align: left;
        }
        .auto-style3 {
            text-align: left;
            font-weight: bold;
        }
        .auto-style4 {
            width: 60%;
            font-weight: 700;
            left: 0px;
            top: 0px;
        }
        .auto-style6 {
            width: 84%;
            font-weight: 700;
            left: 0px;
            top: 0px;
            text-align: right;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div>
        <div class="row-bot">
        	<div class="row-bot-bg">
            	<div class="main">
                	<h2>&nbsp;Menu</h2>
                </div>
            </div>
        </div>
        
        <section id="content"><div class="ic"></div>
            <div class="main2">
                <div class="auto-style10">
                    <table style="width:100%;color: #0000FF;background-color: #CCFFFF;">
                        <tr>
                            <td class="auto-style6" >
                                &nbsp;</td>
                            <td class="auto-style1" >
                                &nbsp;</td>
                            <td class="auto-style1" STYLE="TEXT-ALIGN: left; font-size: larger">
                                <b>Menu para Clientes</b></td>
                        </tr>
                        <tr>
                            <td class="auto-style6" >
                                Categoría:
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td class="auto-style3">
                                  <asp:DropDownList ID="cboCat" runat="server" Height="20px" Width="30%" style="font-weight: 700; color: #FF0000" >
                                </asp:DropDownList>
                            </td>
                        </tr>
                         <tr>
                            <td class="auto-style6" >
                                Precio:
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                         <tr>
                            <td class="auto-style6" >
                                Desde:
                            </td>
                            <td>
                                &nbsp;
                            </td>
                              <td>
                                <%-- NUEVO --%>
                                  <asp:TextBox ID="txtDesde" onkeypress="return justNumbers(event);" runat="server"></asp:TextBox>
                                
                            </td>
                        </tr>
                         <tr>
                            <td class="auto-style6" >
                                Hasta:
                            </td>
                            <td>
                                &nbsp;
                            </td>
                               <td><%-- NUEVO --%>
                                  <asp:TextBox ID="txtHasta" onkeypress="return justNumbers(event);" runat="server"></asp:TextBox>
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">

                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td class="auto-style2">

                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style4">

                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td class="auto-style2">
                                <asp:Button ID="btnBuscar" runat="server" Height="31px" Text="BUSCAR" Width="149px" />
                            </td>
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
                                 Response.Write("<td style='border=Solid'><b>Plato</b></td>")
                                 Response.Write("<td style='border=Solid'><b>Ingredientes</b></td>")
                                 Response.Write("<td style='border=Solid'><b>Precio</b></td>")
                                 Response.Write("<td style='border=Solid'><b>Categoría</b></td>")
                                 Response.Write("<td style='border=Solid'><b>Estado</b></td>")
                                 Response.Write("<td style='border=Solid'><b>Detalle</b></td>")
                                 Response.Write("</tr>")
                                 For i = 0 To intNumTotReg - 1
                                     Response.Write("<tr>")
                                     Response.Write("<td style='border=Solid'>" & dtbcat.Rows(i).Item(0) & "</td>")
                                     Response.Write("<td style='border=Solid'>" & dtbcat.Rows(i).Item(1) & "</td>")
                                     Response.Write("<td style='border=Solid'>" & dtbcat.Rows(i).Item(2) & "</td>")
                                     Response.Write("<td style='border=Solid'>" & dtbcat.Rows(i).Item(3).ToString() & "</td>")
                                     Response.Write("<td style='border=Solid'>" & dtbcat.Rows(i).Item(4) & "</td>")
                                     Response.Write("<td style='border=Solid'>" & dtbcat.Rows(i).Item(5) & "</td>")
                                     Response.Write("<td style='border=Solid'><a href='MenuAdministrador_Menu_Cliente_Detalle.aspx?cat=" & dtbcat.Rows(i).Item(4) & _
                                                    "&pla=" & dtbcat.Rows(i).Item(1) &"'>Detalle</a></td>")
                                     Response.Write("</tr>")
                                 Next
                                 Response.Write("</table>")
                                 con.Close()
                             End If
                           
                            %>                         
                          
                        
                   <table>
                       <tr>
                            <td><a href="Menu.aspx"><b>REGRESAR</b></a></td>
                       </tr>
                   </table>                    
                    
                </div>
            </div>   
        </section>
    </div>
       
</asp:Content>

