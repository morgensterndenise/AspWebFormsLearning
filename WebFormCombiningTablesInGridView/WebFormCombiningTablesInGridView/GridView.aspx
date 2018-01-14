<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridView.aspx.cs" Inherits="WebFormCombiningTablesInGridView.GridView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
<%--  drop down list;  https://www.aspsnippets.com/Articles/How-to-populate-DropDownList-in-GridView-in-ASPNet.aspx
    https://msdn.microsoft.com/en-us/library/ms178294.aspx
   code behind  https://forums.asp.net/t/1113230.aspx?code+behind+GridView+edit
    --%>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="gvAuthors" DataKeyNames="Id" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                <Columns>
                     <asp:CommandField ShowEditButton="True" />
                     <asp:BoundField DataField="Id" HeaderText="AuthorId" SortExpression="Id" readonly="true"/>
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:TemplateField HeaderText="copies">
                        <ItemTemplate>
                            <asp:DropDownList ID="ddListCopies" runat="server" DataSourceID="SqlDataSource3" DataTextField="Copies" DataValueField="Copies">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField> 
                  
                </Columns>
            </asp:GridView>
          <%--  https://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.sqldatasource.updatecommand(v=vs.110).aspx--%>
          <%--  if its oracle instead of @ we write ? ->see the second example in the link--%>
          
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BookShopSystemConnectionString %>" 
                SelectCommand="SELECT Authors.Id, Authors.FirstName, Authors.LastName, Books.Title, Books.Price, Books.Id FROM Authors INNER JOIN Books ON Books.Author_Id = Authors.Id"
               UpdateCommand="UPDATE Authors SET FirstName = @FirstName, LastName = @LastName  FROM Authors INNER JOIN Books ON Authors.Id = Books.Author_Id
                WHERE Authors.Id = @Id"
                OnUpdated="OnDSUpdatedHandler" DataSourceMode="DataSet"></asp:SqlDataSource>

            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BookShopSystemConnectionString %>" SelectCommand="SELECT [Copies] FROM [Books]"></asp:SqlDataSource>
            <asp:Label ID="lblUpdate" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
