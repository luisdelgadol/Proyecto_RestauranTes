
Imports System.Data.SqlClient
Imports System.Data
Partial Class ActulizarPlatos
    Inherits System.Web.UI.Page
    Public strSQL As String
    Public con As System.Data.SqlClient.SqlConnection
    Public sda As System.Data.SqlClient.SqlDataAdapter
    Public dtb As System.Data.DataTable
    Public intIdPla As Integer, intIdPlaCat As Integer



    Protected Sub BtnLimpiar_Click(sender As Object, e As EventArgs) Handles BtnLimpiar.Click
        limpiar()
    End Sub

    Public Sub limpiar()
        CmbCategoria.SelectedIndex = 0
        CmbPlatos.SelectedIndex = 0
        TxtPrecio.Text = ""
        TxtNombre.Text = ""
        TxtTiempo.Text = ""
        CmbActivo.SelectedValue = "A"
        TxtInformacion.Text = ""
        LblMnesajes.Text = ""
    End Sub
    Function intIdPlaCat2() As Integer
        Dim co As System.Data.SqlClient.SqlConnection
        Dim sda As System.Data.SqlClient.SqlDataAdapter
        Dim strSql As String
        Dim dt As System.Data.DataTable
        Dim VintIdPlaCat2 As Integer
        If CmbCategorias2.SelectedIndex <> 0 Then

            Try
                'con = New Data.SqlClient.SqlConnection("Data Source=LAPTOP-BG46TJP5\SQLEXPRESS;Initial Catalog=Restaurantes;Integrated Security=True")
                co = New Data.SqlClient.SqlConnection(CStr(Session("sessStrCon")))
                co.Open()
                ' MsgBox(CStr(Session("sessStrCon")))
                strSql = " SELECT IdPatCat "
                strSql = strSql & " FROM tbm_Platos_Categoria "
                strSql = strSql & " WHERE Nombre = " & "'" + CmbCategorias2.SelectedItem.ToString() + "'"
                ' MsgBox(strSql)

                sda = New System.Data.SqlClient.SqlDataAdapter(strSql, co)
                dt = New System.Data.DataTable
                sda.Fill(dt)
                VintIdPlaCat2 = dt.Rows(0).Item(0)
            Catch ex As Exception
            End Try
        End If
        Return VintIdPlaCat2
    End Function





    Protected Sub CmbPlatos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles CmbPlatos.SelectedIndexChanged
        'cargo los datos del plato selecionado en el combo
        Dim co As System.Data.SqlClient.SqlConnection
        Dim sda As System.Data.SqlClient.SqlDataAdapter
        Dim strSql As String
        Dim dt As System.Data.DataTable
        If CmbCategoria.SelectedIndex <> 0 And CmbPlatos.SelectedIndex <> 0 Then
            Dim intNumTotReg As Integer, i As Integer
            Try
                'con = New Data.SqlClient.SqlConnection("Data Source=LAPTOP-BG46TJP5\SQLEXPRESS;Initial Catalog=Restaurantes;Integrated Security=True")
                co = New Data.SqlClient.SqlConnection(CStr(Session("sessStrCon")))
                co.Open()
                ' MsgBox(CStr(Session("sessStrCon")))
                strSql = " SELECT IdPlato "
                strSql = strSql & " FROM tbm_Platos "
                strSql = strSql & " WHERE Nombre = " & "'" + CmbPlatos.SelectedItem.ToString() + "'"
                ' MsgBox(strSql)

                sda = New System.Data.SqlClient.SqlDataAdapter(strSql, co)
                dt = New System.Data.DataTable
                sda.Fill(dt)

                intIdPla = dt.Rows(0).Item(0)
                strSql = ""
                dt.Clear()
                'co.Close()

                'con = New Data.SqlClient.SqlConnection(CStr(Session("sessStrCon")))
                'con.Open()

                strSql = " SELECT IdPlatCat "
                strSql = strSql & " FROM tbm_Platos "
                strSql = strSql & " WHERE Nombre = " & "'" + CmbPlatos.SelectedItem.ToString() + "'"

                sda = New System.Data.SqlClient.SqlDataAdapter(strSql, co)
                dt = New System.Data.DataTable
                sda.Fill(dt)

                intIdPlaCat = dt.Rows(0).Item(0)
                strSql = ""
                dt.Clear()
                'con.Close()

                MsgBox(intIdPla, intIdPlaCat)
                strSql = " SELECT IdPlato , Nombre ,Estado ,IdPlatCat,Informacion ,Precio,Tiempo "
                strSql = strSql & " FROM tbm_Platos "
                strSql = strSql & " WHERE IdPlatCat = " & intIdPlaCat
                strSql = strSql & "  AND   IdPlato = " & intIdPla

                sda = New System.Data.SqlClient.SqlDataAdapter(strSql, co)
                dtb = New System.Data.DataTable
                sda.Fill(dtb)

                intNumTotReg = dtb.Rows.Count   ' numTotreg
                ' MsgBox(intNumTotReg)
                For i = 0 To intNumTotReg - 1
                    'llenos campos de la pantalla
                    TxtNombre.Text = dtb.Rows(i).Item("Nombre")
                    TxtInformacion.Text = dtb.Rows(i).Item("Informacion")
                    TxtPrecio.Text = dtb.Rows(i).Item("Precio")
                    TxtTiempo.Text = dtb.Rows(i).Item("Tiempo")

                    'asiganr al combo de categoria el mismo d q venga d ela base
                    CmbCategorias2.SelectedValue = dtb.Rows(i).Item("IdPlatCat")
                    Dim strEstado As String = dtb.Rows(i).Item("Estado")
                    If strEstado = "A" Then
                        CmbActivo.SelectedValue = "A"
                    Else
                        CmbActivo.SelectedValue = "I"
                    End If
                Next
                llenarComboxCate(1)
                dtb.Clear()
                co.Close()
                LblMnesajes.Text = ""
                LblMensaje2.Text = ""
            Catch ex As Exception
                MsgBox("Excepción: " & ex.ToString)
            End Try

        End If

    End Sub

    Protected Function validarDatosNum() As Boolean
        If Not IsNumeric(TxtPrecio.Text) Then
            LblMnesajes.Text = "valor ingresado incorrecto, solo se acepta numero enteros, con dos decimales"
            TxtPrecio.Focus()
            Return False
        ElseIf Not IsNumeric(TxtTiempo.Text) Then
            LblMnesajes.Text = "El campo tiempo Solo deben ser numeros enteros, especificados en minutos"
            TxtTiempo.Focus()
            Return False
        Else
            Return True
        End If
    End Function


    Protected Sub BtnGuardar_Click(sender As Object, e As EventArgs) Handles BtnGuardar.Click
        LblMensaje2.Text = ""
        If ValidadCampos() And validarDatosNum() Then
            con = New SqlConnection(CStr(Session("sessStrCon")))
            Dim cmd As New SqlCommand("SP_ACTUALIZA_PLATOS ", con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add("@IdPlato", SqlDbType.Int).Value = intIdPla
            If CmbCategoria.SelectedIndex <> 0 And CmbPlatos.SelectedIndex <> 0 Then
                cmd.Parameters.Add("@IdCategoria", SqlDbType.Int).Value = intIdPlaCat
            Else
                cmd.Parameters.Add("@IdCategoria", SqlDbType.Int).Value = intIdPlaCat2()
            End If

            cmd.Parameters.Add("@Nombre", SqlDbType.VarChar, 30).Value = Me.TxtNombre.Text
            cmd.Parameters.Add("@Estado", SqlDbType.VarChar, 10).Value = Me.CmbActivo.SelectedValue
            cmd.Parameters.Add("@Precio", SqlDbType.Money).Value = Me.TxtPrecio.Text
            cmd.Parameters.Add("@Informacion", SqlDbType.VarChar, 3000).Value = Me.TxtInformacion.Text
            cmd.Parameters.Add("@Tiempo", SqlDbType.Int).Value = Me.TxtTiempo.Text
            ' valido q control envio, depende si voy actualziar o guardar un nuevo plato
            If CmbCategoria.SelectedIndex <> 0 And CmbPlatos.SelectedIndex <> 0 Then
                cmd.Parameters.Add("@Control", SqlDbType.Int).Value = 1
            Else
                cmd.Parameters.Add("@Control", SqlDbType.Int).Value = 2
            End If
            'parametro de regreso validad cualquier problema uranro el sp
            cmd.Parameters.Add("@Error", SqlDbType.VarChar, 100).Direction = ParameterDirection.Output

            Try
                con.Open()
                cmd.ExecuteNonQuery()
                Dim strEror As String = CStr(cmd.Parameters("@Error").Value)
                con.Close()

                If strEror = "OK" Then
                    LblMensaje2.Text = "Datos Almacenados con exito!!.."
                    limpiar()
                Else
                    LblMnesajes.Text = strEror
                End If
            Catch ex As Exception
                LblMnesajes.Text = ex.Message
            End Try

        End If

    End Sub

    Private Function ValidadCampos() As Boolean
        If TxtNombre.Text = "" Then
            LblMnesajes.Text = "Ingrese el Nombre"
            Return False
        ElseIf TxtPrecio.Text = "" Then
            LblMnesajes.Text = "Ingrese el Precio"
            Return False
        ElseIf TxtTiempo.Text = "" Then
            LblMnesajes.Text = "Ingrese el Tiempo"
            Return False
        End If
        Return True
    End Function
    Public Sub llenarcomboPlatos()
        Dim co As System.Data.SqlClient.SqlConnection
        Dim sda As System.Data.SqlClient.SqlDataAdapter
        Dim strSql As String
        Dim dt As System.Data.DataTable
        Dim intTCoun As Integer
        co = New System.Data.SqlClient.SqlConnection(CStr(Session("sessStrCon")))
        co.Open()
        strSql = "SELECT p.Nombre"
        strSql = strSql & " FROM tbm_Platos_Categoria pc"
        strSql = strSql & " INNER JOIN tbm_Platos p ON pc.IdPlatCat=p.IdPlatCat"
        strSql = strSql & " WHERE pc.Nombre = " & "'" + CmbCategoria.SelectedItem.ToString() + "'"

        Try
            sda = New System.Data.SqlClient.SqlDataAdapter(strSql, co)
            dt = New System.Data.DataTable
            sda.Fill(dt)
            intTCoun = dt.Rows.Count
            CmbPlatos.Items.Clear()

            For i = 0 To intTCoun - 1
                CmbPlatos.Items.Add(dt.Rows(i).Item(0))
            Next
        Catch ex As Exception
            MsgBox("El Categoria no tiene registro de platos")
        End Try
    End Sub
    Public Sub llenarComboxCate(x As Integer)
        Dim co As System.Data.SqlClient.SqlConnection
        Dim sda As System.Data.SqlClient.SqlDataAdapter
        Dim strSql As String
        Dim dt As System.Data.DataTable
        Dim intTCoun As Integer
        co = New System.Data.SqlClient.SqlConnection(CStr(Session("sessStrCon")))
        co.Open()
        strSql = "SELECT Nombre"
        strSql = strSql & " FROM tbm_Platos_Categoria"
        'MsgBox(strSql)
        ' MsgBox(CStr(Session("sessStrCon")))

        Try
            sda = New System.Data.SqlClient.SqlDataAdapter(strSql, co)
            dt = New System.Data.DataTable
            sda.Fill(dt)
            intTCoun = dt.Rows.Count
            If x = 1 Then
                For i = 0 To intTCoun - 1
                    CmbCategorias2.Items.Add(dt.Rows(i).Item(0))
                Next
                co.Close()
            Else
                For i = 0 To intTCoun - 1
                    CmbCategoria.Items.Add(dt.Rows(i).Item(0))
                Next
                co.Close()
            End If

        Catch ex As Exception
            MsgBox("Error Categoria")
        End Try

    End Sub


    Protected Sub CmbCategoria_SelectedIndexChanged(sender As Object, e As EventArgs) Handles CmbCategoria.SelectedIndexChanged
        llenarcomboPlatos()

    End Sub




    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        llenarComboxCate(0)
    End Sub
End Class
