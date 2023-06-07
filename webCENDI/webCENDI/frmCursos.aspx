<%@ Page Title="" Language="C#" MasterPageFile="~/frmPrincipal.Master" AutoEventWireup="true" CodeBehind="frmCursos.aspx.cs" Inherits="webCENDI.WebForm3" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    <table class="auto-style9">
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style3">DETALLE DE CURSOS</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style10">EDICION DE CURSO</td>
            <td class="auto-style10">CURSO</td>
            <td class="auto-style11">TEMAS</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:GridView ID="GridView1" runat="server">
                    <Columns>
                        <asp:ButtonField ButtonType="Button" CommandName="Cancel" Text="◙" />
                    </Columns>
                </asp:GridView>
            </td>
            <td class="auto-style3">
                <asp:GridView ID="GridView2" runat="server">
                    <Columns>
                        <asp:ButtonField ButtonType="Button" CommandName="Cancel" Text="◙" />
                    </Columns>
                </asp:GridView>
            </td>
            <td>
                <asp:ListBox ID="ListBox1" runat="server" Height="139px" Width="251px">
                    <asp:ListItem>Tema 1</asp:ListItem>
                    <asp:ListItem>Tema 2</asp:ListItem>
                    <asp:ListItem>Tema 3</asp:ListItem>
                    <asp:ListItem>Tema 4</asp:ListItem>
                    <asp:ListItem>Tema 5</asp:ListItem>
                    <asp:ListItem>Tema 6</asp:ListItem>
                    <asp:ListItem>Tema 7</asp:ListItem>
                    <asp:ListItem>Tema 8</asp:ListItem>
                    <asp:ListItem>Tema 9</asp:ListItem>
                </asp:ListBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content6" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style9 {
            width: 100%;
        }
        .auto-style10 {
            width: 300px;
            text-align: center;
        }
        .auto-style11 {
            text-align: center;
        }
    </style>
</asp:Content>

