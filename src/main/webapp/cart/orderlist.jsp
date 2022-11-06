<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="shop-main.jsp">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<link href="css/main.css" rel="stylesheet" type="text/css">
<style>
	@import
url('https://fonts.googleapis.com/css2?family=Anton&display=swap');
	@font-face {
	    font-family: 'IBMPlexSansKR-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Regular.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
.container {
	overflow: auto;
	min-width: 1300px;
	max-width: 1300px;
}

.container h2 {
	padding-top: 50px;
	padding-bottom: 80px;
	text-align: center;
}

table {
	text-align: center;
	margin-top: 20px;
	margin-bottom: 50px;
}

#btn {
	width:
	display: flex;
	justify-content: center;
}

#btn>.btn3 {
	padding-right: 90px;
	padding-left: 90px;
}

.paging {
	list-style: none;
	padding-left: 400px;
	padding-top: 40px;
}

.paging li {
	float: left;
	margin-right: 45px;
}

.paging li a {
	text-decoration: none;
	display: block;
	padding: 3px 7px;
	font-weight: bord;
}

.paging .disable {
	padding: 3px 7px;
	color: silver;
}

.paging .now {
	padding: 3px 7px;
}
#one td{
vertical-align: middle
}

td:nth-child(3) a{  font-size: medium;}
	footer {
		text-align: center;
	}
</style>
<title>주문/결제내역</title>
</head>
<body>
<div id="wrap">
	<hr>
	<div id="header">
		<span class="title"><a href="user/shoplogin.jsp?id=${id }">CASE #</a></span>
	</div>
	<hr>
	<div id="nav">
	<ul>
		<li>
			<a type="button" onclick="shopclick()" id="shop">SHOP</a> | 
			<ul>
				<li><a href="ccontroller?func=all&category=all&id=${id }"  >all</a></li>
				<li><a href="ccontroller?func=all&category=PC001&id=${id }">phone case</a></li>
				<li><a href="ccontroller?func=all&category=AC002&id=${id }">airpods case</a></li>
			</ul>
		</li>
		<li>
			<a href="bord/community.jsp?id=${id }" id="community">COMMUNITY</a> | 
			<ul>
				<li><a href="bord/review.jsp?id=${id }">Review</a></li>
				<li><a href="bord/qna.jsp?id=${id }">Q&A</a></li>
			</ul>
		</li>
	</ul>
	<c:choose>
	<c:when test="${id eq '' || id eq null}">
		<a href="user/login.jsp">LOGIN</a> |
		<a href="user/join.jsp">JOIN US</a> |
	</c:when>
	<c:otherwise>
		<a href="user/logout.jsp">LOGOUT</a> |
	</c:otherwise>
	</c:choose>	
	<a href="ccontroller?func=cart&funcc=cartin&id=${id }">CART</a> |
		<a href="user/mypage.jsp?id=${id}">MYPAGE</a>  
	<c:choose>
		<c:when test="${fn:contains(id, 'admin')}">			
			| <a href="admin.jsp">ADMIN</a>
		</c:when> 
		<c:otherwise>
			
		</c:otherwise>
	</c:choose>
	</div>
	</div>
	<div class="container">
		<h2>주문/결제내역</h2>
		<form action="ccontroller" method="post" name="o_frm" id="frm">

			<table class="table table-striped">
				<thead>
					<tr>
						<th>No.</th>
						<th>상품번호</th>
						<th>상품명</th>
						<th>수량</th>
						<th>상품원가</th>
						<th>할인가</th>
						<th>주문날짜</th>
						<th>결제여부</th>
						<th></th>
					</tr>
				</thead>
				<tbody  id="one">
								<c:if test="${empty olist }">
					<tr>
						<td colspan="9">주문내역이 없습니다.</td>
					</tr>
				</c:if>
					<c:forEach var="vo" items="${olist}">
						<tr>
							<td>${vo.oNum}</td>
							<td>${vo.productNum}</td>
							<td><a href="#" onclick="nameclick(${vo.productNum})">${vo.productName}<br>(${vo.model })</a>
								<input type="hidden" name="id" value="${id }"></td>
							<td>${vo.cCount}&nbsp;개</td>
							<td><fmt:formatNumber value="${vo.price}"/>원</td>
							<td><fmt:formatNumber value="${vo.saleprice}"/>원</td>
							<td>${vo.oDate}</td>
							<td>${vo.payment}</td>
					<c:if test="${vo.payment eq '결제완료'}">
							<td>
								<button  class="btn btn-outline-secondary"  name="onum" value="${vo.oNum}" id="detail">주문상세</button> 
							 	<input type="hidden" name="funcc" value="detail"> 
								<input type="hidden" name="func" value="payment">
								<input type="hidden" name="id" value="${id }">
							</td>
					</c:if>
					<c:if test="${vo.payment eq '환불완료'}">
							<td></td>
					</c:if>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="9">
							<ol class="paging">
								<%--[이전으로]에 대한 사용여부 처리 --%>
								<c:if test="${pvo.beginPage == 1 }">
									<li class="disable">&nbsp;&lt;&nbsp;</li>
								</c:if>
								<c:if test="${pvo.beginPage != 1 }">
									<li><a href="#" onclick="back(${pvo.beginPage - 1})">&nbsp;&lt;&nbsp;</a></li>
								</c:if>
								<%--블록내에 표시할 페이지 태그작성(시작페이지~끝페이지) --%>
								<c:forEach var="pageNo" begin="${pvo.beginPage }"
									end="${pvo.endPage }">
									<c:if test="${pageNo == pvo.nowPage }">
										<li class="now">${pageNo }</li>
									</c:if>
									<c:if test="${pageNo != pvo.nowPage }">
										<li><a href="#" onclick="back(${pageNo})">${pageNo }</a></li>
									</c:if>
								</c:forEach>
								<%--[다음으로]에 대한 사용여부 처리 --%>
								<c:if test="${pvo.endPage < pvo.totalPage }">
									<li><a href="#" onclick="back(${pvo.endPage + 1 })">&nbsp;&gt;&nbsp;</a>
									</li>
								</c:if>
								<c:if test="${pvo.endPage >= pvo.totalPage }">
									<li class="disable">&nbsp;&gt;&nbsp;</li>
								</c:if>
							</ol>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
