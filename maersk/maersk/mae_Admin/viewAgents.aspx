<%@ Page Title="View agents" Language="C#" MasterPageFile="~/mae_Admin/adminMasterPage.Master" AutoEventWireup="true" CodeBehind="viewAgents.aspx.cs" Inherits="maersk.mae_Admin.viewAgents" ClientIDMode="Inherit" %>
<asp:Content ID="BodyContent" runat="server"  ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
<div class="row">
        <div class="col-md-12">
                <div class="form-horizontal">
                    <h4>View agent information.</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    
                    <asp:GridView ID="GridView1" runat="server" EmptyDataText="No records found" AutoGenerateColumns="False" DataKeyNames="Username" DataSourceID="SqlDataSource1" AllowSorting="True">
                        <Columns>
                            <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" SortExpression="Username" />
                            <asp:BoundField DataField="Agent Email Address" HeaderText="Agent Email Address" SortExpression="Agent Email Address" />
                            <asp:BoundField DataField="Agent Name" HeaderText="Agent Name" SortExpression="Agent Name" />
                            <asp:BoundField DataField="Contact Number" HeaderText="Contact Number" SortExpression="Contact Number" />
                            <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company" />
                            <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                            <asp:BoundField DataField="PostalCode" HeaderText="PostalCode" SortExpression="PostalCode" />
                        </Columns>
                    </asp:GridView>
                 
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" 
                        SelectCommand="SELECT agent.username AS Username,
                         agent.email AS [Agent Email Address], agent.name AS [Agent Name], agent.number AS [Contact Number], 
                        agentCompany.Company, agentCompany.Department, agentCompany.Country, agentCompany.Address, agentCompany.City, 
                        agentCompany.State, agentCompany.PostalCode FROM agent INNER JOIN agentCompany
                         ON agent.username = agentCompany.username"></asp:SqlDataSource>
                 
                </div>
             <%--</section>--%>
        </div>

        <div class="col-md-4">
       </div>
    </div>
</asp:Content>
