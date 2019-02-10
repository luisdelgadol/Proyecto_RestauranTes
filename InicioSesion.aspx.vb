Imports System.Data
Imports System.Data.SqlClient
Partial Class InicioSesion
    Inherits System.Web.UI.Page
    Public con As SqlConnection
    Public sda As SqlDataAdapter
    Public ds As DataSet
    Public dtbA, dtbB As DataTable
    Public strSQL As String
    Shared intTpUsuario As String

    Protected Sub Login_Authenticate(sender As Object, e As AuthenticateEventArgs) Handles Login.Authenticate
        'Dim intNumTotReg As Integer

        'con = New Data.SqlClient.SqlConnection(CStr(Session("sesStrCon")))
        'strSQL = "SELECT * FROM tbm_usuarios"
        ' strSQL = strSQL & " WHERE tx_usr='" & Login.UserName & "' AND tx_cla='" & Login.Password & "'"
        'sda = New System.Data.SqlClient.SqlDataAdapter(strSQL, con)
        'dtb = New System.Data.DataTable
        'sda.Fill(dtb)
        ' intNumTotReg = dtb.Rows.Count
        ' con.Close()
        '' If intNumTotReg = 0 Then
        'Session("sesUsrIniSes") = ""
        'MsgBox("Datos incorrectos." & vbCrLf & "Corrija e intentelo de nuevo.")
        'Else
        'Session("sesUsrIniSes") = "S"
        'Response.Redirect("default.aspx")
        'End If

        Dim intNumTotReg As Integer 'CONTROL DE NUMERO DE REGISTRO, 1 ES VALIDO

        con = New SqlConnection(CStr(Session("sessStrCon")))

        Try
            con.Open()
            strSQL = "SP_INICIO '" & Login.UserName & "', '" & Login.Password & "'"
            ' MsgBox(strSQL)

            sda = New SqlDataAdapter(strSQL, con)
            ds = New DataSet
            dtbA = New DataTable
            dtbB = New DataTable

            sda.Fill(ds)

            dtbA = ds.Tables(0)
            dtbB = ds.Tables(1)
            con.Close()

            intNumTotReg = dtbA.Rows.Count 'Se guarda registros de usuarios segun criterio.  1 es valido. 

            If intNumTotReg = 1 Then

                If dtbB.Rows.Count = 1 Then
                    intTpUsuario = dtbB.Rows(0).Item(0) 'Esta linea define que tipo de empleado es.
                    ' MsgBox(intTpUsuario) 'trae el registro 
                    Session("tipoEmpleado") = dtbB.Rows(0).Item(0)
                Else
                    intTpUsuario = "Cliente"
                End If

                Session("sesUsrIniSes") = "S"
                'If intTpUsuario = "Administrador" Then
                '    Response.Redirect("MenuAdministrador.aspx", False)
                '    MsgBox("Bienvenido Administrador: " & dtbA.Rows(0).Item(1) & " " & dtbA.Rows(0).Item(2))
                'ElseIf intTpUsuario = "Chef" Then
                '    Response.Redirect("MenuCocina.aspx", False)
                '    MsgBox("Bienvenido  Chef: " & dtbA.Rows(0).Item(1) & " " & dtbA.Rows(0).Item(2))
                '    Session("USER") = dtbA.Rows(0).Item(1) & " " & dtbA.Rows(0).Item(2)
                'ElseIf intTpUsuario = "Mesero" Then
                '    Response.Redirect("MenuMesero.aspx?v1=" & dtbB.Rows(0).Item(1), False)
                '    MsgBox("Bienvenido Mesero: " & dtbA.Rows(0).Item(1) & " " & dtbA.Rows(0).Item(2))
                '    Session("USER") = dtbA.Rows(0).Item(1) & " " & dtbA.Rows(0).Item(2)
                'Else
                Response.Redirect("MenuAdministrador.aspx", False)
                'Response.Redirect("menu_cliente.aspx", False)
                'MsgBox("Bienvenido Usuario: " & dtbA.Rows(0).Item(1) & " " & dtbA.Rows(0).Item(2))
                Session("USER") = dtbA.Rows(0).Item(0)
                'End If
                Session("LOGIN") = Login.UserName
                'Session("IDEMP") = dtbB.Rows(0).Item(1)
                'Session("USER") = dtbA.Rows(0).Item(1) & " " & dtbA.Rows(0).Item(2)
                'Response.Redirect("Menu.aspx", False) hace que se repita
            Else
                    Session("sesUsrIniSes") = ""
                MsgBox("Datos incorrectos." & vbCrLf & "Corrija e intentelo de nuevo.", MsgBoxStyle.Exclamation, "ERROR")
            End If
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
    End Sub

    Protected Sub Login_Load(sender As Object, e As EventArgs) Handles Login.Load
        Session("sesUsrIniSes") = ""
        Session("LOGIN") = ""
        Session("IDEMP") = ""
        Session("USER") = ""
    End Sub
End Class
