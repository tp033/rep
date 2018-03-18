<%@ Page Title="View Schedule" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewSchedule.aspx.cs" Inherits="maersk.ViewSchedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <h2><%: Title %> </h2>
<div class="row">
        <div class="col-md-12">
                <div class="form-horizontal">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="scheduleId" DataSourceID="SqlDataSource1" AllowSorting="True">
                        <Columns>
                            <asp:BoundField DataField="scheduleId" HeaderText="Schedule ID" InsertVisible="False" ReadOnly="True" SortExpression="scheduleId" />
                            <asp:BoundField DataField="vessel" HeaderText="Vessel" SortExpression="vessel" />
                            <asp:BoundField DataField="fromLoc" HeaderText="From" SortExpression="fromLoc" />
                            <asp:BoundField DataField="frarr" HeaderText="From Location Arrival date/time" SortExpression="frarr" />
                            <asp:BoundField DataField="frdept" HeaderText="From Location Depature date/time " SortExpression="frdept" />
                            <asp:BoundField DataField="toLoc" HeaderText="To" SortExpression="toLoc" />
                            <asp:BoundField DataField="toarr" HeaderText="To Location Arrival date/time " SortExpression="toarr" />
                            <asp:BoundField DataField="todept" HeaderText="To Location Departure date/time " SortExpression="todept" />
                            <asp:BoundField DataField="space" HeaderText="Space Available" SortExpression="space" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="SELECT * FROM [schedule]"></asp:SqlDataSource>
                    </div>
            </div></div>
</asp:Content>
