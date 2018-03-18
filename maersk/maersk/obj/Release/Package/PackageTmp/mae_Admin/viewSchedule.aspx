<%@  Page Title="View Schedule" Language="C#" MasterPageFile="~/mae_Admin/adminMasterPage.Master"  AutoEventWireup="true" CodeBehind="viewSchedule.aspx.cs" Inherits="maersk.mae_Admin.viewSchedule" %>

<asp:Content ID="BodyContent" runat="server"  ContentPlaceHolderID="MainContent">
    <h2><%: Title %></h2>
     


<div class="row">
        <div class="col-md-12">
            <%--<section id="loginForm">--%>
                <div class="form-horizontal">
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <%--<div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="filterCom" CssClass="col-md-2 control-label">Filter by country</asp:Label>
                        <div class="col-md-3">
                            <asp:DropDownList runat="server" ID="filterCom" CssClass="form-control" AutoPostBack="True" >
                                <asp:ListItem Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="filterCom"
                                CssClass="text-danger" ErrorMessage="The filter by is required." />
                         
                        </div>
                         <div class="col-md-3">
                            <asp:DropDownList runat="server" ID="DropDownList1" CssClass="form-control"  >
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="filterCom"
                                CssClass="text-danger" ErrorMessage="The filter by is required." />
                         
                        </div>
                        <div class="col-md-offset-2 col-md-10">
                           <asp:Button runat="server" Text="Search" CssClass="btn btn-default" ID="Search" />
                        </div>
                    </div>--%>

                    
                    <asp:GridView ID="GridView1" runat="server"
                         EmptyDataText="No records found" AllowSorting="True"
                           OnRowUpdating="OnRowUpdating" DataSourceID="SqlDataSource1" DataKeyNames="scheduleId" OnPreRender="GridView1_PreRender" AutoGenerateColumns="False"  >
                        <Columns>
                            <asp:BoundField DataField="scheduleId" HeaderText="Schedule ID" InsertVisible="False" ReadOnly="True" SortExpression="scheduleId" />
                            <asp:TemplateField HeaderText="Vessel" SortExpression="vessel">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("vessel") %>' CssClass="TextBox1"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("vessel") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="fromLoc" HeaderText="From" SortExpression="fromLoc" />
                            <asp:BoundField DataField="frarr" HeaderText="From Location Arrival date/time" SortExpression="frarr" />
                           
                            <asp:BoundField DataField="frdept" HeaderText="From Location Depature date/time" SortExpression="frdept" />
                            <asp:BoundField DataField="toLoc" HeaderText="To" SortExpression="toLoc" />
                            <asp:BoundField DataField="toarr" HeaderText="To Location Arrival date/time" SortExpression="toarr" />
                            <asp:BoundField DataField="todept" HeaderText="To Location Departure date/time" SortExpression="todept" />
                            <asp:TemplateField HeaderText="Space Available" SortExpression="space">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="space" runat="server" DataTextField="space" DataValueField="space" SelectedValue='<%# Bind("space") %>' >
                                        <asp:ListItem>10 days</asp:ListItem>
                                        <asp:ListItem>20 days</asp:ListItem>
                                        <asp:ListItem>30 days</asp:ListItem>
                                        <asp:ListItem>40 days</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("space") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                        </Columns>
                    
                  </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connString %>" 
                        SelectCommand="SELECT * FROM [schedule]" >
                        <UpdateParameters>
                            <asp:Parameter Name="scheduleId" />
                            <asp:Parameter Name="vessel" />
                            <asp:Parameter Name="fromLoc" />
                            <asp:Parameter Name="frarr" />
                            <asp:Parameter Name="frdept" />
                            <asp:Parameter Name="toLoc" />
                            <asp:Parameter Name="todept" />
                            <asp:Parameter Name="toarr" />
                            <asp:Parameter Name="space" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                
                </div>
             <%--</section>--%>
        </div>

        <div class="col-md-4">
       </div>
    </div>
</asp:Content>

