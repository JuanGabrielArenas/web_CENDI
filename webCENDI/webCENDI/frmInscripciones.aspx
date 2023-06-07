<%@ Page Title="" Language="C#" MasterPageFile="~/frmPrincipal.Master" AutoEventWireup="true" CodeBehind="frmInscripciones.aspx.cs" Inherits="webCENDI.WebForm2" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    <table class="auto-style9">
        <tr>
            <td class="auto-style10">INSCRIPCION DE MATRICULA</td>
            <td class="auto-style11">CURSO 2023-2</td>
            <td>NIF:</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" BorderStyle="Solid" Width="259px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Primer apellido<br />
                <asp:TextBox ID="TextBox2" runat="server" BorderStyle="Solid" Width="259px"></asp:TextBox>
            </td>
            <td class="auto-style3">Segundo apellido<br />
                <asp:TextBox ID="TextBox3" runat="server" BorderStyle="Solid" Width="259px"></asp:TextBox>
            </td>
            <td>Nombre completo<br />
                <asp:TextBox ID="TextBox4" runat="server" BorderStyle="Solid" Width="259px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Direccion<br />
                <asp:TextBox ID="TextBox5" runat="server" BorderStyle="Solid" Width="259px"></asp:TextBox>
            </td>
            <td class="auto-style3">Ciudad<br />
                <asp:ListBox ID="ListBox1" runat="server" Height="35px" Width="200px"></asp:ListBox>
            </td>
            <td>Fecha de nacimiento<br />
                <asp:TextBox ID="TextBox7" runat="server" BorderStyle="Solid" Width="259px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Telefono<br />
                <asp:TextBox ID="TextBox6" runat="server" BorderStyle="Solid" Width="259px"></asp:TextBox>
            </td>
            <td class="auto-style3">Telefono<br />
                <asp:ListBox ID="ListBox2" runat="server" Height="35px" Width="200px"></asp:ListBox>
            </td>
            <td>Forma de pago<br />
                <asp:TextBox ID="TextBox8" runat="server" BorderStyle="Solid" Width="259px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style12"></td>
            <td class="auto-style12"></td>
            <td class="auto-style13"></td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style3">LISTADO DE ASIGNATURAS</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView ID="GridView1" runat="server" Width="869px">
                    <Columns>
                        <asp:BoundField HeaderText="Codigo" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content6" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style9 {
            width: 100%;
        }
        .auto-style10 {
            text-align: right;
            width: 300px;
        }
        .auto-style11 {
            text-align: center;
            width: 300px;
        }
        .auto-style12 {
            width: 300px;
            height: 26px;
        }
        .auto-style13 {
            height: 26px;
        }
    </style>
</asp:Content>

