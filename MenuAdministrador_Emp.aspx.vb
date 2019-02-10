Imports System.Data
Imports System.Data.SqlClient
Partial Class _Default
    Inherits System.Web.UI.Page
    Public con As SqlConnection
    Public sda As SqlDataAdapter
    Public dset As DataSet

    Public dtbbusA, dtbbusB, dtbbusC, dtbciu, dtbape, dtbins, dtbpai As DataTable
    Public strSQL As String         'TEXTO DE SENTENCIAS SQL
    Public tipoint As Integer       '0:INGRESO, 1:MODIFICACION, 2:ELIMINACION
    Public tipo As String           'TITULO DE LA PAGINA GENERADA POR EL tipoint
    Public idch As Integer
    Public intidper As Integer      'GUARDA ID PERSONA PARA MODIFICACIONES Y ELIMINACIONES

    Protected Sub Page_PreLoad(sender As Object, e As EventArgs) Handles Me.PreLoad

        tipoint = CInt(Request.QueryString.GetValues("v1")(0))
        'VALIDAR INICIO DE SESION
        If Session("sesUsrIniSes") <> "S" Then
            Response.Redirect("InicioSesion.aspx")
        End If

        If Not Page.IsPostBack Then
            If tipoint = 0 Then
                tipo = "Ingreso de Empleados"
                Button1.Text = "Guardar"
            ElseIf tipoint = 1 Then
                tipo = "Modificación de Empleados"
                Button1.Text = "Modificar"
            Else
                tipo = "Eliminación de Empleados"
                Button1.Text = "Eliminar"
            End If
            cargarID()
            cargarPais()
            'cargarInfo()

        End If

    End Sub
    ' Cargar la informacion , cambie el nombre de apellido a ID personas para que pueda cojer al momento que se hace un post back
    'Private Sub cargarInfo()
    '    Dim intNumTotReg As Integer, i As Integer
    '    Try
    '        con = New SqlConnection(CStr(Session("sessStrCon")))
    '        con.Open()
    '        strSQL = "SELECT *"
    '        strSQL = strSQL & " FROM tbm_Personas PE, tbm_Empleados EM, tbm_Ciudades Ciu"
    '        strSQL = strSQL & " WHERE PE.IdPersona = EM.IdPersona AND PE.IdCiudad = Ciu.IdCiudad AND IdPersona = '" & cbo_Id.SelectedValue & "'"
    '        'strSQL = strSQL & " WHERE IdPais = "
    '        'strSQL = strSQL & " ORDER BY Nombre"
    '        sda = New SqlDataAdapter(strSQL, con)
    '        dtbciu = New DataTable
    '        sda.Fill(dtbciu)
    '        cbo_Ciu.Items.Clear()
    '        intNumTotReg = dtbciu.Rows.Count
    '        For i = 0 To intNumTotReg - 1
    '            dtbciu.Rows(i).Item("Nombres") = tx_Nom.Text
    '            dtbciu.Rows(i).Item("Apellidos") = tx_Apell.Text
    '            dtbciu.Rows(i).Item("Email") = tx_Email.Text
    '            dtbciu.Rows(i).Item("U_ser") = tx_User.Text
    '            dtbciu.Rows(i).Item("Passw") = tx_Con.Text
    '            tx_Con.Text = tx_ConfCon.Text
    '            dtbciu.Rows(i).Item("CreadoDate") = tx_FechIngr.Text
    '            dtbciu.Rows(i).Item("FechaNacimiento") = tx_FechNac.Text
    '            dtbciu.Rows(i).Item("Numero1") = tx_Num1.Text
    '            dtbciu.Rows(i).Item("Numero2") = tx_Num2.Text
    '            dtbciu.Rows(i).Item("Estado") = cbo_EstReg.SelectedValue
    '            dtbciu.Rows(i).Item("Nombre") = cbo_Ciu.SelectedValue
    '            dtbciu.Rows(i).Item("") = cbo_Pais.SelectedValue
    '            dtbciu.Rows(i).Item("") = cbo_TipUsurio.SelectedValue

    '        Next
    '        dtbciu.Clear()
    '        con.Close()
    '    Catch ex As Exception
    '        MsgBox("Excepción: " & ex.ToString)
    '    End Try
    'End Sub
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
    Private Sub cargarID()
        Dim intNumTotReg As Integer, i As Integer
        Try
            con = New SqlConnection(CStr(Session("sessStrCon")))
            con.Open()
            strSQL = "SELECT IdPersona , CI"
            strSQL = strSQL & " FROM tbm_Personas "
            strSQL = strSQL & "ORDER BY IdPersona"
            'strSQL = strSQL & " ORDER BY PE.Apellidos"
            sda = New SqlDataAdapter(strSQL, con)
            dtbape = New DataTable
            sda.Fill(dtbape)
            cbo_Id.Items.Clear()
            cbo_Id.Items.Add(New ListItem("-", -1))
            intNumTotReg = dtbape.Rows.Count
            For i = 0 To intNumTotReg - 1
                cbo_Id.Items.Add(New ListItem(dtbape.Rows(i).Item(1), dtbape.Rows(i).Item(0)))
            Next
            dtbape.Clear()
            con.Close()
        Catch ex As Exception
            MsgBox("Excepción: " & ex.ToString)
        End Try
    End Sub
    Protected Sub cbo_Pais_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cbo_Pais.SelectedIndexChanged
        cargarCiudad(cbo_Pais.SelectedValue)
    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim intNumFilIns As Integer
        Dim intCodEmp As Integer        'NUEVO CODIGO DE TBM_EMPLEADOS
        Dim intCodPer As Integer        'NUEVO CODIGO DE TBM_PERSONAS
        Dim x As Integer


        intNumFilIns = 0

        'intidper = CInt(cbo_Apellidos.SelectedValue)
        con = New SqlConnection(CStr(Session("sessStrCon")))
        con.Open()
        strSQL = "SELECT CI, U_ser FROM tbm_Personas"
        sda = New SqlDataAdapter(strSQL, con)
        dtbins = New DataTable
        sda.Fill(dtbins)
        intNumFilIns = dtbins.Rows.Count

        For i = 0 To intNumFilIns - 1


            If txt_CI.Text.Equals(CStr(dtbins.Rows(i).Item(0))) Then
                txt_CI.Focus()
                x = 1
            End If
            If tx_User.Text.Equals(CStr(dtbins.Rows(i).Item(1))) Then
                tx_User.Focus()
                x = 2

            End If
        Next
        strSQL = ""
        dtbins.Clear()

        If tipoint = 0 Then
            If x = 0 Then
                Try
                    con = New SqlConnection(CStr(Session("sessStrCon")))
                    con.Open()
                    strSQL = "SELECT MAX(IdPersona) FROM tbm_Personas"
                    sda = New SqlDataAdapter(strSQL, con)
                    dtbins = New DataTable
                    sda.Fill(dtbins)
                    intCodPer = dtbins.Rows(0).Item(0) + 1
                    dtbins.Clear()

                    strSQL = "INSERT INTO tbm_Personas(IdPersona, Nombres, Apellidos, FechaNacimiento, Numero1, Numero2, Email, "
                    strSQL = strSQL & "CreadoDate, CreadoPor, ModificadoDate, ModificadoPor, CI, U_ser, Passw, Estado, IdCiudad)"
                    strSQL = strSQL & " VALUES("
                    strSQL = strSQL & "" & intCodPer
                    strSQL = strSQL & ", '" & tx_Nom.Text & "'"
                    strSQL = strSQL & ", '" & tx_Apell.Text & "'"
                    strSQL = strSQL & ", '" & (CDate(tx_FechNac.Text)).ToString("yyyy-MM-dd") & "'"
                    strSQL = strSQL & ", '" & tx_Num1.Text & "'"
                    strSQL = strSQL & ", '" & tx_Num2.Text & "'"
                    strSQL = strSQL & ", '" & tx_Email.Text & "'"
                    strSQL = strSQL & ", '" & (CDate(tx_FechIngr.Text)).ToString("yyyy-MM-dd") & "'"
                    strSQL = strSQL & ", '" & CStr(Session("User")) & "'"
                    strSQL = strSQL & ", '" & Today.ToString("yyyy-MM-dd") & "'"
                    strSQL = strSQL & ", '" & CStr(Session("User")) & "'"
                    strSQL = strSQL & ", '" & txt_CI.Text & "'"

                    'NUEVO
                    strSQL = strSQL & ", '" & tx_User.Text & "'"
                    strSQL = strSQL & ", '" & tx_Con.Text & "'"

                    'strSQL = strSQL & ", '" & LCase((tx_Nom.Text).Substring(0, 1)) & LCase(tx_Apell.Text) & "'"
                    'strSQL = strSQL & ", '" & LCase((tx_Nom.Text).Substring(0, 1)) & LCase(tx_Apell.Text) & "'"

                    strSQL = strSQL & ", '" & cbo_EstReg.SelectedValue & "'"
                    strSQL = strSQL & ", " & cbo_Ciu.SelectedValue
                    strSQL = strSQL & ")"
                    'MsgBox(strSQL)
                    sda.InsertCommand = New SqlCommand(strSQL, con)
                    intNumFilIns = sda.InsertCommand.ExecuteNonQuery()

                    strSQL = "SELECT MAX(IdEmpleado) FROM tbm_Empleados"
                    sda = New SqlDataAdapter(strSQL, con)
                    dtbins = New DataTable
                    sda.Fill(dtbins)
                    intCodEmp = dtbins.Rows(0).Item(0) + 1
                    dtbins.Clear()

                    strSQL = "INSERT INTO tbm_Empleados(IdEmpleado, IdPersona, Tipo, FechaSalida, FechaIngreso)"
                    strSQL = strSQL & " VALUES("
                    strSQL = strSQL & intCodEmp
                    strSQL = strSQL & ", " & intCodPer
                    strSQL = strSQL & ", '" & cbo_TipUsurio.SelectedItem.ToString & "'"
                    strSQL = strSQL & ", ''"
                    strSQL = strSQL & ", '" & (CDate(tx_FechIngr.Text)).ToString("yyyy-MM-dd") & "'"
                    strSQL = strSQL & ")"

                    sda.InsertCommand = New SqlCommand(strSQL, con)
                    intNumFilIns = sda.InsertCommand.ExecuteNonQuery()
                    con.Close()
                    MsgBox("Datos guardados con éxito.")

                Catch ex As Exception
                    MsgBox(ex.ToString)
                End Try
                Response.Redirect("MenuAdministrador.aspx")
                strSQL = ""
                dtbins.Clear()
            End If
            If x = 1 Then
                MsgBox("Número de cédula ya exista")
            End If
            If x = 2 Then
                MsgBox("Nombre de usuario ya existe")
            End If

        ElseIf tipoint = 1 Then
            Try
                intidper = CInt(cbo_Id.SelectedValue)

                con = New SqlConnection(CStr(Session("sessStrCon")))
                con.Open()

                Dim cmd As New SqlCommand("SP_MODIFICAR ", con)

                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@Nombres", tx_Nom.Text)
                MsgBox(intidper)
                cmd.Parameters.AddWithValue("@Nacimiento", (CDate(tx_FechNac.Text)).ToString("yyyy-MM-dd"))
                cmd.Parameters.AddWithValue("@num1", tx_Num1.Text)
                cmd.Parameters.AddWithValue("@Num2", tx_Num2.Text)
                cmd.Parameters.AddWithValue("@email", tx_Email.Text)
                cmd.Parameters.AddWithValue("@moddate", Today.ToString("yyyy-MM-dd"))
                cmd.Parameters.AddWithValue("@modpor", CStr(Session("User")))
                cmd.Parameters.AddWithValue("@user", tx_User.Text) 'nuevo 'OJO NO MODIFICA
                cmd.Parameters.AddWithValue("@pass", tx_Con.Text) 'nuevo 'OJO NO MODIFICA 
                cmd.Parameters.AddWithValue("@est", cbo_EstReg.SelectedValue)
                cmd.Parameters.AddWithValue("@ciu", cbo_Ciu.SelectedValue)
                cmd.Parameters.AddWithValue("@idper", intidper)
                cmd.Parameters.AddWithValue("@tipo", cbo_TipUsurio.SelectedItem.ToString)
                cmd.Parameters.AddWithValue("@fecing", (CDate(tx_FechIngr.Text)).ToString("yyyy-MM-dd"))

                cmd.ExecuteNonQuery()

                con.Close()

                MsgBox("Datos modificados con éxito.")

            Catch ex As Exception
                MsgBox(ex.ToString)
            End Try
            Response.Redirect("MenuAdministrador.aspx")

        Else
            Try
                con = New SqlConnection(CStr(Session("sessStrCon")))
                con.Open()
                intidper = CInt(cbo_Id.SelectedValue)

                Dim cmd As New SqlCommand("SP_BORRAR ", con)

                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@pers", intidper)

                cmd.ExecuteNonQuery()

                con.Close()

                MsgBox("Datos Eliminados con éxito.")

            Catch ex As Exception
                MsgBox(ex.ToString)
            End Try
            Response.Redirect("MenuAdministrador.aspx")

        End If
    End Sub

    Private Sub cbo_Id_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cbo_Id.SelectedIndexChanged
        Dim intNumTotReg As Integer
        Try
            intidper = CInt(cbo_Id.SelectedValue)
            con = New SqlConnection(CStr(Session("sessStrCon")))
            con.Open()
            strSQL = "SP_EXTRAER " & intidper
            sda = New SqlDataAdapter(strSQL, con)
            dset = New DataSet
            dtbbusA = New DataTable
            dtbbusB = New DataTable
            dtbbusC = New DataTable
            sda.Fill(dset)

            dtbbusA = dset.Tables(0)
            dtbbusB = dset.Tables(1)
            dtbbusC = dset.Tables(2)

            intNumTotReg = dtbbusA.Rows.Count

            If intNumTotReg <> 1 Then
                MsgBox("Muchos Registro repetidos")
            Else

                tx_Nom.Text = CStr(dtbbusA.Rows(0).Item(0))
                tx_Apell.Text = CStr(dtbbusA.Rows(0).Item(1))
                tx_Email.Text = CStr(dtbbusA.Rows(0).Item(5))
                tx_Num1.Text = CStr(dtbbusA.Rows(0).Item(3))
                tx_Num2.Text = CStr(dtbbusA.Rows(0).Item(4))
                tx_User.Text = CStr(dtbbusA.Rows(0).Item(10)) 'nuevo
                tx_Con.Text = CStr(dtbbusA.Rows(0).Item(11)) 'nuevo
                tx_FechIngr.Text = CStr(dtbbusA.Rows(0).Item(9)) 'nuevo
                tx_FechNac.Text = CStr(dtbbusA.Rows(0).Item(2))
                If dtbbusA.Rows(0).Item(6) = "A" Then
                    cbo_EstReg.SelectedValue = "A"
                Else
                    cbo_EstReg.SelectedValue = "I"
                End If
                cbo_Pais.SelectedValue = CInt(dtbbusC.Rows(0).Item(0))
                cargarCiudad(CInt(dtbbusC.Rows(0).Item(0)))
                cbo_Ciu.SelectedValue = CInt(dtbbusA.Rows(0).Item(7))
                'tx_FechIngr.Text = CDate(dtbbusB.Rows(0).Item(9))
                'cbo_TipUsurio.Text = CStr(dtbbusB.Rows(0).Item(0))


            End If
            dtbbusA.Clear()
            dtbbusB.Clear()
            dtbbusC.Clear()
            con.Close()

        Catch ex As Exception
            MsgBox("Excepción: " & ex.ToString)
        End Try
    End Sub
End Class