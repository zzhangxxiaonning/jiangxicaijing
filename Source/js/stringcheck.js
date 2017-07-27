function is_mobile(value){
	var myreg = /^1[3|5|7|8]{1}[0-9]{9}$/;
	if(myreg.test(value))
	{
		return true;
	}else{
		return false;
	}
}function is_email(value){
	var myreg = /\w+@(\w|\d)+\.\w{2,3}/i;
	if(myreg.test(value))
	{
		return true;
	}else{
		return false;
	}
}
function is_password(value){
	var myreg = /^.{6,}$/;
	if(myreg.test(value))
	{
		return true;
	}else{
		return false;
	}
}
function is_card(value){
	var myreg = /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{4}$/;
	if(myreg.test(value))
	{
		return true;
	}else{
		return false;
	}
}