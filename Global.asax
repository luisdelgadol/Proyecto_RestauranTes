<%@ Application Language="VB" %>

<script runat="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application startup
    End Sub

    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application shutdown
    End Sub

    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when an unhandled error occurs
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        'CADENA DE CONEXION
        'Session("sessStrCon") = "Data Source=SERVER0800;Initial Catalog=Restaurante;User ID=sa;Password=S3gur070;"
        'Session("sessStrCon") = "Data Source=STATION;Initial Catalog=Restaurante;Integrated Security=True;"
        'Session("sessStrCon") = "Data Source=USER\SQLEXPRESS;Initial Catalog=Restaurante;Integrated Security=True;"
        'Session("sessStrCon") = "Data Source=LOCALHOST\SQLEXPRESS;Initial Catalog=Restaurantes;Integrated Security=True"
        'CADENA DE CONEXION LEONEL
        ' Session("sessStrCon") = "Data Source=PC01GYE12\SQLEXPRESS;Initial Catalog=Restaurantes;Integrated Security=True"
        'CADENA DE CONEXION JORGE
        'Session("sessStrCon") = "Data Source=KEVINPINCAY\SQLSERVER;Initial Catalog=Restaurantes;Integrated Security=True"
        'Original v
        Session("sessStrCon") = "Data Source=JUANERAZO;Initial Catalog=Restaurantes;Integrated Security=True"
        'Session("sessStrCon") = "Data Source=LAPTOP-BG46TJP5\SQLEXPRESS;Initial Catalog=Restaurantes;Integrated Security=True"
        Session("sesUsrIniSes") = ""
        Session("tipoEmpleado") = ""
        'CADENA QUE VALIDA SI LA CONEXION HA SIDO HABILITADA DESDE INICIO DE SESION: S EMPLEADOS, C CLIENTES Y "" NO ABIERTA SESION

        'GUARDA NOMBRE DEL USUARIO QUE INICIO SESION
        Session("User") = ""


    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a session ends. 
        ' Note: The Session_End event is raised only when the sessionstate mode
        ' is set to InProc in the Web.config file. If session mode is set to StateServer 
        ' or SQLServer, the event is not raised.
    End Sub

</script>