<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .customTokenButtonImage {
            vertical-align: middle;
            float: left;
            display: block;
            padding-top: 5px;
        }
    </style>
    <script src="jquery-3.2.0.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function tokenBox_Init(s, e) {
            AddCustomTokenButton(s);
        }
        function tokenBox_TokensChanged(s, e) {
            AddCustomTokenButton(s);
        }

        function AddCustomTokenButton(editor) {
            $token = $(editor.GetMainElement()).find(".myToken");

            $token.each(function () {
                if ($(this).find(".customTokenButtonImage").length == 0) {
                    $('<img/>', {
                        title: "Edit",
                        src: "edit.png",
                        class: "customTokenButtonImage",
                        click: function () {
                            var tokenText = $(this).prev().text();
                            alert(tokenText); return false;
                        }
                    }).insertAfter($(this).find(".myTokenText"));
                }
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxTokenBox ID="tokenBox" runat="server" ItemValueType="System.String" Theme="Moderno" Width="350" >
            <ClientSideEvents Init="tokenBox_Init" TokensChanged="tokenBox_TokensChanged" />
            <TokenStyle CssClass="myToken"></TokenStyle>
            <TokenTextStyle CssClass="myTokenText"></TokenTextStyle>
            <Items>
                <dx:ListEditItem Value="Item 1" />
                <dx:ListEditItem Value="Item 2" />
                <dx:ListEditItem Value="Item 3" />
                <dx:ListEditItem Value="Item 4" />
                <dx:ListEditItem Value="Item 5" />
                <dx:ListEditItem Value="Item 6" />
                <dx:ListEditItem Value="Item 7" />
            </Items>
        </dx:ASPxTokenBox>

    </form>
</body>
</html>
