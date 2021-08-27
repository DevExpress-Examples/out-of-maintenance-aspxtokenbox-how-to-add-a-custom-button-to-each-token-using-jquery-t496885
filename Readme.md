<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128531099/16.2.5%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/T496885)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/Default.aspx) (VB: [Default.aspx](./VB/Default.aspx))
* [Default.aspx.cs](./CS/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/Default.aspx.vb))
<!-- default file list end -->
# ASPxTokenBox - How to add a custom button to each token using jQuery
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/t496885/)**
<!-- run online end -->


This example illustrates how to add a custom button to each token using jQuery. Each button shows the alert box with the current token text.<br><br><strong>See also:</strong><br><a href="https://www.devexpress.com/Support/Center/p/T490726">ASPxTokenBox - How to add a tooltip and change the background color of a token</a>


<h3>Description</h3>

<p>To accomplish this task, perform the following steps:<br>1. Add custom CSS classes to the&nbsp;<a href="https://documentation.devexpress.com/#AspNet/DevExpressWebASPxTokenBox_TokenStyletopic">ASPxTokenBox.TokenStyle</a>&nbsp;and <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebASPxTokenBox_TokenTextStyletopic">ASPxTokenBox.TokenTextStyle</a>&nbsp;properties:</p>
<code lang="aspx">&lt;dx:ASPxTokenBox ID="tokenBox" runat="server" ...&gt;
    &lt;TokenStyle CssClass="myToken"&gt;&lt;/TokenStyle&gt;
    &lt;TokenTextStyle CssClass="myTokenText"&gt;&lt;/TokenTextStyle&gt;
    ...
&lt;/dx:ASPxTokenBox&gt;
</code>
<p>&nbsp;2. Create a custom&nbsp;AddCustomTokenButton function, which will&nbsp;check if a token element already contains the custom button. If no, the button will be added:</p>
<code lang="js">function AddCustomTokenButton(editor) {
&nbsp;&nbsp;&nbsp; $token = $(editor.GetMainElement()).find(".myToken");

&nbsp;&nbsp;&nbsp; $token.each(function () {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ($(this).find(".customTokenButtonImage").length == 0) {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $('&lt;img/&gt;', {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; title: "Edit",
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; src: "edit.png",
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; class: "customTokenButtonImage",
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; click: function () {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; var tokenText = $(this).prev().text();
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; alert(tokenText); return false;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }).insertAfter($(this).find(".myTokenText"));
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
&nbsp;&nbsp;&nbsp; });
}
</code>
<p>&nbsp;The&nbsp;<em>customTokenButtonImage</em>&nbsp;CSS class is used for correct button positioning:</p>
<code lang="css">.customTokenButtonImage {
    vertical-align: middle;
    float: left;
    display: block;
    padding-top: 5px;
}
</code>
<p>&nbsp;3. Handle the&nbsp;<a href="https://documentation.devexpress.com/#AspNet/DevExpressWebScriptsASPxClientControlBase_Inittopic">ASPxClientTokenBox.Init</a>&nbsp;and&nbsp;<a href="https://documentation.devexpress.com/#AspNet/DevExpressWebScriptsASPxClientTokenBox_TokensChangedtopic">ASPxClientTokenBox.TokensChanged</a>&nbsp;events to call the&nbsp;AddCustomTokenButton function:</p>
<code lang="js">function tokenBox_Init(s, e) {
    AddCustomTokenButton(s);
}
function tokenBox_TokensChanged(s, e) {
    AddCustomTokenButton(s);
}</code>

<br/>


