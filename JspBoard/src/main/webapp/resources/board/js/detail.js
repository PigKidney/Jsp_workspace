const modiBtn = document.querySelector('#modiBtn');
const inputPassword = document.querySelector('#inputPassword');
const deleteForm = document.querySelector('#deleteForm');
const delBtn = document.querySelector('#delBtn');


const checkHash = () => boardPassword === sha256(inputPassword.value).toUpperCase();




modiBtn.addEventListener('click', (e) => {
	
	if(checkHash()) {
		location.href = './modify?board_id='+board_id;
	} else {
		alert('��й�ȣ�� Ʋ�Ƚ��ϴ�');
	}
	
});

delBtn.addEventListener('click', (e) => {
	
	if(checkHash()) {
		if(confirm('�����Ͻðڽ��ϱ�?')){
			deleteForm.submit();			
		}
	} else {
		alert('��й�ȣ�� Ʋ�Ƚ��ϴ�');
	}
	
});