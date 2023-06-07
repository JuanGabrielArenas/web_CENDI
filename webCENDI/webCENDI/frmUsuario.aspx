<%@ Page Title="" Language="C#" MasterPageFile="~/frmPrincipal.Master" AutoEventWireup="true" CodeBehind="frmUsuario.aspx.cs" Inherits="webCENDI.WebForm4" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder4" runat="server">
    <table class="auto-style9">
        <tr>
            <td class="auto-style12"></td>
            <td class="auto-style11" colspan="2">ACCESO DE USUARIOS</td>
            <td class="auto-style13"></td>
        </tr>
        <tr>
            <td class="auto-style12"></td>
            <td class="auto-style22"></td>
            <td class="auto-style14"></td>
            <td class="auto-style13"></td>
        </tr>
        <tr>
            <td class="auto-style24"></td>
            <td class="auto-style25">Usuario:</td>
            <td class="auto-style26">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style27"></td>
        </tr>
        <tr>
            <td class="auto-style10">&nbsp;</td>
            <td class="auto-style23">Contraseña:</td>
            <td class="auto-style21">
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style10">&nbsp;</td>
            <td class="auto-style19">
                <asp:Button ID="btnIngresar" runat="server" Text="Ingresar" />
            </td>
            <td class="auto-style16">
                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style10">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style21">&nbsp;</td>
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
            width: 100px;
        }
        .auto-style11 {
            text-align: center;
            height: 26px;
        }
        .auto-style12 {
            width: 100px;
            height: 26px;
        }
        .auto-style13 {
            height: 26px;
        }
        .auto-style14 {
            height: 26px;
            width: 599px;
        }
        .auto-style16 {
            text-align: left;
            width: 599px;
        }
        .auto-style19 {
            text-align: center;
            width: 176px;
        }
        .auto-style21 {
            width: 599px;
        }
        .auto-style22 {
            width: 176px;
            height: 26px;
        }
        .auto-style23 {
            width: 176px;
        }
        .auto-style24 {
            width: 100px;
            height: 29px;
        }
        .auto-style25 {
            width: 176px;
            height: 29px;
        }
        .auto-style26 {
            width: 599px;
            height: 29px;
        }
        .auto-style27 {
            height: 29px;
        }
    </style>
</asp:Content>

