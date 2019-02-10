Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

Partial Class MenuAdministrador_Reportes
    Inherits System.Web.UI.Page

    Public titulo As String
    Public con As SqlConnection
    Public sda As SqlDataAdapter
    Public dset As DataSet

    Public dtbcat As DataTable
    Public strSQL As String         'TEXTO DE SENTENCIAS SQL
    Public tipoint As Integer       '0:INGRESO, 1:MODIFICACION, 2:ELIMINACION
    Public tipo As String           'TITULO DE LA PAGINA GENERADA POR EL tipoint
    Public idch, cod_l As Integer
    Public intidper As Integer      'GUARDA ID PERSONA PARA MODIFICACIONES Y ELIMINACIONES

    Public filename As String
    Protected Sub Page_PreLoad(sender As Object, e As EventArgs) Handles Me.PreLoad
        cargargrid("TODOS")
        'VALIDAR INICIO DE SESION
        If Session("sesUsrIniSes") <> "S" Then
            Response.Redirect("Default.aspx")
        End If
        rdbTodos.Checked = True

        tipoint = CInt(Request.QueryString.GetValues("v1")(0))

        If tipoint = 1 Then
            cod_l = CInt(Request.QueryString.GetValues("v2")(0))
            LeerMensaje(cod_l)
        Else
            tx_Información.Text = ""
        End If
    End Sub

    Protected Sub cargargrid(Estado As String)
        Try
            con = New SqlConnection(CStr(Session("sessStrCon")))
            con.Open()
            strSQL = "SELECT *"
            strSQL = strSQL & " FROM tbm_Comentarios"
            If Estado = "N" Then
                strSQL = strSQL & " WHERE Estado = 'N'"
            End If
            strSQL = strSQL & " ORDER BY Fecha"
            sda = New SqlDataAdapter(strSQL, con)
            dtbcat = New DataTable
            sda.Fill(dtbcat)
            'GridView1.DataSource = dtbcat
            'GridView1.DataBind()


        Catch ex As Exception
            MsgBox("Excepción: " & ex.ToString)
        End Try

    End Sub

    Protected Sub btnBuscar_Click(sender As Object, e As EventArgs) Handles btnBuscar.Click
        If rdbNoLeido.Checked Then
            cargargrid("N")
            tx_Información.Text = ""
        Else
            cargargrid("TODOS")
            tx_Información.Text = ""
        End If
    End Sub
    Protected Sub LeerMensaje(codigo As Integer)
        Try
            con = New SqlConnection(CStr(Session("sessStrCon")))
            con.Open()
            strSQL = "SELECT *"
            strSQL = strSQL & " FROM tbm_Comentarios WHERE idComentario =" & codigo
            sda = New SqlDataAdapter(strSQL, con)
            dtbcat = New DataTable
            sda.Fill(dtbcat)
            Dim cmd As New SqlCommand("SP_MODIFICAR_MENSAJES ", con)

            cmd.CommandType = CommandType.StoredProcedure

            cmd.Parameters.AddWithValue("@idComentario", codigo)
            cmd.Parameters.AddWithValue("@estado", "L")

            cmd.ExecuteNonQuery()
            tx_Información.Text = dtbcat.Rows(0).Item(3)
            con.Close()

            'MsgBox("Datos modificados con éxito.")

        Catch ex As Exception
            MsgBox("Excepción: " & ex.ToString)
        End Try

    End Sub

End Class
