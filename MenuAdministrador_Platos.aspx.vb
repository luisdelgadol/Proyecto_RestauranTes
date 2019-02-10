Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports System.Drawing
Imports Common

Partial Class _Default
    Inherits System.Web.UI.Page
    Public con As SqlConnection
    Public sda As SqlDataAdapter
    Public dset As DataSet

    Public dtbbusA, dtbbusB, dtbbusC, dtbape, dtbins, dtbpla, dtbcat As DataTable
    Public strSQL As String         'TEXTO DE SENTENCIAS SQL
    Public tipoint As Integer       '0:INGRESO, 1:MODIFICACION, 2:ELIMINACION
    Public tipo As String           'TITULO DE LA PAGINA GENERADA POR EL tipoint
    Public idch As Integer
    Public intidper As Integer      'GUARDA ID PERSONA PARA MODIFICACIONES Y ELIMINACIONES
    Dim transicion As String
    Public filename As String

    Protected Sub Page_PreLoad(sender As Object, e As EventArgs) Handles Me.PreLoad
        If Session("sesUsrIniSes") <> "S" Then
            Response.Redirect("Default.aspx")
        End If
        tipoint = CInt(Request.QueryString.GetValues("v1")(0))
        If Not Page.IsPostBack Then
            transicion = Server.MapPath("Images/Transicion/") + CStr(Session("LOGIN")) + "\"
            If My.Computer.FileSystem.DirectoryExists(transicion) Then
                My.Computer.FileSystem.DeleteDirectory(transicion, FileIO.DeleteDirectoryOption.DeleteAllContents)
            End If

            If tipoint = 0 Then
                tipo = "Ingreso de Platos"
                Button1.Text = "Guardar"
            ElseIf tipoint = 1 Then
                tipo = "Modificación de Platos"
                Button1.Text = "Modificar"
            Else
                tipo = "Eliminación de Platos"
                Button1.Text = "Eliminar"
            End If

            cargarCategorias()

            If tipoint = 1 Or tipoint = 2 Then
                cargarPlatos(-2)
            End If
        End If

        'VALIDAR INICIO DE SESION

    End Sub
    Private Sub cargarCategorias()
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
            cbo_Categoria.Items.Clear()
            ' cbo_Categoria.Items.Add(New ListItem("-", -1))
            intNumTotReg = dtbcat.Rows.Count
            For i = 0 To intNumTotReg - 1
                cbo_Categoria.Items.Add(New ListItem(dtbcat.Rows(i).Item(1), dtbcat.Rows(i).Item(0)))
            Next
            dtbcat.Clear()
            con.Close()
        Catch ex As Exception
            MsgBox("Excepción: " & ex.ToString)
        End Try
    End Sub
    Private Sub cargarPlatos(ig As Integer)
        Dim intNumTotReg As Integer, i As Integer
        Try
            con = New SqlConnection(CStr(Session("sessStrCon")))
            con.Open()
            strSQL = "SELECT IdPlato, Nombre"
            strSQL = strSQL & " FROM tbm_Platos"
            If ig <> -2 Then
                strSQL = strSQL & " WHERE IdPlatCat = " & ig
            End If
            strSQL = strSQL & " ORDER BY Nombre"
            sda = New SqlDataAdapter(strSQL, con)
            dtbpla = New DataTable
            sda.Fill(dtbpla)
            cbo_Nombre_Plato.Items.Clear()
            cbo_Nombre_Plato.Items.Add(New ListItem("-", -1))
            intNumTotReg = dtbpla.Rows.Count
            For i = 0 To intNumTotReg - 1
                cbo_Nombre_Plato.Items.Add(New ListItem(dtbpla.Rows(i).Item(1), dtbpla.Rows(i).Item(0)))
            Next
            dtbpla.Clear()
            con.Close()
        Catch ex As Exception
            MsgBox("Excepción: " & ex.ToString)
        End Try
    End Sub
    Public Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim intNumFilIns, intCodPer, intCodCat As Integer

        intNumFilIns = 0

        If tipoint = 0 Then 'INGRESO

            Try
                con = New SqlConnection(CStr(Session("sessStrCon")))
                con.Open()
                strSQL = "SELECT MAX(IdPlato) FROM tbm_Platos"
                sda = New SqlDataAdapter(strSQL, con)
                dtbins = New DataTable
                sda.Fill(dtbins)
                intCodPer = dtbins.Rows(0).Item(0) + 1
                intCodCat = cbo_Categoria.SelectedValue
                dtbins.Clear()
                strSQL = ""
                strSQL = "INSERT INTO tbm_Platos(IdPlato, Nombre, Estado, CreadoDate, CreadoPor, ModificadoDate, ModificadoPor, IdPlatCat, informacion, Precio, Tiempo, urlImagen)"
                strSQL = strSQL & " VALUES("
                strSQL = strSQL & "" & intCodPer
                strSQL = strSQL & ", '" & tx_Nom.Text & "'"
                strSQL = strSQL & ", '" & cbo_EstReg.SelectedValue & "'"
                strSQL = strSQL & ", '" & Today.ToString("yyyy-MM-dd") & "'"
                strSQL = strSQL & ", '" & CStr(Session("User")) & "'"
                strSQL = strSQL & ", '" & Today.ToString("yyyy-MM-dd") & "'"
                strSQL = strSQL & ", '" & CStr(Session("User")) & "'"
                strSQL = strSQL & ", " & intCodCat
                strSQL = strSQL & ", '" & tx_Información.Text & "'"
                strSQL = strSQL & ", " & CDbl(tx_Precio.Text)
                strSQL = strSQL & ", " & CInt(tx_Tiempo.Text)
                strSQL = strSQL & ", '" & Image1.ImageUrl & "'"
                strSQL = strSQL & ")"
                sda.InsertCommand = New SqlCommand(strSQL, con)
                intNumFilIns = sda.InsertCommand.ExecuteNonQuery()
                con.Close()
                ' My.Computer.FileSystem.CopyFile(
                '    Server.MapPath(Image1.ImageUrl.ToString),
                '   Server.MapPath("Images/menu/CATEGORIAS/" & cbo_Categoria.SelectedItem.ToString & "/" & tx_Nom.Text) & "/01.jpg")
                'transicion = Server.MapPath("Images/Transicion/") + CStr(Session("LOGIN")) + "\"
                'My.Computer.FileSystem.CopyDirectory(transicion, Server.MapPath("Images/menu/CATEGORIAS/" & cbo_Categoria.SelectedItem.ToString & "/" & tx_Nom.Text & "/"))
                'My.Computer.FileSystem.DeleteDirectory(transicion, FileIO.DeleteDirectoryOption.DeleteAllContents)
                MsgBox("Datos guardados con éxito.")
            Catch ex As Exception
                MsgBox(ex.ToString)
            End Try

            Response.Redirect("MenuAdministrador.aspx")

        ElseIf tipoint = 1 Then
            Try
                con = New SqlConnection(CStr(Session("sessStrCon")))
                con.Open()

                Dim cmd As New SqlCommand("SP_MOD_PLATO ", con)

                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@Nombres", cbo_Nombre_Plato.SelectedItem.ToString())
                cmd.Parameters.AddWithValue("@Tiempo", CInt(tx_Tiempo.Text))
                cmd.Parameters.AddWithValue("@moddate", Today.ToString("yyyy-MM-dd"))
                cmd.Parameters.AddWithValue("@modpor", CStr(Session("User")))
                cmd.Parameters.AddWithValue("@info", tx_Información.Text)
                cmd.Parameters.AddWithValue("@precio", tx_Precio.Text)
                cmd.Parameters.AddWithValue("@IdPlato", CInt(cbo_Nombre_Plato.SelectedValue))
                cmd.Parameters.AddWithValue("@UrlImagen", Image1.ImageUrl)

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

                Dim cmd As New SqlCommand("SP_BOR_PLATO ", con)

                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@IdPlato", CInt(cbo_Nombre_Plato.SelectedValue))
                MsgBox(cbo_Nombre_Plato.SelectedValue)
                cmd.ExecuteNonQuery()

                con.Close()

                MsgBox("Datos Eliminados con éxito.")

            Catch ex As Exception
                MsgBox(ex.ToString)
            End Try

            Response.Redirect("MenuAdministrador.aspx")

        End If
    End Sub
    Protected Sub cbo_Categoria_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cbo_Categoria.SelectedIndexChanged
        cargarPlatos(cbo_Categoria.SelectedValue)
    End Sub

    Private Function Redimensionar(stream As System.IO.Stream) As System.Drawing.Image
        Dim img As System.Drawing.Image = System.Drawing.Image.FromStream(stream)
        Dim consulta As Common = New Common
        Dim maxw As String = consultaParametro("MAXW", CStr(Session("sessStrCon")))
        Dim maxh As String = consultaParametro("MAXH", CStr(Session("sessStrCon")))
        Dim h As Integer = img.Height
        Dim w As Integer = img.Width
        Dim newH, newW As Integer

        '  If (h > w And w > max) Then
        '   newH = max
        '  newW = (w * max) / h
        ' ElseIf (w > h And w > max) Then
        'newW = max
        'newH = (h * max) / w
        'Else
        newH = CInt(maxh)
        newW = CInt(maxw)
        'End If
        If (h <> newH And w <> newW) Then
            Dim newImg As Bitmap = New Bitmap(img, newW, newH)
            Dim g As Graphics = Graphics.FromImage(newImg)
            g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBilinear
            g.DrawImage(img, 0, 0, newImg.Width, newImg.Height)
            Return newImg
        Else
            Return img
        End If




    End Function

    Public Sub btn_Imagen_Click(sender As Object, e As EventArgs) Handles btn_Imagen.Click
        filename = System.IO.Path.GetFileName(AsyncFileUpload1.FileName)
        'AsyncFileUpload1.SaveAs(Server.MapPath("Images/Transicion/" + CStr(Session("User")+"/") + filename)
        Dim img As System.Drawing.Image = Redimensionar(AsyncFileUpload1.FileContent)
        transicion = Server.MapPath("Images/")
        If Not My.Computer.FileSystem.DirectoryExists(transicion) Then
            My.Computer.FileSystem.CreateDirectory(transicion)
        End If
        ' My.Computer.FileSystem.(Server.MapPath())
        img.Save(transicion + filename)
        Image1.ImageUrl = "~/images/" + filename
        ' Image1.ImageUrl = transicion + filename
        '  My.Computer.FileSystem.CopyFile(
        '             Server.MapPath(Image1.ImageUrl.ToString),
        '            Server.MapPath("Images/menu/CATEGORIAS/" & cbo_Categoria.SelectedItem.ToString & "/" & tx_Nom.Text) & "/01.jpg")
    End Sub
    Protected Sub cbo_Nombre_Plato_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cbo_Nombre_Plato.SelectedIndexChanged
        Dim intNumTotReg As Integer
        Try
            con = New SqlConnection(CStr(Session("sessStrCon")))
            con.Open()

            strSQL = "select PL.Tiempo, PL.Precio, PL.informacion,PL.IdPLatCat, PL.urlImagen "
            strSQL = strSQL & "from tbm_Platos as PL, tbm_Platos_Categoria as PC "
            strSQL = strSQL & "where PL.IdPlatCat = PC.IdPlatCat And PL.IdPlato = " & CInt(cbo_Nombre_Plato.SelectedValue)
            sda = New SqlDataAdapter(strSQL, con)
            dtbbusA = New DataTable
            sda.Fill(dtbbusA)

            intNumTotReg = dtbbusA.Rows.Count

            If intNumTotReg <> 1 Then
                MsgBox("Muchos Registro repetidos")
            Else
                cbo_Categoria.SelectedValue = dtbbusA.Rows(0).Item(3)
                tx_Tiempo.Text = CStr(dtbbusA.Rows(0).Item(0))
                tx_Precio.Text = dtbbusA.Rows(0).Item(1)
                tx_Información.Text = dtbbusA.Rows(0).Item(2)
                Image1.ImageUrl = dtbbusA.Rows(0).Item(4)
            End If
            dtbbusA.Clear()
            con.Close()
        Catch ex As Exception
            MsgBox("Excepción: " & ex.ToString)
        End Try
    End Sub


End Class
