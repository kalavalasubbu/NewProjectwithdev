
function handleMessageBody(message){
 var  flag = false;
 if(message.indexOf('{!') == -1){
	flag= true;
 }
 return flag;
}
