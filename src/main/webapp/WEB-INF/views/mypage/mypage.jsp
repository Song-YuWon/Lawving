<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
#box{position: relative; width: 600px; height: auto; margin: 0 auto;}
#ltoolmenu {
list-style-type: none;
padding: 0;
position: fixed;
overflow: auto;
left:8%;
bottom:40%;
z-index:10000;
}
#m1,#m2,#m3{width: 200px;height: 100px; font-size: 30px; 
 border-radius: 10px;border: none;
background-color: #36454F;
font-family: 'Abril Fatface', cursive;
color: white;
}
/* 오른쪽툴팁메뉴 */
#m1:hover{background-color: white; color: black;}
#m2:hover{background-color: white; color: black;}
#m3:hover{background-color: white; color: black;}

/* 테이블 */
.tab{background-color: white; width: 600px; height: 500px; margin: auto; border-radius: 20px; }

/* 북마크테이블 */
.bookmark{background-color: white; width: 600px; height: 500px; margin: auto; border-radius: 20px;border-collapse: collapse; }
.bookmark td { font-weight: bold; border-bottom: 1px solid black;
border-top: 1px solid black;
}
/* 콘텐츠영역 */
#box div{
width: 600px;
height: auto;
margin: auto;}
caption{font-weight: bold; color: white; font-size: 40px;}
article{height: 0 auto; background-color: #85929E;
 border-radius: 20px;
}
#box div{    padding-top: 50px;}
/* paging 영역*/
table tfoot ol.paging {list-style: none;}
table tfoot ol.paging li {float: left;margin-right: 8px;}
table tfoot ol.paging li a {display: block;padding: 3px 7px;border: 1px solid #00B3DC;color: #2f313e;font-weight: bold;}
table tfoot ol.paging li a:hover {background: #00B3DC;color: white;font-weight: bold;}
.disable {padding: 3px 7px;border: 1px solid silver;color: silver;}
.now {	padding: 3px 7px;border: 1px solid #ff4aa5;background: #ff4aa5;color: white;font-weight: bold;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
/* 툴팁메뉴버튼 제이쿼리는 추후 버튼누를시 정보 불러오기때문에 ajax로 변경해야함 */
$(function() {
	
	$(document).on('click','#m3',function() {
		$('.menu1').css('display','none');
	    $('.menu2').css('display','none');
	    $('.menu3').css('display','');
	    $('.menu4').css('display','none');
	});
	$(document).on('click','#m2',function() {
		$('.menu1').css('display','none');
	    $('.menu2').css('display','');
	    $('.menu3').css('display','none');
	    $('.menu4').css('display','none');
	});
	$(document).on('click','#m1',function() {
	    $('.menu1').css('display','');
		$('.menu2').css('display','none');
	    $('.menu3').css('display','none');
	    $('.menu4').css('display','none');
	});
})
</script>
<script type="text/javascript">
function checkAll() {
	if( $("#all_chkdel").is(':checked') ){
        $("input[id=chkdel]").prop("checked", true);
      }else{
        $("input[id=chkdel]").prop("checked", false);
      }
}
</script>
<body>
<c:import url="/WEB-INF/views/header.jsp" />
<article>
<div id="box">
<script type="text/javascript">
</script>
	<!-- 오른쪽툴팁메뉴 -->
	<ul id="ltoolmenu"><li><button id="m1">INFO</button></li><li><button id="m2">SET INFO</button></li><li><button id="m3">BookMark</button></li></ul>
	<!-- 내정보 -->
	<div class="menu1" style="display: none;">
	<table class="tab">
	<caption>MY Information</caption>
	<tbody>
	 <c:choose>
	<c:when test="${empty sessionScope.loginMember}">
	<tr><td colspan="2">회원정보없음</td></tr>
	</c:when>
	<c:otherwise>
	<c:set var="m" value="${sessionScope.loginMember}" />
	<tr><td>이름 :</td><td><input type="text" disabled value="${m.members_name }"></td></tr>
	<tr><td>ID :</td><td><input type="text" disabled value="${m.members_id }"></td></tr>
	<tr><td>Email :</td><td><input type="text" disabled value="${m.members_email }"></td></tr>
	<tr><td>생년월일</td><td><input type="text" disabled value="${m.members_birth}"></td></tr>
	<tr><td>휴대전화</td><td><input type="text" disabled value="${m.members_tel }"></td></tr>
	<tr><td>가입날짜</td><td><input type="text" disabled value="${m.members_reg }"></td></tr>
	<tr><td colspan="2"><button id="signout" style="width: 100px; height: 50px; 
	background-color:#85929E; color: white; font-weight: bold;border-radius: 20px;" onclick="location.href='delete_members.do?members_idx=${m.members_idx}'">회원탈퇴</button></td></tr>
	 </c:otherwise>
	</c:choose>
	</tbody>
	</table>
	</div>
	<!-- 내정보수정 -->
	<div class="menu2" style="display: none;">
	<form action="update_members.do" method="post" id="mupdateForm">
	<table class="tab" >
	<caption>Set Information</caption>
	<tbody>
	 <c:choose>
	<c:when test="${empty sessionScope.loginMember}">
	<tr><td colspan="2">회원정보없음</td></tr>
	</c:when>
	<c:otherwise>
	<tr><td>이름 :</td><td><input type="text" disabled value="${m.members_name}" ></td></tr>
	<tr><td>ID :</td><td><input type="text" disabled value="${m.members_id }"></td></tr>
	<input type="hidden" name="members_id" value="${m.members_id }">
	<tr><td>Email :</td><td><input type="text" id="members_email" name="members_email" value="${m.members_email }" required></td></tr>
	<tr><td>생년월일</td><td><input type="text" id="members_birth" name="members_birth" value="${m.members_birth}" required></td></tr>
	<tr><td>휴대전화</td><td><input type="text" id="members_tel" name="members_tel" value="${m.members_tel }" required></td></tr>
	<tr><td colspan="2"><button id="update" type="submit" style="width: 100px; height: 50px; background-color:#85929E; color: white;
	 font-weight: bold;border-radius: 40px;">수정하기</button></td></tr>
	 </c:otherwise>
	</c:choose>
	</tbody>
	</table>
	</form>
	</div>
	<!-- 북마크 -->
	<div class="menu3" style="display: none;">
	<table class="bookmark">
	<caption>MY BOOKMARK</caption>
	<tbody>
	 <c:choose>
	<c:when test="${empty blist}">
	<tr><td colspan="3">북마크정보없음</td></tr>
	</c:when>
	<c:otherwise>
	<tr><td style="border: none;"><input type="checkbox" id="all_chkdel" onclick="checkAll()" class="all_chkdel">전체선택</td><td style="border: none;"></td><td style="border: none;"><button>선택삭제</button></td></tr>
	<c:forEach items="${blist }" var="b">
	<tr><td><input type="checkbox" id="chkdel" class="chkdel" value="${b.bookmark_idx }"></td><td><a href="#">${b.bookmark_category}</a></td><td>${b.bookmark_reg}</td></tr>
	 </c:forEach>
	 <tfoot>
		<tr>
			<td colspan="4">
				<ol class="paging">
				<!-- 이전 -->
					<c:choose>
						<c:when test="${paging.beginBlock <= paging.pagePerBlock }">
							<li class="disable">이전으로</li>
						</c:when>
						<c:otherwise>
							<li><a href="go_library.do?cPage=${paging.beginBlock-paging.pagePerBlock }">이전으로</a></li>
								</c:otherwise>
							</c:choose>
							<!-- 블록안에 들어간 페이지번호들 -->
							<c:forEach begin="${paging.beginBlock }" end="${paging.endBlock}"
								step="1" var="k">
								<!-- 현재 페이지와 현재 페이지가 아니것으로 구분 -->
								<c:choose>
									<c:when test="${k==paging.nowPage }">
										<li class="now">${k}</li>
									</c:when>
									<c:otherwise>
										<li><a href="go_library.do?cPage=${k}">${k}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<!-- 다음 -->
							<c:choose>
								<c:when test="${paging.endBlock >= paging.totalPage }">
									<li class="disable">다음으로</li>
								</c:when>
								<c:otherwise>
									<li><a
										href="go_library.do?cPage=${paging.beginBlock+paging.pagePerBlock }">다음으로</a></li>
								</c:otherwise>
							</c:choose>
						</ol>
					</td>
				</tr>
			</tfoot>
	 </c:otherwise>
	</c:choose>
	</tbody>
	</table>
	</div>
	<div class="menu4" style="display: block;">
		<center><div style="width: 600px; height: 500px; background-color: #1e90ff; border-radius: 50px; font-weight: bold; font-size: 40px;line-height: 100px;"><h1 style="line-height: 5; color: aliceblue;">MY PAGE</h1></div><center>
	</div>
</div>
<br><br><br><br>
</article>
</body>
</html>