
Imports System.Data.SqlClient
Imports System.Data
Imports System.Drawing
Imports Common
Partial Class ActulizarPlatos
    Inherits System.Web.UI.Page
    Public strSQL As String
    Public con As System.Data.SqlClient.SqlConnection
    Public sda As System.Data.SqlClient.SqlDataAdapter
    Public dtb As System.Data.DataTable
    Public intIdPlaCat As Integer
    Public filename As String
    Dim transicion As String



    Protected Sub BtnLimpiar_Click(sender As Object, e As EventArgs) Handles BtnLimpiar.Click
        limpiar()
    End Sub

    Public Sub limpiar()

        TxtNombre.Text = ""
        CmbActivo.SelectedValue = "A"
        LblMnesajes.Text = ""
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

    Protected Sub BtnGuardar_Click(sender As Object, e As EventArgs) Handles BtnGuardar.Click
        LblMensaje2.Text = ""
        If ValidadCampos() Then
            con = New SqlConnection(CStr(Session("sessStrCon")))
            Dim cmd As New SqlCommand("SP_ACTUALIZA_CATEGORIAS", con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add("@IdPlatCat", SqlDbType.Int).Value = intIdPlaCat


            cmd.Parameters.Add("@Nombre", SqlDbType.VarChar, 30).Value = Me.TxtNombre.Text
            cmd.Parameters.Add("@Estado", SqlDbType.VarChar, 10).Value = Me.CmbActivo.SelectedValue
            cmd.Parameters.Add("@Url", SqlDbType.VarChar, 100).Value = Image1.ImageUrl

            ' valido q control envio, depende si voy actualziar o guardar un nuevo plato
            'If CmbCategoria.SelectedIndex <> 0 And CmbPlatos.SelectedIndex <> 0 Then
            'cmd.Parameters.Add("@Control", SqlDbType.Int).Value = 1
            'Else
            cmd.Parameters.Add("@Control", SqlDbType.Int).Value = 2
            'End If
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
        End If
        Return True
    End Function






    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        ' llenarComboxCate(0)
    End Sub
End Class
