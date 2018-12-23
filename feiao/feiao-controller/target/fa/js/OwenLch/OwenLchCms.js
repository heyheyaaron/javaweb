function pageful(data){
	//修改页码信息
	$("#total").text(data.total);
	$("#curpage").text(data.curpage);
	$("#totalpage").text(data.totalpage);
	$("#curp").text(data.curpage);
	$("#nextfp").text(data.curpage+1);
	$("#nextsp").text(data.curpage+2);
	$("#nexttp").text(data.curpage+3);
	if(data.totalpage==1){
		document.getElementById('curp').style.display = 'none';
	}else{
		document.getElementById('curp').style.display = '';
	}
	if(data.curpage+1>data.totalpage){
		document.getElementById('nextfp').style.display = 'none';
	}else{
		document.getElementById('nextfp').style.display = '';
	}
	if(data.curpage+2>data.totalpage){
		document.getElementById('nextsp').style.display = 'none';
	}else{
		document.getElementById('nextsp').style.display = '';
	}
	if(data.curpage+3>data.totalpage){
		document.getElementById('nexttp').style.display = 'none';
	}else{
		document.getElementById('nexttp').style.display = '';
	}
	if(data.curpage==1){
		document.getElementById('firstp').style.display = 'none';
		document.getElementById('lastp').style.display = 'none';
	}else{
		document.getElementById('firstp').style.display = '';
		document.getElementById('lastp').style.display = '';
	}
	if(data.curpage==data.totalpage){
		document.getElementById('nextp').style.display = 'none';
		document.getElementById('endp').style.display = 'none';
		
	}else{
		document.getElementById('nextp').style.display = '';
		document.getElementById('endp').style.display = '';
		
	}
}

