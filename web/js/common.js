function _change() {
	alert("hyz");
	$("#imgVerifyCode").attr("src", "/BMS/VerifyCodeServlet?a=" + new Date().getTime());
}