<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="../Semantic/js/jquery-1.12.0.js"></script>
<script src="../Semantic/semantic.js"></script>
<script src="../Semantic/js/commons.js"></script>
<link rel="stylesheet" href="../Semantic/semantic.css" />
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
    body {
      background-color: #DADADA;
    }
    body > .grid {
      height: 100%;
    }
    .image {
      margin-top: 100;
    }
    .column {
      min-width: 480px;
      max-width: 800px;
    }
</style>
</head>
<body>
<script type="text/javascript">
	$(document).ready(function(){
		$('#pw_compare').keyup(function(){
			keyup();
		});
		$('#pw').keyup(function(){
			keyup();
		});
	})
	
	function keyup(){
		var pw = $('#pw').val();
		var pw_compare = $('#pw_compare').val();
		if(pw==pw_compare){
			$('#pw_check').text('��й�ȣ�� �����մϴ�.');
			$('#f_p').attr('class','field');
			$('#lock').attr('class','unlock icon');
			$('#h_pw').val('1');
		}
		else{
			$('#pw_check').text('��й�ȣ�� �ٸ��ϴ�');
			$('#f_p').attr('class','field error');
			$('#lock').attr('class','lock icon');
			$('#h_pw').val('0');
		}
	}
	function id_check(){
		alert('ss');
		$('#h_id').val('1');
	}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@# ȸ������ #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	function join(){
		var user_name = $('#name').val();
		var user_id = $('#id').val();
		var h_id = $('#h_id').val();
		var h_pw = $('#h_pw').val();
		
		if(user_name==''||user_name==null){
			alert('�̸����� ������ ����� �� �����ϴ�.');
		}
		else if(user_id==''||user_id==null){
			alert('ID���� ������ ����� �� �����ϴ�.');
		}
		else if(h_id=='0'){
			alert('�ߺ�üũ�� �ϼž��մϴ�.')
		}
		else if(h_pw==''||h_pw==null){
			alert('��й�ȣ�� ������ ������� �ʽ��ϴ�');
		}
		else if(h_pw=='0'){
			alert('��й�ȣ�� �������� ���� �����Դϴ�.');
		}
		else{
			var email = $('#email').val()+"@"+$('#domain').text();
			var hoby = $('#hoby').text();
			var job = $('#job').text();
			var param = $('#form_login').serialize()+"&mem_email="+email+"&mem_hobby="+hoby+"&mem_job"+job;
			alert('ȸ������');
			$.ajax({
				 method:"post"
				,data:param
				,url:"../member/empty/insert.test"
				,success:function(data){
					//@@@@@@@@@@@@@@@@@@@@@@@@@ �ӽ� ���� ȭ�� @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
					alert('ȸ�����Կ� �����ϼ̽��ϴ�.')
					self.close();
				}
				,error:function(data){
					alert("����");
				}
			})
		}
	}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ �ݱ� @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	function close_j(){
		self.close();
	}
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ���� ���� @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	function gender(){
		var gender = $("chk_info").val()
		alert(gender)
	}
