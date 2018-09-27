/*********************************************************************************************************************************************************************
 * 윈도우 팝업창 처리 구현
 * @param1:화면에 띄울 페이지의 url
 * @param2:팝업창의 가로
 * @param3:팝업창의 세로
 * @param4:팝업창의 이름
 **********************************************************************************************************************************************************************/

function cmm_window_popup(url,popupwidth,popupheight,popupname)
{
	//해상도(1600*1024) , 팝업창 크기(700,450)
	Top = (window.screen.height-popupheight)/3; //ex)(1024-450)/3=191 화면창의 y좌표
	Left = (window.screen.width-popupwidth)/2;	//ex)(1600-700)/2=450 화면창의 x좌표  즉::191,450부터 화면이 뜬다
	if(Top<0) Top=0;
	if(Left<0) Left=0;
	options="location=no,fullscreen=no, status=yes";
	options+=",left="+Left+", top="+Top;
	options+=",width="+popupwidth+", height="+popupheight;
	popupname=window.open(url,popupname,options);
	popupname.focus();
}