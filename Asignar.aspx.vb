Imports System.Data
Imports System.Data.SqlClient

Partial Class _Default
    Inherits System.Web.UI.Page
    Public con As SqlConnection
    Public sda, sdaA As SqlDataAdapter
    Public dtb, dtbA As DataTable
    Public cate, strSQL As String

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        'Se establece la conexion
        con = New SqlConnection(CStr(Session("sessStrCon")))
        cate = Request.QueryString.GetValues("v1")(0)
        TextBox2.Text = cate

        Try
            con = New SqlConnection(CStr(Session("sessStrCon")))
            con.Open()
            strSQL = "SELECT * "
            strSQL = strSQL & " FROM tbm_transicion "
            strSQL = strSQL & " WHERE Idordendetalle = " & CInt(cate)
            sdaA = New SqlDataAdapter(strSQL, con)
            dtbA = New DataTable
            sdaA.Fill(dtbA)

        Catch ex As Exception
            MsgBox("Excepción: " & ex.ToString)
        End Try

        If dtbA.Rows(0).Item(5) = 0 Then
            DropDownList1.Visible = True
            TextBox1.Visible = False
            Try
                con = New SqlConnection(CStr(Session("sessStrCon")))
                con.Open()


                strSQL = "select p.idpersona, p.nombres "
                strSQL = strSQL & "from tbm_personas as p, tbm_empleados as e "
                strSQL = strSQL & "where p.idpersona=e.IdPersona and e.Tipo= 'Chef'"

                sda = New SqlDataAdapter(strSQL, con)
                dtb = New DataTable
                sda.Fill(dtb)

                DropDownList1.Items.Clear()
                For i = 0 To dtb.Rows.Count - 1
                    DropDownList1.Items.Add(New ListItem(dtb.Rows(i).Item(1), dtb.Rows(i).Item(0)))
                Next

            Catch ex As Exception
                MsgBox("Excepción: " & ex.ToString)
            End Try
            TextBox1.Text = ""
        Else
            DropDownList1.Visible = False
            TextBox1.Visible = True
            Try
                con = New SqlConnection(CStr(Session("sessStrCon")))
                con.Open()


                strSQL = "select p.nombres "
                strSQL = strSQL & " tbm_empleados as e "
                strSQL = strSQL & " where p.idpersona= " & CInt(dtbA.Rows(0).Item(5))
                sda = New SqlDataAdapter(strSQL, con)
                dtb = New DataTable
                sda.Fill(dtb)

                TextBox1.Text = dtb.Rows(0).Item(0)

            Catch ex As Exception
                MsgBox("Excepción: " & ex.ToString)
            End Try
            TextBox1.Text = ""
        End If

        


    End Sub

    Public intNumFilIns As Integer
    
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If TextBox1.Text = "" Then
            Try
                con = New SqlConnection(CStr(Session("sessStrCon")))
                con.Open()
                strSQL = "Update tbm_transicion "
                strSQL = strSQL & " set idChef= " & DropDownList1.SelectedValue
                strSQL = strSQL & " WHERE Idordendetalle = " & CInt(cate)
                sdaA.UpdateCommand = New SqlCommand(strSQL, con)
                sda.InsertCommand.ExecuteNonQuery()

            Catch ex As Exception
                MsgBox("Excepción: " & ex.ToString)
            End Try
        End If
        Response.Redirect("MenuConcina.aspx")
    End Sub
End Class
