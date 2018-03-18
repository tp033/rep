<%@ Page Title="Register Item" Language="C#" MasterPageFile="~/mae_Agent/agentMasterPage.Master" AutoEventWireup="true" CodeBehind="registerItem.aspx.cs" Inherits="maersk.mae_Agent.registerItem" %>
<asp:Content ID="BodyContent" runat="server"  ContentPlaceHolderID="MainContent" >
    <h2><%: Title %></h2>
<div class="row">
        <div class="col-md-12">
                <div class="form-horizontal">
                    <h4>Register item by completing this form.</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <h4>Item details</h4>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="scheduleId" DataSourceID="SqlDataSource1" AllowSorting="True" OnRowCommand="GridView1_RowCommand" PageSize="5">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
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
                       <div class="form-group">
                           <br />
                        <asp:Label runat="server" AssociatedControlID="sID" CssClass="col-md-2 control-label">	Schedule ID	 </asp:Label>
                        <div class="col-md-10">
                            <asp:Textbox runat="server" ID="sID" CssClass="form-control" Enabled="False" ToolTip="Select from the table above" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="sID"
                                CssClass="text-danger" ErrorMessage="The Schedule ID field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="name" CssClass="col-md-2 control-label">Item name</asp:Label>
                        <div class="col-md-10">
                            <asp:Textbox runat="server" ID="name" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="name"
                                CssClass="text-danger" ErrorMessage="The item name field is required." />
                        </div>
                    </div>
                 <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="ddl_owner" CssClass="col-md-2 control-label">Item owner</asp:Label>
                        <div class="col-md-10">
                            <asp:DropDownList ID="ddl_owner" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="custId" DataValueField="custId" AppendDataBoundItems="True">
                                <asp:ListItem Selected="True" disabled="" Value="none"> Select customer's NRIC/passport Number</asp:ListItem>
                            </asp:DropDownList> 
                            <asp:RequiredFieldValidator ID="ddl_ownerFieldValidator" runat="server" ErrorMessage="Select customer's NRIC/passport Number"
                                 InitialValue="none" ControlToValidate="ddl_owner" CssClass="text-danger"></asp:RequiredFieldValidator>


                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" SelectCommand="SELECT [custId] FROM [customer] WHERE ([agentUsername] = @agentUsername)">
                                <SelectParameters>
                                    <asp:SessionParameter SessionField="agentUsername" Name="agentUsername" Type="String"></asp:SessionParameter>
                                </SelectParameters>
                            </asp:SqlDataSource>
                           
                        </div>
                    </div>
                   <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="weight" CssClass="col-md-2 control-label">Item Weight (kg - cargo only)</asp:Label>
                        <div class="col-md-10">
                            <asp:Textbox runat="server" ID="weight" CssClass="form-control" TextMode="Number" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="weight"
                                CssClass="text-danger" ErrorMessage="The weight field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="quantity" CssClass="col-md-2 control-label">Container Quantity</asp:Label>
                        <div class="col-md-10">
                            <asp:Textbox runat="server" ID="quantity" CssClass="form-control" TextMode="Number" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="quantity"
                                CssClass="text-danger" ErrorMessage="The Container Quantity field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="container_type" CssClass="col-md-2 control-label">Container Type</asp:Label>
                        <div class="col-md-10">
                           <select id="container_type" name="container_type" CssClass="form-control" runat="server">
                               <option value="0" runat="server" selected="true" disabled="">Select container type</option>
                               <option value="20' Dry Standard" runat="server">20' Dry Standard</option>
                               <option value="40' Dry Standard" runat="server">40' Dry Standard</option>
                               <option value="20' Reefer Standard" runat="server">20' Reefer Standard</option>
                               <option value="40' Flat Standard" runat="server">40' Flat Standard</option>
                               
                           </select>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select Container Type"
                                 InitialValue="0" ControlToValidate="container_type" CssClass="text-danger" ></asp:RequiredFieldValidator>

                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="commodity" CssClass="col-md-2 control-label">Select commodity</asp:Label>
                        <div class="col-md-10">
                          <select id="commodity" name="commodity" runat="server" CssClass="form-control">
                             <option value="0" runat="server" selected="true" disabled="">Select commodity</option>
                            
                            <option value="Dry cargo" runat="server">Dry cargo</option>
                            <option value="Chilled"  runat="server">Chilled </option>
                            <option value="Frozen" runat="server">Frozen </option></select>
                   <asp:RequiredFieldValidator runat="server" InitialValue="0" ControlToValidate="commodity" CssClass="text-danger" ErrorMessage="The commodity is required." />
                        </div>
                        
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="isFragile" CssClass="col-md-2 control-label">Check for Fragile item</asp:Label>
                        <div class="col-md-10">
                            <asp:CheckBox ID="isFragile" runat="server" Text=" Fragile" />
                              </div>
                        
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                           <asp:Button runat="server" Text="Register Item and Booking" CssClass="btn btn-default" ID="regItem" OnClick="regItem_Click"  />
                        </div> 
                    </div>
                </div>
        </div>

        <div class="col-md-4">
                   
       </div>
    </div>
</asp:Content>
