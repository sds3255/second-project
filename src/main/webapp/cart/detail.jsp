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
	margin-bottom: 20px;
}

#btn1 {
	margin-bottom:20px;
	display: flex;
	justify-content: center;
}
#btn2 {
	margin-bottom:50px;
	margin-top:50px;
	display: flex;
	justify-content: center;
}

#btn2>.btn3,#btn1_1 {
	margin-right: 90px;
	margin-left: 90px;
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
.one{
 	border-top: 2px solid #444444;
 	border-bottom: 0.5px solid #D3D3D3;
 	width: 100%;
    border-collapse: collapse;
}
.one th, .one td{
    border-left: 0.5px solid #D3D3D3;
    padding: 10px;
}
.one th:first-child, .one td:first-child {
    border-left: none;
  }
  #one td {vertical-align: middle;}

#one td:nth-child(3) a{  font-size: medium;}
#two td:nth-child(2) a{  font-size: medium;}
	footer {
		text-align: center;
	}
</style>
<title>??????/????????????</title>
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
				<li><a href="ccontroller?func=all&category=all"  >all</a></li>
				<li><a href="ccontroller?func=all&category=PC001">phone case</a></li>
				<li><a href="ccontroller?func=all&category=AC002">airpods case</a></li>
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
		<a href="logout.jsp">LOGOUT</a> |
		<a href="ccontroller?func=cart&funcc=cartin&id=${id }">CART</a> |
		<a href="user/mypage.jsp?id=${id }">MYPAGE</a>  
		<c:choose>
		<c:when test="${fn:contains(id, 'admin')}">			
			| <a href="admin.jsp?id=${id }">ADMIN</a>
		</c:when> 
		<c:otherwise>
		
		</c:otherwise>
		</c:choose>
	</div>
	</div>
	<div class="container">
		<h2>??????/????????????</h2>
		<form action="ccontroller" method="post" name="o_frm" id="frm">

			<table class="table table-striped" >
				<thead >
					<tr>
						<th>No.</th>
						<th>????????????</th>
						<th>?????????</th>
						<th>??????</th>
						<th>????????????</th>
						<th>?????????</th>
						<th>????????????</th>
						<th>????????????</th>
						<th ></th>

					</tr>
				</thead>
				<tbody  id="one">

					<c:forEach var="vo" items="${olist}">
						<tr>
							<td>${vo.oNum}</td>
							<td>${vo.productNum}</td>
							<td><a href="#" onclick="nameclick(${vo.productNum})">${vo.productName}<br>(${vo.model })</a>
								<input type="hidden" name="id" value="${id }"></td>
							<td>${vo.cCount}&nbsp;???</td>
							<td><fmt:formatNumber value="${vo.price}"/>???</td>
							<td><fmt:formatNumber value="${vo.saleprice}"/>???</td>
							<td>${vo.oDate}</td>
							<td>${vo.payment}</td>
							<c:if test="${vo.payment eq '????????????'}">
							<td>
								<button  class="btn btn-outline-secondary"  name="onum"  value="${vo.oNum}" id="detail">????????????</button> 
							 	<input type="hidden" name="funcc" value="detail"> 
								<input type="hidden" name="func" value="payment">
								<input type="hidden" name="id" value="${id }">
							</td>

					</c:if>
					<c:if test="${vo.payment eq '????????????'}">
						<td></td>
					</c:if>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="9" class="noborder">
							<ol class="paging">
								<%--[????????????]??? ?????? ???????????? ?????? --%>
								<c:if test="${pvo.beginPage == 1 }">
									<li class="disable">&nbsp;&lt;&nbsp;</li>
								</c:if>
								<c:if test="${pvo.beginPage != 1 }">
									<li><a href="#" onclick="back(${pvo.beginPage - 1})">&nbsp;&lt;&nbsp;</a></li>
								</c:if>
								<%--???????????? ????????? ????????? ????????????(???????????????~????????????) --%>
								<c:forEach var="pageNo" begin="${pvo.beginPage }"
									end="${pvo.endPage }">
									<c:if test="${pageNo == pvo.nowPage }">
										<li class="now">${pageNo }</li>
									</c:if>
									<c:if test="${pageNo != pvo.nowPage }">
										<li><a href="#" onclick="back(${pageNo})">${pageNo }</a></li>
									</c:if>
								</c:forEach>
								<%--[????????????]??? ?????? ???????????? ?????? --%>
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

 			<br><br><br>
			<hr size="5" noshade> 
	<h4>&lt;?????? ????????????&gt;</h4> &nbsp;&nbsp;
	<h6><input type="hidden" name="oNum" value="${pivo.oNum}">No.${pivo.oNum}&nbsp;/&nbsp;????????????&nbsp;&nbsp; ${pivo.oDate}</h6>
		 	<table class="one" id="table1">
		 	<colgroup>
				<col style="width:35%">
				<col style="width:35%">
				<col style="width:30%">
			</colgroup>
				<thead>
					<tr>
						<th >????????????</th>
						<th>?????????</th>
						<th>??????</th>
					</tr>
				</thead>
				
				<tbody id="two">
				<c:forEach var="dvo" items="${dvo}">
					<tr>
						<td><img alt="????????????" src="image/${dvo.image }.jpg"   style="width:50%; height:250px; "></td>
						<td><a href="#" onclick="nameclick(${dvo.productNum})">${dvo.productName }<br>(${dvo.model })</a></td>
						<td>${dvo.cCount }&nbsp;???</td>
					</tr>
					</c:forEach>
				</tbody>
				</table><br><br>
				<div id="btn1">
					<input type="button" id="btn1_1" class="btn btn-outline-warning" name="review" value="????????????" onclick="revieww()">
					<input type="button" class="btn btn-outline-warning" name="qna" value="???????????????" onclick="qnaa()">
				</div>
				
	<h5>??????/?????? ?????? ??????</h5>
				<table class="one">
				<thead>
					<tr>
						<th colspan="2">??????????????????</th>
						<th colspan="2">????????????</th>
						<th colspan="2">????????????</th>
					</tr>
				</thead>
					<tbody>
					<tr>
						<td>????????????</td>				
					 	<td style="border-left:none;"><fmt:formatNumber value="${pivo.price }"/>???</td>
						<td>????????????</td>				
						<td style="border-left:none;">${pivo.oPayment } </td>					
						<td>????????????</td>
						 	<c:choose>
						 		<c:when test="${tpp.totalSalePrice eq 0 }">
									<td style="border-left:none;"><fmt:formatNumber value="${pivo.price }"/>???</td>
								</c:when>
						 		<c:otherwise>
									<td style="border-left:none;"><fmt:formatNumber value="${pivo.payprice }"/>???</td>
						 		</c:otherwise>
						 	</c:choose> 
					 	</tr>
					 	<tr>
						<td>????????????</td>
						 	<c:choose>
						 		<c:when test="${tpp.totalSalePrice eq 0 }">
									<td style="border-left:none;"><fmt:formatNumber value="${tpp.totalSalePrice }"/>???</td>
								</c:when>
						 		<c:otherwise>
									<td style="border-left:none;"><fmt:formatNumber value="${pivo.payprice }"/>???</td>
						 		</c:otherwise>
						 	</c:choose> 
						<td rowspan="3"></td>
						<td rowspan="3" style="border-left:none;"></td>		
						<td style="font-size:0.8em;">(${pivo.oPayment } :  </td>
						<c:choose>
						 		<c:when test="${tpp.totalSalePrice eq 0 }">
									<td style="border-left:none;"><fmt:formatNumber value="${pivo.price }"/>???)</td>
								</c:when>
						 		<c:otherwise>
								<td style="border-left:none; font-size:0.8em;"><fmt:formatNumber value="${pivo.payprice }"/>???)</td>
						 		</c:otherwise>
						 	</c:choose> 
						</tr>
						<tr>
						<td>?????????</td>
						<td style="border-left:none;"><fmt:formatNumber value="${tpp.delPrice }"/>???</td>
						<td rowspan="2"></td>
						<td rowspan="2" style="border-left:none;"></td>
						</tr>
						<tr>
						<td>????????????</td>
						<td style="border-left:none;"><fmt:formatNumber value="${tpp.coupon }"/>???</td>
					</tr>
					<tr>	 </tr>

					</tbody>
				</table><br><br>

	<h5>????????? ??????</h5>
	<table class="one">
	<tr>
		<td>????????? &nbsp;&nbsp;&nbsp;&nbsp;${pivo.receiver }</td>
		<th style="border-bottom:0.5px solid #D3D3D3;">???????????????</th>
	</tr>
	<tr>
		<td>????????? &nbsp;&nbsp;&nbsp;&nbsp;${pivo.oPhone }</td>
		<td>${cvo.name}</td>
	</tr>
	<tr>
		<td>????????? &nbsp;&nbsp;&nbsp;&nbsp;${pivo.oAddr }</td>
		<td>${cvo.email }</td>
	</tr>
	<tr>
		<td>???????????? &nbsp;&nbsp;&nbsp;&nbsp;${pivo.memo }</td>
		<td>${cvo.phone }</td>
	</tr>
	</table>
 				<div id="btn2">
					<input type="button" class="btn btn-outline-dark" value="?????????" onclick="reorder()">
					<input type="hidden" name="onum" value="<%-- ${dvo.oNum } --%>">
					<span class="btn3">
						<input type="button" class="btn btn-outline-dark" value="????????????(????????????)" onclick="refund(this.form)">
						<input type="hidden" name="cPage" value="${pvo.nowPage }">
					</span>
					<span>
						<input type="button" class="btn btn-outline-dark" name="cartadd" value="??????????????????" onclick="cartAdd(this.form)">
					</span>
				</div> 
		</form>
	</div>
