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


        'VALIDAR INICIO DE SESION
        If Session("sesUsrIniSes") <> "S" Then
            Response.Redirect("InicioSesion.aspx")
        End If
        tipoint = CInt(Request.QueryString.GetValues("v1")(0))
        If Not Page.IsPostBack Then
            If tipoint = 0 Then
                tipo = "Ingreso de Categorías"
                Button1.Text = "Guardar"
                cbCategoria.Visible = False
            ElseIf tipoint = 1 Then
                tipo = "Modificación de categorías"
                Button1.Text = "Modificar"
                'tx_Ingrediente.Enabled = False
                cbo_EstReg.Enabled = False
                cargarCategoria()
                tx_Nom.Visible = False
                RequiredFieldValidator4.Enabled = False
            Else
                tipo = "Eliminación de Categorías"
                Button1.Text = "Eliminar"
            End If

        End If

    End Sub
    Private Sub cargarCategoria()
        Dim dtbcat As DataTable
        Dim intNumTotReg As Integer, i As Integer
        Try
            con = New SqlConnection(CStr(Session("sessStrCon")))
            con.Open()
            strSQL = "SELECT IdPlatCat, Nombre"
            strSQL = strSQL & " FROM tbm_Platos_Categoria"
            strSQL = strSQL & " ORDER BY Nombre"
            sda = New SqlDataAdapter(strSQL, con)
            dtbcat = New DataTable
            sda.Fill(dtbcat)
            cbCategoria.Items.Clear()
            cbCategoria.Items.Add(New ListItem("-", -1))
            intNumTotReg = dtbcat.Rows.Count
            For i = 0 To intNumTotReg - 1
                cbCategoria.Items.Add(New ListItem(dtbcat.Rows(i).Item(1), dtbcat.Rows(i).Item(0)))
            Next
            dtbcat.Clear()
            con.Close()
        Catch ex As Exception
            MsgBox("Excepción: " & ex.ToString)
        End Try
    End Sub
    Protected Sub cbo_Nombre_Categoria_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cbCategoria.SelectedIndexChanged
        Dim intNumTotReg As Integer
        Try
            con = New SqlConnection(CStr(Session("sessStrCon")))
            con.Open()

            strSQL = "select Nombre,  Estado "
            strSQL = strSQL & "from tbm_Platos_Categoria "
            strSQL = strSQL & "where IdPlatCat = " & CInt(cbCategoria.SelectedValue)
            sda = New SqlDataAdapter(strSQL, con)
            dtbbusA = New DataTable
            sda.Fill(dtbbusA)

            intNumTotReg = dtbbusA.Rows.Count

            If intNumTotReg <> 1 Then
                MsgBox("Muchos Registro repetidos")
            Else
                ' cbo_Categoria.SelectedValue = dtbbusA.Rows(0).Item(3)
                'tx_Nom.Text = CStr(dtbbusA.Rows(0).Item(0))

                cbo_EstReg.SelectedValue = dtbbusA.Rows(0).Item(1)
                ' Image1.ImageUrl = "~/images/menu/CATEGORIAS/" & cbo_Categoria.SelectedItem.ToString & "/" & cbo_Nombre_Plato.SelectedItem.ToString & "/01.jpg"
            End If
            dtbbusA.Clear()
            con.Close()
            ' tx_Ingrediente.Enabled = True
            cbo_EstReg.Enabled = True
        Catch ex As Exception
            MsgBox("Excepción: " & ex.ToString)
        End Try
    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim intNumFilIns As Integer
        Dim intCodCat As Integer        'NUEVO CODIGO DE TBM_PERSONAS

        intNumFilIns = 0


        If tipoint = 0 Then
            Try
                con = New SqlConnection(CStr(Session("sessStrCon")))
                con.Open()
                strSQL = "SELECT MAX(IdPlatCat) FROM tbm_Platos_Categoria"
                sda = New SqlDataAdapter(strSQL, con)
                dtbins = New DataTable
                sda.Fill(dtbins)
                intCodCat = dtbins.Rows(0).Item(0) + 1
                dtbins.Clear()

                strSQL = "INSERT INTO tbm_Platos_Categoria(idPlatcat, Nombre, Estado,CreadoDate, CreadoPor, ModificadoDate, ModificadoPor)"
                strSQL = strSQL & " VALUES("
                strSQL = strSQL & "" & intCodCat
                strSQL = strSQL & ", '" & tx_Nom.Text & "'"
                strSQL = strSQL & ", '" & cbo_EstReg.SelectedValue & "'"
                strSQL = strSQL & ", '" & Today.ToString("yyyy-MM-dd") & "'"
                strSQL = strSQL & ", '" & CStr(Session("User")) & "'"
                strSQL = strSQL & ", '" & Today.ToString("yyyy-MM-dd") & "'"
                strSQL = strSQL & ", '" & CStr(Session("User")) & "'"
                '     strSQL = strSQL & ", '" & tx_Ingrediente.Text & "'"
                strSQL = strSQL & ")"
                sda.InsertCommand = New SqlCommand(strSQL, con)
                intNumFilIns = sda.InsertCommand.ExecuteNonQuery()
                con.Close()
                MsgBox("Datos guardados con éxito.")
                '  Response.Redirect("Menu.aspx")
            Catch ex As Exception
                MsgBox(ex.ToString)
            End Try
            Response.Redirect("Menu.aspx")


        ElseIf tipoint = 1 Then
            Try
                con = New SqlConnection(CStr(Session("sessStrCon")))
                con.Open()
                sda = New SqlDataAdapter()
                strSQL = "update tbm_Platos_Categoria"
                strSQL = strSQL & " set estado='" & cbo_EstReg.Text & "'"
                ' strSQL = strSQL & ", Ingredientes='" & tx_Ingrediente.Text & "'"
                strSQL = strSQL & ", ModificadoDate='" & Today.ToString("yyyy-MM-dd") & "'"
                strSQL = strSQL & ", ModificadoPor='" & CStr(Session("User")) & "'"
                strSQL = strSQL & " WHERE  IdPlatCat=" & cbCategoria.SelectedValue
                ' sda.UpdateCommand = New SqlCommand(strSQL, con)
                'sda.UpdateCommand.ExecuteNonQuery()
                sda.UpdateCommand = con.CreateCommand()
                sda.UpdateCommand.CommandText = strSQL
                sda.UpdateCommand.ExecuteNonQuery()
                con.Close()

                MsgBox("Datos modificados con éxito.")

            Catch ex As Exception
                MsgBox(ex.ToString)
            End Try
            Response.Redirect("Menu.aspx")

        Else
            Try
                con = New SqlConnection(CStr(Session("sessStrCon")))
                con.Open()

                Dim cmd As New SqlCommand("SP_BORRAR ", con)

                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@pers", intidper)

                cmd.ExecuteNonQuery()

                con.Close()

                MsgBox("Datos Eliminados con éxito.")

            Catch ex As Exception
                MsgBox(ex.ToString)
            End Try
            Response.Redirect("Menu.aspx")

        End If
    End Sub
   


End Class
