<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#deleteBtn {
	display: none;
}

.btn btn-primary {
	width: 20px;
	height: 20px;
}

#fileName {
	line-height: 20px;
}

#uploadFile {
	transform: translateY(-5px);
}
</style>
</head>
<body>

	<input type="file" name="uploadFile" id="uploadFile" multiple />
	<label for="fileName" id="fileName">${machine.mch_img }</label>
	<input type="hidden" name="fileName" value="${machine.mch_img }">
	<input type='hidden' name="del" id="del" value=0>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script>
	$(document).ready(function(){
	    $('#uploadFile').on('change', function() {
	        $('#fileName').text($(this).val());
	    });

		// 정규표현식 : 예).com 끝나는 문장 등의 조건이 복잡한 문장을 컴퓨터에게 이해시키기 위한 구문
		let regex = new RegExp("(.*)\.(exe|sh|zip|alz)$");
							// 파일이름 .  exe|sh|zip|alz 인 경우를 체크함
		let maxSize =5242880; // 5Mb
		
		function checkExtension(fileName, fileSize){
			// 파일크기 초과시 종료시킴
			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;// return이 있어서 아래쪽 구문은 실행 안됨
			}
			// regex에 표현해둔 정규식과 일치하는지 여부를 체크, 일치하면 true, 아니면 false
			if(regex.test(fileName)){
				alert("해당 확장자를 가진 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}
		
		$('#writeBt').on("click", function(e){
		
			let formData = new FormData(); 
			
			
			let inputFile = $("input[name='uploadFile']"); 
			
			
			let files = inputFile[0].files;// 실제 file 데이터
			
			// 파일 데이터를 폼에 집어넣기
			for(let i = 0; i < files.length; i++){
				console.log(i)
				if(!checkExtension(files[i].name, files[i].size)){
					return false;// 조건에 맞지않은 파일 포함시 onclick 이벤트 함수자체를 종료시켜버림
				}

				// 파일 데이터를 가져와서 key, value로 저장
				formData.append("uploadFile", files[i]);
				
				//console.log로는 단순한 객체가 아니라 전송을 위한 특수객체이므로 확인이 어려움
				//다음과 같이 for문으로 확인해야 함
				for (let key of formData.keys()) {
					  console.log(key, ":",formData.get(key));
				}
			}
			
		});

	
					// 파일 데이터를 폼에 집어넣기
					for(let i = 0; i < files.length; i++){
						console.log(i)
						if(!checkExtension(files[i].name, files[i].size)){
							return false;// 조건에 맞지않은 파일 포함시 onclick 이벤트 함수자체를 종료시켜버림
						}
						console.log("파일 길이")
						console.log(files[i].name.length)

						// 파일 데이터를 가져와서 key, value로 저장
						formData.append("deleteFile", files[i]);
						
						//console.log로는 단순한 객체가 아니라 전송을 위한 특수객체이므로 확인이 어려움
						//다음과 같이 for문으로 확인해야 함
						console.log("--------------파일 적재 후 formData 태그 -------------");
						for (let key of formData.keys()) {
							  console.log(key, ":",formData.get(key));
						}
					}
					
				
					
				});
				
			  
		</script>
</body>
</html>