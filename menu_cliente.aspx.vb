Imports System.Data
Imports System.Data.SqlClient
Partial Class menu_cliente
    Inherits System.Web.UI.Page
    Public con As SqlConnection
    Public sda As SqlDataAdapter
    Public ds As DataSet
    Public dtbA, dtbB, dtbciu, dtbpai As DataTable
    Public strSQL As String
    Public Usuario As String
    Public tipoint As Integer       '0:CARGARDATOS, 1:VACIO
    Public intidper As Integer

    Private Sub menu_cliente_Load(sender As Object, e As EventArgs) Handles Me.Load

        cargarPais()


        tipoint = CInt(Request.QueryString.GetValues("v1")(0))

        If Not IsPostBack Then


            Usuario = Session("USER").ToString()
            con = New SqlConnection(CStr(Session("sessStrCon")))
            Dim dtusu As DataTable = ObtenerUsuario()
            lblUsu.Text = dtusu.Rows(0)(0).ToString()
            Usuario = Session("USER").ToString()
            GetData()
            Dim dt As DataTable = New DataTable()
            dt = GetData()
            TxtCedula.Text = dt.Rows(0)("CI").ToString()
            TxtNomClie.Text = dt.Rows(0)("Nombres").ToString()
            TxtApeClie.Text = dt.Rows(0)("Apellidos").ToString()
            TxtFechaNac.Text = dt.Rows(0)("FechaNacimiento").ToString()
            TxtCorreo.Text = dt.Rows(0)("Email").ToString()
            txtCelular.Text = dt.Rows(0)("Numero2").ToString()
            TxtTelf.Text = dt.Rows(0)("Numero1").ToString()
            TxtFechaNac.Text = dt.Rows(0)("FechaNacimiento").ToString()
            cbo_Pais.SelectedValue = dt.Rows(0)("codPai").ToString()
            cargarCiudad(cbo_Pais.SelectedValue)
            cargarCiudad1()
            cbo_Ciu.SelectedValue = dt.Rows(0)("codCiu").ToString()

        End If

        'If IsPostBack Then
        '    Usuario = Session("USER").ToString()
        '    con = New SqlConnection(CStr(Session("sessStrCon")))
        '    Dim dtusu As DataTable = ObtenerUsuario()
        '    lblUsu.Text = dtusu.Rows(0)(0).ToString()
        '    Usuario = Session("USER").ToString()
        '    GetData()
        '    Dim dt As DataTable = New DataTable()
        '    dt = GetData()
        '    TxtCedula.Text = dt.Rows(0)("CI").ToString()
        '    TxtNomClie.Text = dt.Rows(0)("Nombres").ToString()
        '    TxtApeClie.Text = dt.Rows(0)("Apellidos").ToString()
        '    TxtFechaNac.Text = dt.Rows(0)("FechaNacimiento").ToString()
        '    TxtCorreo.Text = dt.Rows(0)("Email").ToString()
        '    txtCelular.Text = dt.Rows(0)("Numero2").ToString()
        '    TxtTelf.Text = dt.Rows(0)("Numero1").ToString()
        '    TxtFechaNac.Text = dt.Rows(0)("FechaNacimiento").ToString()
        '    cbo_Pais.SelectedValue = dt.Rows(0)("codPai").ToString()
        '    cargarCiudad(cbo_Pais.SelectedValue)
        '    cargarCiudad1()
        '    cbo_Ciu.SelectedValue = dt.Rows(0)("codCiu").ToString()

        'End If
    End Sub
    Public Function ObtenerUsuario() As DataTable
        Dim Usuario As String = Session("USER").ToString()
        Dim query As String = "select r.description from tbm_Personas as p inner join tbm_Rol as r on p.id_rol = r.idRol where p.IdPersona = @Usuario "
        'Dim constr As String = con

        Using conn As SqlConnection = New SqlConnection(con.ConnectionString)
            Dim dt As DataTable = New DataTable()

            Using cmd As SqlCommand = New SqlCommand(query)

                Using sda As SqlDataAdapter = New SqlDataAdapter()
                    cmd.Parameters.AddWithValue("@Usuario", Usuario)
                    cmd.CommandType = CommandType.Text
                    cmd.Connection = conn
                    sda.SelectCommand = cmd
                    sda.Fill(dt)
                End Using
            End Using
            Return dt
        End Using

    End Function
    Private Function GetData() As DataTable
        Dim query As String = "select CI, Nombres, Apellidos, FechaNacimiento, Email, Numero2, Numero1, C.Nombre as NombreCiudad, C.IdCiudad as codCiu, Pa.Nombre as NombrePais, Pa.IdPais as codPai from tbm_Personas as P inner join tbm_Ciudades as C on P.IdCiudad = C.IdCiudad inner join tbm_Paises as Pa on C.IdPais = Pa.IdPais where IdPersona = " + Usuario
        'Dim constr As String = con

        Using conn As SqlConnection = New SqlConnection(con.ConnectionString)
            Dim dt As DataTable = New DataTable()

            Using cmd As SqlCommand = New SqlCommand(query)

                Using sda As SqlDataAdapter = New SqlDataAdapter()
                    cmd.Parameters.AddWithValue("@Usuario", Usuario)
                    cmd.CommandType = CommandType.Text
                    cmd.Connection = conn
                    sda.SelectCommand = cmd
                    sda.Fill(dt)
                End Using
            End Using

            Return dt
        End Using
    End Function
    'Protected Sub Menu1_MenuItemClick(ByVal sender As Object, ByVal e As MenuEventArgs)
    'Dim hasParent As Boolean = (e.Item.Parent IsNot Nothing)
    'Select Case hasParent


    '    Case True
    '        Select Case e.Item.Parent.Value
    '            Case "Menú"
    '                Select Case e.Item.Value
    '                    Case "Mi perfil"
    '                        Response.Redirect("~/MenuAdministrador.aspx", False)

    '                End Select

    'Case "HoursOfBusiness"
    '    Select Case e.Item.Value
    '        Case "Overview"
    '            Response.Redirect("~/RGS/Workflow/BusinessHour/BusinessHours.aspx")
    '        Case "Edit"
    '            Response.Redirect("~/RGS/Workflow/BusinessHour/BusinessHours.aspx")
    '        Case "Create"
    '            Response.Redirect("~/RGS/Workflow/BusinessHour/BusinessHoursCreate.aspx")
    '        Case "Delete"
    '            Response.Redirect("~/RGS/Workflow/BusinessHour/BusinessHours.aspx")
    '    End Select

    '    End Select

    '    End Select
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

    Private Sub cargarPais1(ig As Integer)
        Dim intNumTotReg As Integer, i As Integer
        Try
            con = New SqlConnection(CStr(Session("sessStrCon")))
            con.Open()
            strSQL = "select p.IdPais, p.Nombre"
            strSQL = strSQL & " from tbm_Ciudades c inner join tbm_Paises as p on c.IdPais = p.IdPais"
            strSQL = strSQL & " where c.IdCiudad = " & ig
            'strSQL = strSQL & " ORDER BY Nombre"
            sda = New SqlDataAdapter(strSQL, con)
            dtbciu = New DataTable
            sda.Fill(dtbciu)
            cbo_Pais.Items.Clear()
            intNumTotReg = dtbciu.Rows.Count
            For i = 0 To intNumTotReg - 1
                cbo_Pais.Items.Add(New ListItem(dtbciu.Rows(i).Item(1), dtbciu.Rows(i).Item(0)))
            Next
            dtbciu.Clear()
            con.Close()
        Catch ex As Exception
            MsgBox("Excepción: " & ex.ToString)
        End Try
    End Sub

    Private Sub cargarCiudad1()
        Dim intNumTotReg As Integer, i As Integer
        Try
            con = New SqlConnection(CStr(Session("sessStrCon")))
            con.Open()
            strSQL = "SELECT IdCiudad, Nombre"
            strSQL = strSQL & " FROM tbm_Ciudades"
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
    Protected Sub Btn_ModiCliente_Click(sender As Object, e As EventArgs) Handles Btn_ModiCliente.Click

        Try
                intidper = CInt(TxtCedula.Text)

                con = New SqlConnection(CStr(Session("sessStrCon")))
                con.Open()

            Dim cmd As New SqlCommand("SP_EDITARPERFIL ", con)

            cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@Nombres", TxtNomClie.Text)
            cmd.Parameters.AddWithValue("@Apellidos", TxtApeClie.Text)
            cmd.Parameters.AddWithValue("@Nacimiento", (CDate(TxtFechaNac.Text)).ToString("yyyy-MM-dd"))
                cmd.Parameters.AddWithValue("@Num2", txtCelular.Text)
                cmd.Parameters.AddWithValue("@num1", TxtTelf.Text)
                cmd.Parameters.AddWithValue("@email", TxtCorreo.Text)
                'cmd.Parameters.AddWithValue("@moddate", Today.ToString("yyyy-MM-dd"))
                'cmd.Parameters.AddWithValue("@modpor", CStr(Session("User")))
                'cmd.Parameters.AddWithValue("@user", tx_User.Text) 'nuevo 'OJO NO MODIFICA
                'cmd.Parameters.AddWithValue("@pass", tx_Con.Text) 'nuevo 'OJO NO MODIFICA 
                'cmd.Parameters.AddWithValue("@est", cbo_EstReg.SelectedValue)
                cmd.Parameters.AddWithValue("@ciu", cbo_Ciu.SelectedValue)
                cmd.Parameters.AddWithValue("@idper", intidper)
                'cmd.Parameters.AddWithValue("@tipo", cbo_TipUsurio.SelectedItem.ToString)
                'cmd.Parameters.AddWithValue("@fecing", (CDate(tx_FechIngr.Text)).ToString("yyyy-MM-dd"))

                cmd.ExecuteNonQuery()

                con.Close()
            cargarPais1(cbo_Ciu.SelectedValue)
            MsgBox("Datos modificados con éxito.")


            Catch ex As Exception
                MsgBox(ex.ToString)
            End Try

    End Sub
    Protected Sub cbo_Ciu_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cbo_Ciu.SelectedIndexChanged
        cargarPais1(cbo_Ciu.SelectedValue)
    End Sub
End Class
