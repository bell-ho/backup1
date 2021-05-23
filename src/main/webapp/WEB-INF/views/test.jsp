<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Paging</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url:"/ajax/test",
		success:function(data){
			alert(data);
		}
	})
})
	
</script>
</head>
<body>
	<h2>회원만들기</h2>
	
</body>
</html>
