function check() {
	if (join.member_id.value == "") {
		alert("아이디 값을 입력해주세요!");
		join.member_id.focus();
		return false;
	}
	else if (join.member_pwd.value == "") {
		alert("패스워드 값을 입력해주세요!");
		join.member_pwd.focus();
		return false;
	}
	else if (join.member_name.value == "") {
		alert("이름 값을 입력해주세요!");
		join.member_name.focus();
		return false;
	}
	else if (join.member_birth.value == "") {
		alert("생년월일 값을 입력해주세요!");
		join.member_birth.focus();
		return false;
	}
	else if (join.member_tel.value == "") {
		alert("전화번호 값을 입력해주세요!");
		join.member_tel.focus();
		return false;
	}
	else if (join.member_email.value == "") {
		alert("이메일 값을 입력해주세요!");
		join.member_email.focus();
		return false;
	}
	else if (join.member_addr.value == "") {
		alert("주소 값을 입력해주세요!");
		join.member_addr.focus();
		return false;
	}
	else return true;
}