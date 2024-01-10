const modiBtn = document.querySelector('#modiBtn');
const inputPassword = document.querySelector('#inputPassword');
const deleteForm = document.querySelector('#deleteForm');
const delBtn = document.querySelector('#delBtn');
const delBtn2 = document.querySelector('#delBtn2');

const hiddenPassword = document.querySelector('#hiddenPassword');
const backBtn = document.querySelector('#backBtn');

const getHashPassword = password => sha256(password).toUpperCase();

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
delBtn2.addEventListener('click', (e) => {
	const popup = open('./delete/open', '_blank', 'width=500,height=500');
	
	
});


backBtn.addEventListener('click', (e) => {
	location.href = './';
});