<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../Semantic/semantic.css" />
<script src="../Semantic/js/jquery-1.12.0.js"></script>
<script src="../Semantic/semantic.js"></script>
<title>�۾���</title>
<!--�̹��� �̸����� ��ũ��Ʈ ���� -->
<script type="text/javascript">

// �̹��� �̸�����
$(document).ready(function(){
	
	var text = document.f_board.t_text;
	
 	$(function() {
		$("#img_file").change(function() {
			readURL(this);
		});
	});
	
	function readURL(input) {
		alert("�̹���");
		
			if (input.files && input.files[0]) {
				
				var reader = new FileReader();
			
					reader.onload = function(e) {
						$('#blah').attr('src', e.target.result);
					}

				reader.readAsDataURL(input.files[0]);
				} // if��
				
	} // readURL�Լ�  
	
	
	$("#b_img").click(function(){
		
		var formData = new FormData(document.getElementById('f_board'));
		var img_file = $("#img_file").val();
		img_file = img_file.substring(12);
		
		// �̹��� ��� ó��
		$.ajax({
			method:"POST"
		   ,url:"../board/empty/imageAjax.test"
		   ,data:formData
		   ,enctype:"multipart/form-data"
		   ,contentType: false
		   ,processData: false
		   ,success:function(formData){
			   
				//img_file = img_file.substring(12);
				text.value += "<br>" + "<img src='./images/" + img_file + "'>" +"<br>";
				alert("�̹��� �±װ� �߰� �Ǿ����ϴ�.");
			   
		   }
		   ,error:function(xhrObject){
			   alert("error:"+xhrObject.responseText);
		   }
		});
		
	
	});
	
	
	$("#b_cancel").click(function(){
		location.href="./boardList.jsp";
	});
	
}) /* ���� ��  */



</script>
<!-- �̹��� �̸����� ��ũ��Ʈ ����  ��-->

<!-- �ٵ� ��Ÿ�� -->
<style>
/* body {
	background-image: url('writerBackground.jpg');
} */

</style>
<!-- �ٵ� ��Ÿ�� �� -->

</head>


<body>
<!-- ���  -->

<!-- ��� �� -->


<!-- @@@@@@@@@@@@@@@@@@@@ �Խ��� �ۼ� form @@@@@@@@@@@@@@@@@@@@  -->
<br>
<br>
<br>
<form method="Post" action="./wView.jsp" id="f_board" name="f_board">

<!-- �Է� �Խ��� ���̺�   -->
<table align="center" border="1" width="800px" height="1000px" bgcolor="white">
<!-- �Խ��� �Ӹ�  -->
<thead align="center" style="width:800px; height:200px;">
<tr>
<td><img src="./images/logo.png" width="800px" height="200px"></td>
</tr>
</thead>
<!-- �Խ��� �Ӹ� ��  -->


<!-- �׽�Ʈ -->


<!-- �׽�Ʈ -->



<!-- �Խ��� �Է� GUI  -->

<tbody style="width:800px; height:500px;" >
<tr>
<!-- ��� �޴� -->
<td width="800px" height="100px">

<input type="text" style="width: 260px; height: 18px;" placeholder="������URL" id="post_url" name="post_url">
<input type="file" id="img_file" name="img_file" accept=".gif, .jpg, .png">
</td>
<!-- ��� �޴� �� -->
</tr>

<!-- �۾��� -->
<tr>
<!-- �޺��ڽ�  -->
<td width="800px" height="400px">
<select name="bab_category" id="bab_category">
<option value="ȥ��">ȥ��</option>
<option value="ȥ��">ȥ��</option>
<option value="ȥ��" selected="selected">ȥ��</option>
</select>
&nbsp;&nbsp;
<!-- �����Է�  -->
<div class="ui input focus">
<input type="text" placeholder="�����Է�" style="width:730px; height:23px;" id="bab_title" name="bab_title">
</div>
<!-- �� �Է� -->
<textarea style="width: 800px; height:600px;" id="t_text" name="t_text"></textarea>
<!-- �� �Է³� -->

</td>
<!-- �۾��� �� -->
</tr>

</tbody>

<!-- �Խ��� �Է� GUI ��  -->

<!-- ���̺� �ϴ� -->

 <tfoot align="center" style="width:800px; height:300px;">
        <!-- �̹��� �̸�����  -->
        <!-- �̹��� �̸����� Ÿ��Ʋ  -->
        <tr>
        <td><font size="3" color="blue">@�̹��� �̸�����@</font></td>
        </tr>
        <tr>
            <td width="200px" height="200px" align="center">
            <br>
			<img align="middle" id="blah" src="#" alt="" width="200px" height="200px" />
               <br>
               <br>
               <div class="ui animated button" tabindex="0" id="b_img" name="b_img">
  				<div class="visible content">�̹��� ���</div>
 				 <div class="hidden content">
 				   <i class="right arrow icon"></i>
 					 </div>
						</div>
						<br>
               <br>
            </td>
        </tr>
        
        <!-- ��ư GUI  -->
        <tr>
        <td width="800px" height="100px">
        <button class="negative ui button" id="b_cancel" name="b_cancel">����ϱ�</button>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button class="positive ui button" id="b_insert" name="b_insert">����ϱ�</button>
        </td>
        </tr>
        
    </tfoot>

<!-- ���̺� �ϴ� �� -->

</table>

</form>
<!-- �Է� �Խ��� ���̺� ��  -->


<br>
<br>
<br>

<!-- @@@@@@@@@@@@@@@@@@@@ �Խ��� �ۼ� form �� @@@@@@@@@@@@@@@@@@@@ -->

<!-- �ϴ�  -->
