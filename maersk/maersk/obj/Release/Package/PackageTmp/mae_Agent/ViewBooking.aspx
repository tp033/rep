<%@ Page Title="View Booking" Language="C#" MasterPageFile="~/mae_Agent/agentMasterPage.Master" AutoEventWireup="true" CodeBehind="ViewBooking.aspx.cs" Inherits="maersk.mae_Agent.ViewBooking" %>
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
                    
                    <asp:GridView ID="GridView1" runat="server" EmptyDataText="No records found" AutoGenerateColumns="False" DataKeyNames="BookingId,scheduleId" DataSourceID="SqlDataSource1" AllowSorting="True" OnRowCommand="GridView1_RowCommand">
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
                            
                            <asp:CommandField SelectText="View Schedule" ShowSelectButton="True"></asp:CommandField>
                        
                        </Columns>
                    </asp:GridView>
                 
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>"
                        SelectCommand="SELECT * FROM [Booking] WHERE ([agentUsername] = @agentUsername)">
                        <SelectParameters>
                            <asp:SessionParameter SessionField="agentUsername" Name="agentUsername" Type="String"></asp:SessionParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                 
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
                    <asp:BoundField DataField="space" HeaderText="Space Available" SortExpression="space"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="dsScheduleDetails" ConnectionString='<%$ ConnectionStrings:connString %>' SelectCommand="SELECT * FROM [schedule] WHERE ([scheduleId] = @scheduleId)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="sID" PropertyName="Text" Name="scheduleId" Type="Int32"></asp:ControlParameter>
                </SelectParameters>
            </asp:SqlDataSource>
        </div>

        
    </div>
</asp:Content>
