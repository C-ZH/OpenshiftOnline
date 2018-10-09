var form_name;

function check(form_name){
	if(document.forms[form_name].elements['user'].value==""){
		alert('請輸入稱呼！');
		document.forms[form_name].elements['user'].focus();
		return false;
	}
	if(document.forms[form_name].elements['content'].value==""){
		alert('請輸入內容！');
		document.forms[form_name].elements['content'].focus();
		return false;
	}
	return true;
}
