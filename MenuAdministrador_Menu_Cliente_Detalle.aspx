<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="MenuAdministrador_Menu_Cliente_Detalle.aspx.vb" Inherits="MenuAdministrador_Menu_Cliente_Detalle" %>

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
            width: 133px;
            font-weight: 700;
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
                    <table style="width:100%">
                        <tr>
                            <td>
                                &nbsp;</td>                            
                        </tr>
                        <tr>
                            <td>
                        <div class="slider2-wrapper" style="margin: 0 auto;">
                        <div class="slider2">
                            <ul class="items">
                                <%
                                    If My.Computer.FileSystem.DirectoryExists(Server.MapPath("Images/menu/CATEGORIAS/" & categoria & "/" & plato)) Then
                                        For Each foundFile As String In My.Computer.FileSystem.GetFiles(
                                        Server.MapPath("Images/menu/CATEGORIAS/" & categoria & "/" & plato))
                                            Dim archivo As String = foundFile
                                            Dim nombre = System.IO.Path.GetFileName(archivo)
                                    %>
                                <li><img src="images/menu/Categorias/<%=categoria%>/<%=plato%>/<%=nombre %>" alt="" /></li>
                                <%      Next
                                    End If%>
                            </ul>
                        </div>
                    </div>
                            </td>
                        </tr>
                        <tr>
                            <td><a href="MenuAdministrador_Menu_Cliente.aspx"><b>REGRESAR</b></a></td>
                        </tr>
                    </table>                            
                    
                </div>
            </div>   
        </section>
    </div>
        <script type="text/javascript"> Cufon.now(); </script>
    <script type="text/javascript">
        $(window).load(function () {
            $('.slider2')._TMS({
                duration: 1000,
                easing: 'easeOutQuint',
                preset: 'slideDown',
                slideshow: 7000,
                banners: false,
                pauseOnHover: true,
                pagination: true,
                pagNums: false
            });
        });
    </script>
</asp:Content>