</body>
<script>
	function cartAdd(frm) {
			frm.action = "ccontroller?func=detail&funcc=cartadd";
			alert("??????????????? ???????????????. ??????????????? ???????????????.");
			frm.submit();
	}
	function refund(frm) {
			frm.action = "ccontroller?func=detail&funcc=refund";
			alert("????????? ?????????????????????. ??????????????? ??????????????? 2-3????????? ?????????????????????.");
			frm.submit();
	}
	function reorder() {
		var onum =$("#detail").val();
		var id = $("#id").val();
		location.replace("ccontroller?func=detail&funcc=reorder&onum="+onum+"&id=${id }");
	}
	function revieww() {
		frm.action = "ccontroller?func=detail&funcc=review&id=${id }";
		frm.submit();
	}
	function qnaa() {
		frm.action = "ccontroller?func=detail&funcc=qna&id=${id }";
		frm.submit();
	}

	//????????????&??????, ??????&?????? ??????
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
	
	//?????????????????? ??????
	function back(pageNo) {
		var frm = document.getElementById('frm');
		frm.action = "ccontroller?func=payment&funcc=detail&cPage="+pageNo + "&onum=${pivo.oNum}" ;
		frm.submit();
	}	
	//???????????? ??????
	function nameclick(productnum) {
		let frm = document.forms.o_frm;
		frm.action = "ccontroller?func=content&productNum="+productnum;
		frm.submit();
	}
	function all_go(category) {
		var frm = document.getElementById('main');
		if (category == "all") {
			frm.action = "ccontroller?func=all&category=" + category;
			frm.submit();
		} else if (category == "PC001") {
			frm.action = "ccontroller?func=all&category=" + category;
			frm.submit();
		}else if (category == "AC002") {
			frm.action = "ccontroller?func=all&category=" + category;
			frm.submit();
		}
	}
	function cart_go() {
		var frm = document.getElementById('main');
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
</script>
<br><br><br><br><br><br><br><br><br><br><hr>
<footer>
	<p class="copyright">copyright ?? 2022 CaseShop (Case#). All rights reserved.</p>
	<p class="copyright">?????? : ????????? ????????? ???????????? 124,4F(?????????,????????????) | ???????????? : 02-0123-4567 | ?????? : phonecaseshop@co.kr</p>
</footer>
</html>
						
						
						