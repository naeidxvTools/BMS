function _change() {
	$("#imgVerifyCode").attr("src", "/BMS/VerifyCodeServlet?a=" + new Date().getTime());
}