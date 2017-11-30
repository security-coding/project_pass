function setMyimage(imgsrc){
	let myimage=document.getElementById('myimage');
	let img = imgsrc.getAttribute('src');
	myimage.setAttribute('src',img);
	console.log(myimage.getAttribute('src') );
	$.ajax({
		type:"POST",
		async : true,
		dataType : 'json',
		url:'/member/updateprofile',
		data : {
			srcinput :myimage.getAttribute('src') 
		},
		success:function(data){
			console.log(data);
		}
	});
}