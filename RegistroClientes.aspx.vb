
Imports System.Data
Imports System.Data.SqlClient
Partial Class RegistroClientes
    Inherits System.Web.UI.Page
    Public con As SqlConnection
    Public sda As SqlDataAdapter
    Public dtb, dtbins As DataTable
    Public strSQL As String

    Public dtbbusA, dtbbusB, dtbbusC, dtbciu, dtbape, dtbpai As DataTable

    Protected Sub Btn_GuarCliente_Click(sender As Object, e As EventArgs) Handles Btn_GuarCliente.Click

        If validarCamposObligatorios() And validarDatosNum() Then
            con = New SqlConnection(CStr(Session("sessStrCon")))
            Dim cmd As New SqlCommand("RegistraClientes ", con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add("@Nombres", SqlDbType.VarChar, 30).Value = Me.TxtNomClie.Text
            cmd.Parameters.Add("@Apellido", SqlDbType.VarChar, 30).Value = Me.TxtApeClie.Text
            Dim fecNac As Date = CDate(TxtFechaNac.Text)
            cmd.Parameters.Add("@FchNaci", SqlDbType.DateTime, 30).Value = fecNac
            cmd.Parameters.Add("@Celu", SqlDbType.VarChar, 10).Value = Me.txtCelular.Text
            cmd.Parameters.Add("@Telf", SqlDbType.VarChar, 9).Value = Me.TxtTelf.Text
            cmd.Parameters.Add("@correo", SqlDbType.VarChar, 60).Value = Me.TxtCorreo.Text
            cmd.Parameters.Add("@User", SqlDbType.VarChar, 50).Value = Me.TxtUser.Text
            cmd.Parameters.Add("@Passw", SqlDbType.VarChar, 50).Value = Me.TxtClave.Text
            cmd.Parameters.Add("@Cedula", SqlDbType.VarChar, 50).Value = Me.TxtCedula.Text
            cmd.Parameters.Add("@Ciudad", SqlDbType.Int).Value = Me.cbo_Ciu.SelectedValue

            'parametro de regreso
            cmd.Parameters.Add("@Error", SqlDbType.VarChar, 100).Direction = ParameterDirection.Output

            Try
                con.Open()
                cmd.ExecuteNonQuery()
                Dim strEror As String = CStr(cmd.Parameters("@Error").Value)
                con.Close()

                If strEror = "OK" Then
                    lblMensjaes.Text = "Datos Almacenados con exito!!.."
                    Limpiar()
                Else
                    lblMensjaes.Text = strEror
                End If
            Catch ex As Exception
                lblMensjaes.Text = ex.Message
            End Try

        End If

    End Sub

    Private Sub Limpiar()
        TxtFechaNac.Text = ""
        TxtNomClie.Text = ""
        TxtApeClie.Text = ""
        txtCelular.Text = ""
        TxtTelf.Text = ""
        TxtCorreo.Text = ""
        TxtUser.Text = ""
        TxtCedula.Text = ""
        cbo_Ciu.SelectedIndex = 0
    End Sub

    Private Function validarCamposObligatorios() As Boolean

        If TxtCedula.Text = "" Then
            lblMensjaes.Text = "Campo Cedula Obligatorio"
            Return False
        ElseIf TxtNomClie.Text = "" Then
            lblMensjaes.Text = "Campo Nombres Obligatorio"
            Return False
        ElseIf TxtApeClie.Text = "" Then
            lblMensjaes.Text = "Campo Apellidos Obligatorio"
            Return False
        ElseIf TxtCorreo.Text = "" Then
            lblMensjaes.Text = "Campo Correo Obligatorio"
            Return False
        ElseIf TxtUser.Text = "" Then
            lblMensjaes.Text = "Campo User Obligatorio"
            Return False
        ElseIf TxtClave.Text = "" Then
            lblMensjaes.Text = "Campo Clave Obligatorio"
            Return False
        ElseIf cbo_Ciu.SelectedIndex = 0 Then
            lblMensjaes.Text = "Debe seleccionar una ciudad!."
            Return False
        End If

        Return True

    End Function


    Protected Sub BtnLimpiar_Click(sender As Object, e As EventArgs) Handles BtnLimpiar.Click
        Limpiar()
    End Sub

    Protected Function validarDatosNum() As Boolean
        If Not IsNumeric(txtCelular.Text) Then
            lblMensjaes.Text = "el numero celular Solo deben ser numeros"
            txtCelular.Focus()
            Return False
        ElseIf Not IsNumeric(TxtTelf.Text) Then
            lblMensjaes.Text = "El numero telfonico Solo deben ser numeros"
            TxtTelf.Focus()
            Return False
        Else
            Return True
        End If
    End Function
    Private Sub cargarCiudad(ig As Integer)
        Dim intNumTotReg As Integer, i As Integer
        Try
            con = New SqlConnection(CStr(Session("sessStrCon")))
            con.Open()
            strSQL = "SELECT IdCiudad, Nombre"
            strSQL = strSQL & " FROM tbm_Ciudades"
            strSQL = strSQL & " WHERE IdPais = " & ig
            strSQL = strSQL & " ORDER BY Nombre"
            sda = New SqlDataAdapter(strSQL, con)
            dtbciu = New DataTable
            sda.Fill(dtbciu)
            cbo_Ciu.Items.Clear()
            intNumTotReg = dtbciu.Rows.Count
            For i = 0 To intNumTotReg - 1
                cbo_Ciu.Items.Add(New ListItem(dtbciu.Rows(i).Item(1), dtbciu.Rows(i).Item(0)))
            Next
            dtbciu.Clear()
            con.Close()
        Catch ex As Exception
            MsgBox("Excepción: " & ex.ToString)
        End Try
    End Sub
    Private Sub cargarPais()
        Dim intNumTotReg As Integer, i As Integer
        Try
            con = New SqlConnection(CStr(Session("sessStrCon")))
            con.Open()
            strSQL = "SELECT IdPais, Nombre"
            strSQL = strSQL & " FROM tbm_Paises"
            strSQL = strSQL & " ORDER BY Nombre"
            sda = New SqlDataAdapter(strSQL, con)
            dtbpai = New DataTable
            sda.Fill(dtbpai)
            cbo_Pais.Items.Clear()
            cbo_Pais.Items.Add(New ListItem("-", -1))
            intNumTotReg = dtbpai.Rows.Count
            For i = 0 To intNumTotReg - 1

                cbo_Pais.Items.Add(New ListItem(dtbpai.Rows(i).Item(1), dtbpai.Rows(i).Item(0)))
            Next
            dtbpai.Clear()
            con.Close()
        Catch ex As Exception
            MsgBox("Excepción: " & ex.ToString)
        End Try
    End Sub

    Protected Sub cbo_Pais_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cbo_Pais.SelectedIndexChanged

        cargarCiudad(cbo_Pais.SelectedValue)
    End Sub

    Protected Sub Page_PreLoad(sender As Object, e As EventArgs) Handles Me.PreLoad
        If Not Page.IsPostBack Then
            cargarPais()
        End If
    End Sub
End Class
