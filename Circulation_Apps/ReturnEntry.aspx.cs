using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class ReturnEntry : System.Web.UI.Page
{
    clsDataProvider dataProvider = new clsDataProvider();
    protected void Page_Load(object sender, EventArgs e)
    {
        lblRmName.Text = this.Session["UserName"].ToString();


        if (!IsPostBack)
        {
            bindAgent();
          

        }

    }


    # region All Private Method

    protected void MyTrace(string msg)
    {
        Response.Write("<script>alert('"+msg+"')</script>");
    }
    protected void ddlAgntName_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadData();
    }
    protected void btnSaveOrder_Click(object sender, EventArgs e)
    {
        int returnNumber;



        string selIsNull = "SELECT COUNT(*) from returnEntry ";
        int rowNull = Convert.ToInt32(dataProvider.getResultString(selIsNull));

        if (rowNull == 0)
        {
            returnNumber = 1;
        }
        else
        {
            string selReNo = "SELECT MAX(returnNo) from returnEntry";
            returnNumber = Convert.ToInt32(dataProvider.getResultString(selReNo));

            returnNumber = returnNumber + 1;
        }


        

            foreach (GridViewRow gridRow in grdOrder.Rows)
            {
                string station = gridRow.Cells[1].Text;
                //TextBox txtQuantity = gridRow.Cells[2].FindControl("txtQuantity") as TextBox;
                //TextBox txtBonus = gridRow.Cells[3].FindControl("txtBonus") as TextBox;
              //  TextBox txtAdditionalReturn = gridRow.Cells[4].FindControl("txtAdditionalReturn") as TextBox;
                TextBox txtReturnCopy = gridRow.Cells[3].FindControl("txtReturnCopy") as TextBox;
                DropDownList ddlReason = gridRow.Cells[4].FindControl("ddlReason") as DropDownList;

                //string returnno = txtReturnNumber.Text;
                string returnDate = txtOdrDate.Text;
                int quantity = Convert.ToInt32(gridRow.Cells[2].Text);
                int bonus = 0;//Convert.ToInt32(gridRow.Cells[3].Text);
                int additional = 0;//Convert.ToInt32(txtAdditionalReturn.Text);
                int returnCopy = Convert.ToInt32(txtReturnCopy.Text);
              //  DateTime createDate = Convert.ToDateTime(DateTime.Now);
                string auditUser = Session["UserName"].ToString();
                string createDate = DateTime.Now.ToString("dd-MMM-yyyy");

                string insertQuery = "insert into returnEntry values('" + returnNumber + "','" + returnDate + "','0','" + station + "','" + quantity + "','" + bonus + "','" + additional + "','" + returnCopy + "','" + ddlReason.SelectedItem.Text + "', '" + createDate + "', '" + auditUser + "')";

                //SqlDataAdapter da = new SqlDataAdapter();
               // DataSet ds = new DataSet();
                //ds = dataProvider.getDataSet(insertQuery, "returnEntry");
                dataProvider.ExecuteCommand(insertQuery);
                

            }

           MyTrace("Saved Successfully");
       
            loadData();

            

    }

    
    # endregion

    #region Binding

    private void loadData()
    {

        string strSelCustId = "select distinct custId from CustNameForRMOrder where CustomerName='" + ddlAgntName.SelectedItem.Text + "'";
        string strCustID = dataProvider.getResultString(strSelCustId);



        string strCusNmae = "Select stationId,stationName,(daywiseDefQuanttity+daywiseChngQuantity+smsQuantity+quantity) as quantity from ReturnCapture where CustomerId='" + strCustID + "' and OrderDate='" + txtOdrDate.Text.ToString() + "' and stationName NOT IN (Select stationName from returnEntry where CustomerId='" + strCustID + "') Order by sortingOrder asc";
        //string CusName = dataProvider.getResultString(strCusNmae);

        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strCusNmae, "ReturnEntry");
        grdOrder.DataSource = ds;
        grdOrder.DataBind();

        foreach (GridViewRow gvrItem in grdOrder.Rows)
        {
            //TextBox txtQuantity = gvrItem.Cells[2].FindControl("txtQuantity") as TextBox;
            //TextBox txtBonus = gvrItem.Cells[3].FindControl("txtBonus") as TextBox;
            //TextBox txtAdditionalReturn = gvrItem.Cells[2].FindControl("txtAdditionalReturn") as TextBox;
            TextBox txtReturnCopy = gvrItem.Cells[2].FindControl("txtReturnCopy") as TextBox;
            DropDownList ddlReason = gvrItem.Cells[3].FindControl("ddlReason") as DropDownList;

            string query = "SELECT  reasonDetails from reasonOfUnsold where delStatus<>1 and reasonType='Return' Order By reasonDetails ASC ";
            DataSet ds1 = new DataSet();
            ds1 = dataProvider.getDataSet(query, "reasonDetails");
            ddlReason.DataSource = ds1;
            ddlReason.DataTextField = "reasonDetails";
            ddlReason.DataValueField = "reasonDetails";
            ddlReason.DataBind();

            ddlReason.Items.Insert(0, new ListItem("N/A", "0"));


            //txtAdditionalReturn.Text = "0";
            txtReturnCopy.Text = "0";
        }


        
    }


    private void bindAgent()
    {
        string query = "SELECT distinct CustomerName from CustNameForRMOrder where userName='" + this.Session["UserName"].ToString() + "' Order By CustomerName ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "CustomerName");
        ddlAgntName.DataSource = ds;
        ddlAgntName.DataTextField = "CustomerName";
        ddlAgntName.DataValueField = "CustomerName";
        ddlAgntName.DataBind();
        ddlAgntName.Items.Insert(0, "-- Select --");
    }

    #endregion


    #region Grid View

    protected void grdOrder_RowCreated(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.Header)
        {
            GridView HeaderGrid = (GridView)sender;
            GridViewRow HeaderGridRow = new GridViewRow(0, 0, DataControlRowType.Header,DataControlRowState.Insert);

            //HeaderGridRow.BackColor = System.Drawing.ColorTranslator.FromHtml("#DBDACE");
            //HeaderGridRow.ForeColor = System.Drawing.Color.Black;

            TableCell HeaderCell = new TableCell();

            HeaderCell = new TableCell();
            HeaderCell.Text = "ID";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = false;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Station Name";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Quantity";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            //HeaderCell = new TableCell();
            //HeaderCell.Text = "Bonus Copy";
            //HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            //HeaderCell.Font.Bold = true;
            ////HeaderCell.ColumnSpan = 2;
            //HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Regular Return";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;



            HeaderCell = new TableCell();
            HeaderCell.Text = "Reason of Return";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);


            grdOrder.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }
    protected void grdOrder_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false;
        }
    }


    #endregion

   
}