<script>
	//전체선택&취소, 선택&취소 기능
	$(document).ready(function() {
		$("#ch3").click(function() {
			if ($("#ch3").is(":checked"))
				$("input[name=chk4]").prop("checked", true);
			else
				$("input[name=chk4]").prop("checked", false);
		});

		$("input[name=chk4]").click(function() {
			var total = $("input[id=ch4]").length;
			var checked = $("input[id=ch4]:checked").length;

			if (total != checked)
				$("#ch3").prop("checked", false);
			else
				$("#ch3").prop("checked", true);
		});
	});
	
	//페이지넘기기 기능
	function back(pageNo) {
		console.log("back()시작");
		var frm = document.getElementById('frm');
		console.log(pageNo);
		console.log(frm);
		frm.action = "ccontroller?func=payment&funcc=cart&cPage="+pageNo;
		console.log(pageNo);
		frm.submit();
	}	
	//상품이름 클릭
	function nameclick(productnum) {
		let frm = document.forms.o_frm;
		frm.action = "ccontroller?func=content&productNum="+productnum;
		frm.submit();
	}
	function all_go(category) {
		var frm = document.getElementById('main');
		console.log(frm);
		console.log(category);
		if (category == "all") {
			console.log(category);
			frm.action = "ccontroller?func=all&category=" + category;
			frm.submit();
		} else if (category == "PC001") {
			console.log(category);
			frm.action = "ccontroller?func=all&category=" + category;
			frm.submit();
		} else if (category == "AC002") {
			console.log(category);
			frm.action = "ccontroller?func=all&category=" + category;
			frm.submit();
		}
	}
	function cart_go() {
		var frm = document.getElementById('main');
		console.log(frm);
		frm.action = "ccontroller?func=cart&funcc=cartin";
		frm.submit();
	}
	function shopclick() {
		if("${id}" != ""){
			location.href = "../user/shoplogin.jsp?id=${id}";
			return;
		} else {
			location.href = "../user/shop.jsp";
		}
	}
 	/* //상세보기 클릭시 같은화면 아래쪽에 정보 표시 기능
 	$().ready(function(){
		$("#detail").click(getDetail);
	});
	function getDetail(){
	//	var form = $("#frm").serialize();

		alert(">>getDetail실행");
		$.ajax({
			url:"controller",
			type:"get",

			dataType : "xml",
			success: function (data) {
				alert("Ajax처리 성공 : "+data);
				console.log(data); 
						
				let htmlTag = "";
				$(data).find("member").each(function(){
					console.log($(this).find("oNum").text()); 
					htmlTag += "<tr>";
					htmlTag += "<td>"+$(this).find("oNum").text()+"</td>";
					htmlTag += "<td>"+$(this).find("ProductNum").text()+"</td>";
					htmlTag += "<td>"+$(this).find("ProductName").text()+"</td>";
					htmlTag += "<td>"+$(this).find("SmallImage").text()+"</td>";
					htmlTag += "<td>"+$(this).find("cCount").text()+"</td>";
					htmlTag += "<td>"+$(this).find("Price").text()+"</td>";
					htmlTag += "<td>"+$(this).find("Saleprice").text()+"</td>";
					htmlTag += "</tr>";
				});
				$("#tbody").html(htmlTag);
				
			},
			error : function(jqXHR, textStatus, errorTHhrown,data) {
				
				alert("Ajax 처리 실패 \n  jqXHR:" + jqXHR.readyState + "\n"
						+ "textStatus: " + textStatus + "\n" + "errorTHhrown:"
						+ errorTHhrown+"data:"+data); 
			}
		});		
	}  */
</script>
<br><br><br><br><br><br><br><br><br><br><hr>
<footer>
	<p class="copyright">copyright © 2022 CaseShop (Case#). All rights reserved.</p>
	<p class="copyright">주소 : 서울시 강남구 테헤란로 124,4F(역삼동,삼원타워) | 대표번호 : 02-0123-4567 | 문의 : phonecaseshop@co.kr</p>
</footer>
</html>
