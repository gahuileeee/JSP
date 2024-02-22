<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>ajax::user1</title>
		<script >
			window.onload=function(){

				const table = document.getElementById('list');
				
				//데이터 불러오기
				fetch('./proc/getUser1s.jsp')
				.then(response => response.json())
				.then((data)=>{
					for(const user of data){
						const tr = document.createElement('tr');
						const td1 = document.createElement('td');
						const td2 = document.createElement('td');
						const td3 = document.createElement('td');
						const td4 = document.createElement('td');
						const td5 = document.createElement('td');
						const td6 = document.createElement('td');
						const a1 = document.createElement('a');
						const a2 = document.createElement('a');
						
						td1.innerText = user.uid;
						td2.innerText = user.name;
						td3.innerText = user.birth;
						td4.innerText = user.hp;
						td5.innerText = user.age;
						a1.href='./modify.jsp?uid='+user.uid;
						a1.innerText='수정';
						a2.href='./delete.jsp?uid'+user.uid;
						a2.innerText='삭제';
						td6.appendChild(a1);
						td6.appendChild(a2);
						
						tr.appendChild(td1);
						tr.appendChild(td2);
						tr.appendChild(td3);
						tr.appendChild(td4);
						tr.appendChild(td5);
						tr.appendChild(td6);
						
						table.appendChild(tr);
						
					    a2.onclick = (e) => {
                            e.preventDefault();
                            if (confirm('정말로 삭제하시겠습니까?')) {
                                fetch('./delete.jsp?uid=' + user.uid)
                                    .then(response => response.json())
                                    .then((data) => {
                                        if (data.result > 0) {
                                            alert('삭제 성공!');
                                            // 페이지 리로드
                                            location.reload();
                                        }
                                    })
                                    .catch((error) => {
                                        console.error('삭제 오류:', error);
                                    });
                            }
                        };
					}
				})
				.catch((err)=>{
					console.log(err);
				});
				
			
			}
		</script>
	</head>
	<body>
		
		
		<h3>user1 목록</h3>
		<table border="1" id="list">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>생년월일</th>
			<th>휴대폰</th>
			<th>나이</th>
			<th>관리</th>
		</tr>
		</table>
		
		<a href="./register.jsp"><h3>등록하기</h3></a>
		
	</body>
</html>