</script>
	<div class="ui middle aligned center aligned grid bagic segment">
		<div class="column" style="width: 60%">
				<img src="../image/logo.png" class="image"style="width:280px;">
			<form class="ui large form" id="form_login">
				<div class="ui stacked segment">
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@# �̸� #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
					<div class="field">
						<div class="ui inverted labeled left icon input" style="width: 100%;">
							<i class="user icon"></i> <input type="text" name="mem_name" id="name" placeholder="�̸��� �Է��ϼ���">
						</div>
					</div>
					<div class="ui name check" id="name_check"></div>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@# ���� #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
					<div class="field" id="gend">
						<div class="ui segment" style="width:150px;padding-top:8px;padding-bottom:8px;">
							<input type="radio" name="gender" style="align:left" value="1">����
							<input type="radio" name="gender" value="2" style="align:left">����
							<input type="hidden" name="mem_gender" id="h_gender">
						</div>
					</div>
					<div class="ui tel check" id="tel_check"></div>
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@# ID #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
					<div class="field">
						<div class="ui left icon input" style="width: 100%;">
							<i class="user icon"></i> <input type="text" name="mem_id" id="id" placeholder="���̵� �Է��ϼ���">
							<div class="ui fluid large submit button" style="width: 200px" onclick="id_check()">�ߺ�üũ</div>
							<input type="hidden" id="h_id" value="0">
						</div>
					</div>
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#  pw  #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
					<div class="field">
						<div class="ui left icon input" style="width: 100%;">
							<i class="lock icon"></i> <input type="password" name="mem_pw" id="pw" placeholder="��й�ȣ�� �Է��ϼ���">
						</div>
					</div>
					<div id="f_p" class="field">
						<div class="ui left icon input" id="pw_c" style="width: 100%;">
							<i class="lock icon" id="lock"></i>
							<input type="password" id="pw_compare" placeholder="��й�ȣ Ȯ��"> 
							<input type="hidden" id="h_pw" value="0">
						</div>
					</div>
					<div class="ui pw check" id="pw_check"></div>
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@# ��� ���� #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
					<div class="field">
								<div class="ui selection dropdown addr">
										<input type="hidden" value="default" id="hobby"> <i class="dropdown icon"></i>
										<div class="text" id="hobby">���</div>
										<div class="menu" id="menu_hobby">
											<div class="item" data-value="default">���</div>
										</div>
								</div>
								<div class="ui selection dropdown addr">
									<input type="hidden" value="default" id="job"> <i class="dropdown icon"></i>
										<div class="text" id="job">����</div>
										<div class="menu" id="menu_job">
											<div class="item" data-value="default">����</div>
										</div>
								</div>
					</div>
					<div class="ui pw check" id="pw_check"></div>
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@# email #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
					<div class="field" style="width:100%">
						<div class="ui left icon input" style="width: 100%;">
							<i class="envelope icon"></i> <input type="email" id="email" placeholder="E-mail address">
							@<div class="ui large selection dropdown" id="dropdown">
								<input type="hidden" value="default"><i class="dropdown icon"></i>
								<div class="text" id="domain">google.com</div>
								<div class="menu">
									<div class="item" data-value="0">naver.com</div>
									<div class="item" data-value="1">duam.net</div>
									<div class="item" data-value="default">google.com</div>
								</div>
							</div>
						</div>
					</div>
					<div class="ui email check" id="email_check"></div>
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@# ��ȭ��ȣ #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
					<div class="field">
						<div class="ui left icon input" style="width: 100%;">
							<i class="phone icon"></i> <input type="tel" name="mem_tel" placeholder="��ȭ��ȣ�� �Է��ϼ���">
							<div class="ui fluid large submit button" style="width: 200px" onclick="id_check()">�ߺ�üũ</div>
						</div>
					</div>
					<div class="ui tel check" id="tel_check"></div>
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@# �����ȣ �Է� #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
					<div class="field" align="left">
						<div class="ui icon input" style="width:50%;">
							<i class="address book icon"></i> 
							<input type="text" readonly="readonly" placeholder="�����ȣ ������ �����ϴ�" id="zip">
						</div>
					</div>
					<div class="ui addr check" id="addr_check"></div>
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@# �ּҹ����Է� #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
					<div class="field" style="width: 100%;">
						<div class="ui icon input">
							<input type="text" name="mem_addr" readonly="readonly" placeholder="�ּ� ������ �����ϴ�" id="addr">
							<div class="ui gray button" onclick="addr()">
								<i class="plus icon"></i> �ּҵ��
							</div>
						</div>
					</div>
					<div class="ui addr check" id="addr_check"></div>
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@# ��ư #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
						<div class="ui gray button" onclick="join()" style="width: 40%;">ȸ������</div>
						<div class="ui gray button" onclick="close_j()" style="width: 40%;">�ݱ�</div>
					</div>
					<div class="ui error message"></div>
			</form>
		</div>
	</div>
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@# �ּҵ�ϸ�� #@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
	<div class="ui modal" id="modal_addr">
		<i class="close icon"></i>
		<div class="header">
			<h3>�ּҵ��â</h3>
		</div>
		<div class="content">
			<div class="body">
				<div class="ui selection dropdown addr">
					<input type="hidden" value="default" id="do"> <i class="dropdown icon"></i>
					<div class="text" id="dos">��</div>
					<div class="menu" id="menu_do">
						<div class="item" data-value="default">��</div>
					</div>
				</div>
				<div class="ui selection dropdown addr">
					<input type="hidden" value="default"> <i class="dropdown icon"></i>
					<div class="text" id="si">��</div>
					<div class="menu" id="menu_si">
						<div class="item" data-value="default">��</div>
					</div>
				</div>
				<div class="ui selection dropdown addr">
					<input type="hidden" value="default"> <i class="dropdown icon"></i>
					<div class="text" id="dong">��.��</div>
					<div class="menu" id="menu_dong">
						<div class="item" data-value="default">��.��</div>
					</div>
				</div>
				<div class="ui input" style="width: 300px;">
					<input type="text" placeholder="���ּҸ� ����ϼ���" id="p_addr">
				</div>
				<div class="ui input">
					<input type="text" readonly="readonly" placeholder="�����ȣ �˻��� ��������" id="p_zip">
					<div class="ui button" id="zipcode" onclick="zipcode()">�����ȣ�˻�</div>
				</div>
				<div class="actions">
					<div class="ui button" id="insert">���</div>
					<div class="ui button" id="cancle">���</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ �ּҵ�� ��� ��� @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
			$('#dropdown').click(function(){
				$('#dropdown').dropdown()
			});
			$('.addr').click(function(){
				$('.addr').dropdown()
			});
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ �� select @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
			function addr(){
				$('#modal_addr')
				.modal({
					centered:false
				})
				.modal('show');
				$.ajax({
					 method:'post'
					,url:'../Zipcode/empty/select.deok'
					,success:function(data){
						alert(data);
						$('#menu_do').html(data);
					}
				})
			};
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ �� select @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
			$('.dropdown').change(function(){
				var dos =$('#dos').text();
				var si = $('#si').text();
				var dong = $('#dong').text();
				if(dos=='��'){}
				else{
					var param = "zdo="+dos
					$.ajax({
						 method:"post"
						,data:param
						,url:"../Zipcode/empty/select2.deok"
						,success:function(data){
							$('#menu_si').html(data);
						}
					})
				}
				if(si=='��'){}
				else{
					var param = "sigu="+si
					$.ajax({
						 method:"post"
						,data:param
						,url:"../Zipcode/empty/select3.deok"
						,success:function(data){
							$('#menu_dong').html(data);
						}
					})
				}
			});
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ �� select @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		$('#insert').click(function(){
				var addr = $('#p_addr').val();
				var zip = $('#p_zip').val();
				$('#addr').val(addr);
				$('#zip').val(zip);
				$('#modal_addr')
				.modal({
					centered:false
				});
		});
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ ���� @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		$('#gend').change(function (){
			var gender = $("input[type=radio][name=mem_gender]:checked").val();
			$("#h_gender").val(gender);
		})
</script>
</body>
</html>