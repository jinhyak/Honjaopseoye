<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../include/commonUI.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�۾���</title>
<script type="text/javascript">

function met() {
	
	var f = document.f_l.g_1;
	
	var g_1; // �ؽ�Ʈ
	var snb; // ����
	var br; // �ٹٲ�

	if (f.value.length == 1000) {
		//alert("g_2�� �Ѿ�ϴ�.");
		//f.value.length = 0;
		g_1 = f.value; // �÷�1
		alert("�� �̻� ���ڸ� �߰��� �� �����ϴ�.");
	} else if(event.keyCode == 13){
         //alert("���ʹ���");
         f.value += "<br>";
    } else if(event.keyCode == 32){
		//alert("�����̽��ٴ���");
		f.value += "&nbsp;";
	}
}
	
	var img_1; // �̹���1
	
	// Ȩ�������� �����ϸ�....
  	$(document).ready(function() {
		// �ʵ� ��
	var f = document.f_l.g_1; // �ؽ�Ʈ ������ ��
		// �̹���1 ��ư�� ������ ��

		$("#b_ok").click(function() {
			img_1 = $("#img_1").val();
			img_1 = img_1.substring(17, 12);
			f.value += "<br><img src='"+"./im/" + img_1 + "'>" + "<br>";
			alert("�̹����� �߰� �Ǿ����ϴ�.");
		});


		// ���� ��
	})

	// �̹��� �̸����⸦ ��� ��������...
	$(function() {
		$("#img_1").on('change', function() {
			readURL(this);
		});
	});
	// �̹��� �̸����� ����
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
</head>
<body>
	<div align="center">
		<br> <br>
		<!-- �Խ��� ��� -->
		<form method="post" action="./testwrite.jsp" id="f_l" name="f_l">
			<table border="1" width="800px" height="480px">
				<thead align="center">
					<font size="5" color="black">�� ����</font>
				</thead>
				<tr>
					<td><select name="bab_category" id="bab_category">
							<option value="ȥ��">ȥ��</option>
							<option value="ȥ��">ȥ��</option>
							<option value="ȥ��" selected="selected">ȥ��</option>
					</select>
						<div class="ui input focus">
							<input type="text" placeholder="�����Է�"
								style="width: 740px; height: 27px;" id="bab_title"
								name="bab_title">
						</div>
						<div class="ui input focus">
							<br> <input type="text" style="width: 140px; height: 18px;"
								placeholder="������URL" id="post_url" name="post_url">
						</div> <input align="middle" type="file" id="img_1" name="img_1"
						style="width: 20px; height: 20px;" accept="*.jpg"> <!-- <input type="button" value="�̹��� �߰�" onClick="met()"> -->
						<div class="ui form">
							<div class="field" align="center">
								<textarea style="width: 800px; height: 800px;" id="g_1"
									name="g_1" onkeydown="met()">
							</textarea>
								<br> <br>
								<button class="negative ui button" id="c_b" name="c_b">����ϱ�</button>
								&nbsp;&nbsp;&nbsp;
								<button class="positive ui button" id="i_b" name="i_b">����ϱ�</button>
								<input type="submit">
							</div>
						</div></td>
					<td>
						<table width="200px" height="480px">
							<thead>
								<tr>
									<td align="center">�̹��� ���� �̸�����</td>
								</tr>
							</thead>
							<tr>
								<td align="center">
									<form id="form1" runat="server">
										<img align="middle" id="blah" src="#" alt=""
											width="300px" height="250px" /> <br> <br> <input
											type="button" id="b_ok" name="b_ok" value="�ø���"> <br>
										<br>
									</form>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
	</div>
</body>
</html>