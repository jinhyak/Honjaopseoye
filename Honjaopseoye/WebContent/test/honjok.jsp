<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../include/commonUI.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
	<script type="text/javascript">
	$( document ).ready(function() {
		$('.ui.sticky')
	  	.sticky({
	    	context: '#example1'
	  	});
	});
	</script>
</head>
<body>
    
    
<div id="login">
    <h1><i class="ico spr"></i><span>요기요 사장님/비즈센터</span></h1>
    <form class="form-signin form-horizontal" method="POST">
        <fieldset>
            <div style="display:none"><input type="hidden" name="csrfmiddlewaretoken" value="p9k4HDyZEdd06NxIrEZXtsifJG2fWiXE"></div>
            
            <div class="alert">
                <a class="close" onclick="$('.alert').hide()">×</a>
                로그인 할 수 없습니다. 다시 시도해 주세요.
            </div>
            
            <br>
            <div class="control-group">
                <label class="control-label" for="username">아이디</label>
                <div class="input-wrap">
                    <i class="ico spr ico-id"></i>
                    <input type="text" id="username" name="username" class="input-block-level">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="password">비밀번호</label>
                <div class="input-wrap">
                    <i class="ico spr ico-pw"></i>
                    <input type="password" id="password" name="password" class="input-block-level">
                </div>
            </div>
            <div class="controls">
                <button type="submit" class="button">로그인</button>
            </div>
            <div class="control-group center">
                <a class="register" href="/owner/registration/1/">회원가입 / 아이디 변경</a>
            </div>
    </fieldset>
    </form>
</div>
    <script type="text/javascript" src="/media/owners/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/media/owners/js/bootstrap-2.3.2.min.js"></script>
    <script type="text/javascript" src="/media/owners/js/soundmanager2.js"></script>
    <script type="text/javascript" src="/media/js/lib/jquery-ui-1.10.3.min.js"></script>
    <script type="text/javascript" src="/media/owners/js/google_analytics.js"></script>
    <script type="text/javascript" src="/jsi18n/"></script>
    <script>
        if (typeof(window.Yogiyo) == 'undefined') {
            window.Yogiyo = {};
        }
        window.Yogiyo.OWNER_RELAY_PING_INTERVAL = 10000;
    </script>
    <div class="modal fade popup-pwd-notice" id="modal-pwd-notice">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h3 id="myModalLabel">비밀번호 변경 안내</h3>
    </div>
    <div class="modal-body">
        고객님의 소중한 정보를 보호하기 위해 <strong>3개월 주기로 비밀번호 변경</strong>을 안내해 드리고 있습니다.<br>
        불편하시더라도 주기적으로 비밀번호를 변경하여 사용해 주시길 부탁드립니다.
    </div>
    <div class="pop-btns">
        <a href="#" data-dismiss="modal" class="btn btn1">다음에 변경하기</a>
        <a href="#" onclick="redirectLogin('/owner/password_change/')" data-dismiss="modal" class="btn btn2">비밀번호 변경하기</a>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function() {
        var regexS = "[\\?&]login=([^&#]*)";
        var regex = new RegExp( regexS );
        var results = regex.exec(window.location.href);
        if (results) {
            $('.popup-pwd-notice').modal('show');
        }
    });
</script>
<script>
    $(document).ready(function() {
        $('.form-signin').on('submit', function(evt){
            $(this).find('input').each(function(idx, elem){
                $(elem).val( $(elem).val().trim() );
            });
        });
    });
</script>



</body>
</html>