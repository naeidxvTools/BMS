function _change() {
	$("#imgVerifyCode").attr("src", "/bms/VerifyCodeServlet?a=" + new Date().getTime());
}