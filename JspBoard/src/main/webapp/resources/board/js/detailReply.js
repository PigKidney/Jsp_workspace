const replyContent = document.querySelector('#replyContent');
const replyForm = document.querySelector('#replyForm');
const reply_password = document.querySelector('#reply_password');
const reply_writer = document.querySelector('#reply_writer');


const replyWriteBtn = document.querySelector('#replyWriteBtn');


replyContent.addEventListener('keydown', (e) => {
	 console.log(e);
	 
	 if(e.keyCode === 13){
		 if(!e.shiftKey){
			 // Shift �ȴ����� Enter�ϸ� submit()
			 e.preventDefault();
			 
			 if(reply_writer.value.trim() === ''){
				 alert('�۾��̰� ����ֽ��ϴ�');
			 } else if(reply_password.value.trim() ==='' || 
			 	reply_password.value.trim().length < 5){
				 alert('��й�ȣ�� 4���� �̻��̾�� �մϴ�');
				 return;
			 }
			 replyForm.submit();
			 
		 } else {
			 // Shift + Enter�ϸ� ��ۿ��� �� �ٲ��ֱ�
			 replyContent.innerText += '\n';
		 }
	 }
});
