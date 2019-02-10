<%@ Page Title="" Language="VB" MasterPageFile="MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>RestauranTES.com</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="css/reset.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen"/>
    <link rel="stylesheet" href="css/layout.css" type="text/css" media="screen"/> 
    <script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="js/cufon-yui.js" type="text/javascript"></script>
    <script src="js/cufon-replace.js" type="text/javascript"></script> 
    <script src="js/Dynalight_400.font.js" type="text/javascript"></script>
    <script src="js/FF-cash.js" type="text/javascript"></script>
    <script src="js/tms-0.3.js" type="text/javascript"></script>
    <script src="js/tms_presets.js" type="text/javascript"></script>
    <script src="js/jquery.easing.1.3.js" type="text/javascript"></script>
    <script src="js/jquery.equalheights.js" type="text/javascript"></script>

    <style type="text/css">
        .auto-style6 {width: 100%;}
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>    
        <div class="row-bot">
            <div class="row-bot-bg">
                <div class="main">
                    <h2>&nbsp;<strong>Somos </strong> <span><strong>Tu mejor elección</strong></span></h2>
                    <div class="slider-wrapper" style="margin: 0 auto;">
                        <div class="slider" >
                            <ul class="items">
                                <li><img src="images/Slider/01.jpg" alt="" style="width:50%; height:50%;" height="100%" width="100%" /></li>
                                <li><img src="images/Slider/02.jpg" alt="" style="width:50%; height:50%;" /></li>
                                <li><img src="images/Slider/03.jpg" alt="" style="width:50%; height:50%;" /></li>
                                <li><img src="images/Slider/04.jpg" alt="" style="width:50%; height:50%;" /></li>
                                <li><img src="images/Slider/05.jpg" alt="" style="width:50%; height:50%;" /></li>
                                <li><img src="images/Slider/06.jpg" alt="" style="width:50%; height:50%;" /></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        <section id="content">
            <div class="main">
                <div class="wrapper img-indent-bot">
                    <table class="auto-style6">
                        <tr>
                            <td style="text-align:center">
                                <img class="img-border" src="images/banner-1m.png" alt=""/><img class="img-border" src="images/banner-21.png" alt=""/><img class="img-border" src="images/banner-31.png" alt=""/>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </section>
    </div>


    <script type="text/javascript"> Cufon.now(); </script>
    <script type="text/javascript">
        $(window).load(function () {
            $('.slider')._TMS({
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

