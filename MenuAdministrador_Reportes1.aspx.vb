
Partial Class MenuAdministrador_Reportes1
    Inherits System.Web.UI.Page

    Private Sub MenuAdministrador_Reportes1_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Calendar1.Visible = False
            Calendar2.Visible = False
            GridView2.Visible = False



        End If
    End Sub

    Protected Sub cal1_Click(sender As Object, e As ImageClickEventArgs) Handles cal1.Click
        If Calendar1.Visible Then
            Calendar1.Visible = False

        Else
            Calendar1.Visible = True

        End If

    End Sub
    Protected Sub cal2_Click(sender As Object, e As ImageClickEventArgs) Handles cal2.Click
        If Calendar2.Visible Then
            Calendar2.Visible = False

        Else
            Calendar2.Visible = True

        End If
    End Sub
    Protected Sub Calendar1_SelectionChanged(sender As Object, e As EventArgs) Handles Calendar1.SelectionChanged
        txInicio.Text = Calendar1.SelectedDate.ToShortDateString()
        Calendar1.Visible = False
    End Sub
    Protected Sub Calendar2_SelectionChanged(sender As Object, e As EventArgs) Handles Calendar2.SelectionChanged
        txFinal.Text = Calendar2.SelectedDate.ToShortDateString()
        Calendar2.Visible = False
        GridView1.Visible = True
        GridView2.Visible = False
    End Sub
    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged

    End Sub
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        GridView1.Visible = True
    End Sub
    Protected Sub SqlDataSource3_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource3.Selecting

    End Sub
    Protected Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting

    End Sub
    Protected Sub GridView2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView2.SelectedIndexChanged

    End Sub
    Protected Sub btnBuscar_Click(sender As Object, e As EventArgs) Handles btnBuscar.Click

        GridView2.Visible = True
        GridView1.Visible = False


    End Sub

    Private Sub cboChef_TextChanged(sender As Object, e As EventArgs) Handles cboChef.TextChanged
        GridView1.Visible = True
        GridView2.Visible = False
    End Sub
End Class
