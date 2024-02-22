<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ajax::user1</title>
		<script >
			window.onload=function(){
				//사용자 등록
				const btnSubmit = document.getElementsByName('submit')[0];
				const formUser1 = document.getElementsByTagName('form')[0];
				btnSubmit.onclick = (e) => {
					e.preventDefault();
					
					const uid = formUser1.uid.value;
					const name = formUser1.name.value;
					const birth = formUser1.birth.value;
					const hp = formUser1.hp.value;
					const age = formUser1.age.value;
					
					const jsonData = {
						"uid" : uid,
						"name" : name,
						"birth" : birth,
						"hp" : hp,
						"age" : age
					};
					const strJson = JSON.stringify(jsonData);
					//String Type만을 주고 받음. 문자열로 바꿔줘야 함.

					//서버 전송
					fetch('./proc/postUser1.jsp',{
						method: 'POST',
						headers:{
							"Content-Type":"application/json",
						},
						body: strJson //post형식으로 strJson을 보낼 것이다
					})
						.then(response => response.json())//응답
						.then((data) => {
							if(data.result>0){
								alert('등록 성공!');
								
								//목록이동
								location.href="./list.jsp";
							}else{
								alert('등록 실패!');
							}
						})
						.catch();
				}
		
			}
		</script>
	</head>
	<body>
		<h3>user1 등록</h3>
		<form action="#" >
		<table border="1">
			<tr>
			<td>아이디</td>
			<td><input type="text" name="uid"></td>
			</tr>
				<tr>
			<td>이름</td>
			<td><input type="text" name="name"></td>
			</tr>
				<tr>
			<td>생년월일</td>
			<td><input type="date" name="birth"></td>
			</tr>
				<tr>
			<td>휴대폰</td>
			<td><input type="text" name="hp"></td>
			</tr>
				<tr>
			<td>나이</td>
			<td><input type="number" name="age"></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
				<input type="submit" value="등록하기" name="submit">
				</td>
			</tr>
		</table>
		</form>
		
	</body>
</html>