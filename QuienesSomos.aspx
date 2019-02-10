<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="QuienesSomos.aspx.vb" Inherits="QuienesSomos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="css/reset.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="css/layout.css" type="text/css" media="screen"/> 
<style type="text/css">
    .auto-style1 {
        text-align: center;
    }
    .auto-style6 {
        width: 1173px;
        height: 246px;
        text-align: justify;
        margin-left: 0;
    }
    .auto-style7 {
        width: 89%;
        min-height: 122px;
        background: url('images/row-bot-bg.jpg') no-repeat center top;
    }
    .auto-style8 {
        width: 104%;
        background: url('images/row-bot-tail.gif') repeat-x center top;
    }

        .headerCssClass{  
            background-color:#c33803;  
            color:white;  
            border:1px solid black;  
            padding:4px;  
        }  
        .contentCssClass{  
            background-color:#e59a7d;  
            color:black;  
            border:1px dotted black;  
            padding:4px;  
        }  
        .headerSelectedCss{  
            background-color:#808080;  
            color:white;  
            border:1px solid black;  
            padding:4px;  
        }  
    </style> 




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="auto-style8">
        	<div class="auto-style7">
            	<div class="main">
                	<h2>Somos <span>su mejor opción.</span></h2>
                </div>
            </div>
        </div>


    <section style="width:100%;padding:40px 70px 70px 70px;text-align:justify;line-height:25px;background-color:white">
        <p class="auto-style6">	RESTAURANTES Restaurante, un paraíso de delicias gastronómicas creado para satisfacer su exigente paladar, nace en el año 2014.

Fuimos guiados por el deseo de recuperar nuestra herencia ancestral, de utilizar el horno de barro como principal elemento de cocción, con técnicas de quemado y chamuscado como toque enriquecedor de los manjares que preparamos para su degustación. De allí, nos inspiramos para lograr un entorno armonioso entre lo rústico y lo acogedor.

<br /> <br />Nuestra promesa de servicio,  es ofrecerle las mejores opciones gastronómicas sobre la base de la cocina esencial, acompañadas de un ambiente agradable, que evoque el calor y la comodidad de su hogar y le permita la oportunidad de compartir experiencias únicas: agasajar a sus seres queridos, conquistar al amor de su vida, brindar una atención especial a alguien igualmente especial, concretar un negocio, mantener una cálida conversación con amigos… en fin vivencias hermosas que quedarán grabadas como el mejor recuerdo de su visita, en cada rincón de nuestro local.

<br /><br /> Quienes hacemos RESTAURANTES, somos un grupo de profesionales con una amplia trayectoria en el campo gastronómico. Utilizamos los mejores ingredientes, siempre frescos y de la mayor calidad, lo cual acompañado de la experiencia de nuestro chef, nos posibilita ofrecerle diferentes términos para su elección, según sea el gusto de su paladar.

Finalmente, el toque mágico de RESTAURANTES lo pone usted. Siempre es un placer contar con su presencia como un invitado de honor, y nos encanta que nos permita formar parte de sus vivencias personales. Es nuestro deseo contar con su preferencia y elección.</p><br /><br />
    <div style="background-color:white;padding-top:40px"><img src="images/Restaurantes.png" style="width:87%;height:300px;padding-left:10px" /><table class="w-100">
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
        </tr>
        </table>
        </div>
                    <div>
            <ajaxToolkit:Accordion ID="Accordion1" runat="server" ContentCssClass ="contentCssClass "  HeaderCssClass ="headerCssClass" HeaderSelectedCssClass ="headerSelectedCss">

               <Panes>
                   <ajaxToolkit:AccordionPane ID="AccordionPane1" runat="server">
                       <header>Mision</header>
                       <content>La mision de restaurant TES es brindar el mejor servicio en Guayaquil</content>

                   </ajaxToolkit:AccordionPane>

                   <ajaxToolkit:AccordionPane ID="AccordionPane2" runat="server">
                       <header>Vision</header>
                       <content>La vision de restaurant TES es brindar el mejor servicio en Guayaquil</content>

                   </ajaxToolkit:AccordionPane>

               </Panes>
            </ajaxToolkit:Accordion>
</div>
    </section>
     
        <!--==============================  QUIENES SOMOS================================-->
    <%--<section id="content"><div class="ic"></div>
        <div class="auto-style2">
            <div class="auto-style1"> 
                <asp:Image ID="Image1" runat="server"  ImageUrl="~/images/Restaurantes.png" />
            </div>
            <div class="wrapper">
            	
            	RESTAURANTES Restaurante, un paraíso de delicias gastronómicas creado para satisfacer su exigente paladar, nace en el año 2014.

Fuimos guiados por el deseo de recuperar nuestra herencia ancestral, de utilizar el horno de barro como principal elemento de cocción, con técnicas de quemado y chamuscado como toque enriquecedor de los manjares que preparamos para su degustación. De allí, nos inspiramos para lograr un entorno armonioso entre lo rústico y lo acogedor.

Nuestra promesa de servicio,  es ofrecerle las mejores opciones gastronómicas sobre la base de la cocina esencial, acompañadas de un ambiente agradable, que evoque el calor y la comodidad de su hogar y le permita la oportunidad de compartir experiencias únicas: agasajar a sus seres queridos, conquistar al amor de su vida, brindar una atención especial a alguien igualmente especial, concretar un negocio, mantener una cálida conversación con amigos… en fin vivencias hermosas que quedarán grabadas como el mejor recuerdo de su visita, en cada rincón de nuestro local.

Quienes hacemos RESTAURANTES, somos un grupo de profesionales con una amplia trayectoria en el campo gastronómico. Utilizamos los mejores ingredientes, siempre frescos y de la mayor calidad, lo cual acompañado de la experiencia de nuestro chef, nos posibilita ofrecerle diferentes términos para su elección, según sea el gusto de su paladar.

Finalmente, el toque mágico de RESTAURANTES lo pone usted. Siempre es un placer contar con su presencia como un invitado de honor, y nos encanta que nos permita formar parte de sus vivencias personales. Es nuestro deseo contar con su preferencia y elección.
                <br />
                <br />
                <table class="auto-style3">
                    <tr>
                        <td class="auto-style5">
                            <asp:Image ID="Image3" runat="server" Height="174px" ImageUrl="~/images/uno.png" Width="168px" />
                        </td>
                        <td class="auto-style4">
                            <asp:Image ID="Image2" runat="server" Height="165px" ImageUrl="~/images/dos.png" Width="172px" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </section>--%>
    
</asp:Content>

