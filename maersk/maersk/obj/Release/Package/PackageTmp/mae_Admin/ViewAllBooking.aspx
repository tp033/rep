<%@ Page Title="View All Booking" Language="C#" MasterPageFile="~/mae_Admin/adminMasterPage.Master" AutoEventWireup="true" CodeBehind="ViewAllBooking.aspx.cs" Inherits="maersk.mae_Admin.ViewAllBooking" %>
<asp:Content ID="BodyContent" runat="server"  ContentPlaceHolderID="MainContent">
    <h2><%: Title %> </h2>
<div class="row">
        <div class="col-md-12">
                <div class="form-horizontal">
                  
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    
                    <asp:GridView ID="GridView1" runat="server" EmptyDataText="No records found" AutoGenerateColumns="False" DataKeyNames="BookingId,scheduleId,agentUsername" DataSourceID="SqlDataSource1" AllowSorting="True" OnRowCommand="GridView1_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="BookingId" HeaderText="Booking ID" ReadOnly="True" SortExpression="BookingId" InsertVisible="False" />
                            <asp:BoundField DataField="scheduleId" HeaderText="Schedule ID" SortExpression="scheduleId" />
                            <asp:BoundField DataField="custId" HeaderText="Customer ID" SortExpression="custId" />
                            <asp:BoundField DataField="ItemName" HeaderText="Item Name" SortExpression="ItemName" />
                            <asp:BoundField DataField="ItemWeight" HeaderText="Item Weight" SortExpression="ItemWeight" />
                            <asp:BoundField DataField="containerType" HeaderText="Container Type" SortExpression="containerType" />
                            <asp:BoundField DataField="commodity" HeaderText="Commodity" SortExpression="commodity" />
                            <asp:BoundField DataField="ContainerQuantity" HeaderText="Container Quantity" SortExpression="ContainerQuantity" />
                            <asp:BoundField DataField="isFragile" HeaderText="Fragile" SortExpression="isFragile" />
                            <asp:BoundField DataField="agentUsername" HeaderText="Agent" SortExpression="agentUsername" />
                           
                             <asp:CommandField SelectText="View Schedule" ShowSelectButton="True"></asp:CommandField>
                        </Columns>
                    </asp:GridView>
                 
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>"
                        SelectCommand="SELECT * FROM [Booking]"></asp:SqlDataSource>
                 
                    <br />
                 
                </div>
            <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="sID" CssClass="col-md-2 control-label">Selected Schedule ID</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="sID" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="sID"
                                CssClass="text-danger" ErrorMessage="The Selected Schedule ID field is required." />
                        </div>
                    </div>
              <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="bID" CssClass="col-md-2 control-label">Selected Booking ID</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="bID" CssClass="form-control" />
                            <br />
                            </div>
                    </div>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="scheduleId" DataSourceID="dsScheduleDetails">
                <Columns>
                    <asp:BoundField DataField="scheduleId" HeaderText="Schedule ID" ReadOnly="True" InsertVisible="False" SortExpression="scheduleId"></asp:BoundField>
                    <asp:BoundField DataField="vessel" HeaderText="Vessel" SortExpression="vessel"></asp:BoundField>
                    <asp:BoundField DataField="fromLoc" HeaderText="From" SortExpression="fromLoc"></asp:BoundField>
                    <asp:BoundField DataField="frarr" HeaderText="From Location Arrival date/time" SortExpression="frarr"></asp:BoundField>
                    <asp:BoundField DataField="frdept" HeaderText="From Location Depature date/time" SortExpression="frdept"></asp:BoundField>
                    <asp:BoundField DataField="toLoc" HeaderText="To" SortExpression="toLoc"></asp:BoundField>
                    <asp:BoundField DataField="toarr" HeaderText="To Location Arrival date/time" SortExpression="toarr"></asp:BoundField>
                    <asp:BoundField DataField="todept" HeaderText="To Location Departure date/time" SortExpression="todept"></asp:BoundField>
                    <asp:BoundField DataField="space" HeaderText="Space Available" SortExpression="Space Available"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="dsScheduleDetails" ConnectionString='<%$ ConnectionStrings:connString %>' SelectCommand="SELECT * FROM [schedule] WHERE ([scheduleId] = @scheduleId)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="sID" PropertyName="Text" Name="scheduleId" Type="Int32"></asp:ControlParameter>
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:Label ID="lblSelectedAgent" runat="server" Text="Label" Visible="False"></asp:Label>

                <br />

            <asp:GridView ID="GridView3" runat="server" DataSourceID="dsAgentDetails" AutoGenerateColumns="False" DataKeyNames="Agent Username">
                <Columns>
                    <asp:BoundField DataField="Agent Username" HeaderText="Agent Username" ReadOnly="True" SortExpression="Agent Username"></asp:BoundField>
                    <asp:BoundField DataField="Agent Name" HeaderText="Agent Name" SortExpression="Agent Name"></asp:BoundField>
                    <asp:BoundField DataField="Contact Number" HeaderText="Contact Number" SortExpression="Contact Number"></asp:BoundField>
                    <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company"></asp:BoundField>
                    <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="dsAgentDetails" runat="server" ConnectionString='<%$ ConnectionStrings:connString %>' ProviderName="System.Data.SqlClient" SelectCommand="SELECT agentCompany.username AS [Agent Username], agent.name AS [Agent Name], agent.number AS [Contact Number], agentCompany.Company, agentCompany.Department FROM agent INNER JOIN agentCompany ON agent.username = agentCompany.username WHERE (agent.username = @agentUsername)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lblSelectedAgent" PropertyName="Text" Name="agentUsername"></asp:ControlParameter>
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

        
    </div>
</asp:Content>
