const modiBtn = document.querySelector('#modiBtn');
const inputPassword = document.querySelector('#inputPassword');
const deleteForm = document.querySelector('#deleteForm');
const delBtn = document.querySelector('#delBtn');


const checkHash = () => boardPassword === sha256(inputPassword.value).toUpperCase();




modiBtn.addEventListener('click', (e) => {
	
	if(checkHash()) {
		location.href = './modify?board_id='+board_id;
	} else {
		alert('비밀번호가 틀렸습니다');
	}
	
});

delBtn.addEventListener('click', (e) => {
	
	if(checkHash()) {
		if(confirm('삭제하시겠습니까?')){
			deleteForm.submit();			
		}
	} else {
		alert('비밀번호가 틀렸습니다');
	}
	
});