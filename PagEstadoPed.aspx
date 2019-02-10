<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="PagEstadoPed.aspx.vb" Inherits="PagEstadoPed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 100%;
            height: 243px;
        }
        .auto-style4 {
            height: 26px;
            left: 0px;
            top: 0px;
            width: 84%;
            text-align: center;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <div class="row-bot">
            <div class="row-bot-bg">
                <div class="main">
                	<h2>&nbsp;Estado de Su Pedido</h2>
                    <br/>
                    <div aling="left">
                        <section id="content">
                        <div>
                            <table class="auto-style3" valing="left">
                            <tbody>
                                <tr>
                            <td class="auto-style4">
                                <table>
                                    <tbody>
                                        <tr>
                                            <td class="aligncenter">
                                                &nbsp;</td>
                                            <td>&nbsp;
                                                </td>
                                            <td class="aligncenter">&nbsp;</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="aligncenter" style="text-align: center">
                                <div class="aligncenter">
                                <asp:GridView ID="griConsul" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center" Width="355px">
                                    <AlternatingRowStyle BackColor="White" />
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                </asp:GridView>
                                </div>
                                <% griConsul.DataSource = dtb
                                     %>
                               
                            </td>
                        </tr>
                        <tr>
                            <td class="aligncenter">&nbsp;</td>
                        </tr>
                            </tbody>
                        </table>
                        </div>
                    </section>
                    </div>    
                </div>
            </div>
        </div>
    </div>
</asp:Content>

