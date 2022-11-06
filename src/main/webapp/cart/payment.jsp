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


<link href="css/main.css" rel="stylesheet" type="text/css">
<title>주문/결제하기</title>
<style>
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
	margin-top: 50px;
	margin-bottom: 50px;
}

td {
	/* border: 1px solid red; */
	vertical-align: middle;
}

table th:nth-child(2) {
	width: 20%;
	height: 20%;
}

#agreement, #btn {
	display: flex;
	justify-content: center;
}

#adress, #order, #pay, #detail {
	padding-top: 30px;
	margin-top: 20px;
}

#adress  table, #order table, #pay table {
	text-align: left;
}

.custom-select {
	width: 200px;
}

#dname, #dphonenum {
	width: 500px;
}

#dadress {
	width: 950px;
}

#btn {
	text-align: center;
}

#bbtn {
	margin-right: 50px;
}

#tbody td {
	vertical-align: middle;
}

thead {
	background-color: #FFF5EE;
}
	footer {
		text-align: center;
	}
</style>
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
		<a href="cart.jsp?id=${id }">CART</a> |
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
		<h2>주문/결제하기</h2>
		<form action="ccontroller" method="post" name="frm">
			<table class="table">
				<colgroup>
					<col style="width: 15%">
					<col style="width: 25%">
					<col style="width: 20%">
					<col style="width: 15%">
					<col style="width: 15%">
					<col style="width: 10%">
				</colgroup>
				<thead id="thead">
					<tr>
						<th>상품번호</th>
						<th>상품사진</th>
						<th>상품명</th>
						<th>상품가격</th>
						<th>할인가</th>
						<th>수량</th>
					</tr>
				</thead>
				<tbody id="tbody">
					<c:if test="${choose eq 'cart'}">
						<c:forEach var="vo" items="${plist}">
							<input type="hidden" name="id" value="${vo.id }">
							<input type="hidden" name="choose" value="${choose }">
							<tr>
								<td><input type="hidden" name="cnum" value="${vo.cNum }">${vo.cNum }</td>
								<td><img alt="제품사진" src="image/${vo.image}.jpg"
									style="width: 100%; height: 250px;"></td>
								<td>${vo.productName}<br>(${vo.model })
								</td>
								<td><fmt:formatNumber value="${vo.price}" />원</td>
								<td><fmt:formatNumber value="${vo.saleprice}" />원</td>
								<td>${vo.cCount }&nbsp;개</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:forEach var="ovo" items="${ovo}">
						<c:if test="${choose eq 'reorder'}">
							<input type="hidden" name="choose" value="${choose }">
							<input type="hidden" name="id" value="${ovo.id }">${ovo.id }
						<tr>
								<td><input type="hidden" name="onum" value="${ovo.oNum }">${ovo.productNum }</td>
								<td><img alt="제품사진" src="image/${ovo.image}.jpg"
									style="width: 40%; height: 40%"></td>
								<td>${ovo.productName}<br>(${ovo.model })
								</td>
								<td><fmt:formatNumber value="${ovo.price}" />원</td>
								<td><fmt:formatNumber value="${ovo.saleprice}" />원</td>
								<td>${ovo.cCount }</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>

			<div id="order">
				<table class="table">
					<thead>
						<tr>
							<th>주문자</th>
						</tr>
					</thead>
					<tr>
						<td>이름 : ${cvo.name }</td>
					</tr>
					<tr>
						<td>이메일 : ${cvo.email }</td>
					</tr>
					<tr>
						<td>전화번호 : ${cvo.phone }</td>
					</tr>
					<tr>
						<td>주소 : ${cvo.addr }</td>
					</tr>
				</table>
			</div>
			<div id="adress">
				<table class="table">
					<thead>
						<tr>
							<th colspan="4">배송지</th>
						</tr>
					</thead>
					<tr>
						<td>받는사람 : <input type="text" class="form-control"
							placeholder="이름을 입력하세요" id="dname" name="dname">
						</td>
					</tr>
					<tr>
						<td>전화번호 : <input type="tel" class="form-control"
							pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required
							placeholder=" 123-4567-9808" id="dphonenum" name="dphonenum"></td>
					</tr>
					<tr>
						<td>주소 : <input type="text" class="form-control"
							placeholder="주소를 입력하세요" id="daddress" name="dadress"></td>
					</tr>
					<tr>
						<td>배송메모 : <input type="text" class="form-control"
							value="요청사항 없음" placeholder="배송메모를 입력하세요" id="memo" name="dmemo"></td>
					</tr>
				</table>
			</div>


			<div id="pay">
				<table class="table">
					<thead>
						<tr>
							<th>결제수단</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<div class="custom-control custom-radio">
									<label><input type="radio" id="customRadio"
										name="dpayment" value="무통장입금" checked="checked"
										autocomplete="off"> 무통장입금</label> &nbsp;&nbsp;&nbsp;&nbsp; <select
										name="radiodetail" class="radiodetail">
										<option value="" selected disabled="disabled">-- 선택
											--</option>
										<option value="sel">case#:::::신한 062-5456-55543543-10</option>
									</select> <br> <label><input type="radio" id="customRadio"
										name="dpayment" value="신용카드" autocomplete="off"> 신용카드</label><br>
									<label><input type="radio" id="customRadio"
										name="dpayment" value="휴대폰결제" autocomplete="off">
										휴대폰결제</label> <br>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div id="detail">

				<table class="table">
					<thead>
						<tr>
							<th>결제상세</th>
						</tr>
					</thead>
					<tbody>
						<fmt:formatNumber value="" />
						<tr>
							<td>상품금액: &nbsp; &nbsp;<fmt:formatNumber
									value="${tp.totalPrice }" />원<input type="hidden"
								name="totalPrice" value="${tp.totalPrice }">
							</td>
						<tr>
							<c:choose>
								<c:when test="${tp.totalSalePrice eq 0 }">
									<td>할인금액(할인 적용 금액): &nbsp; &nbsp;<fmt:formatNumber
											value="${tp.totalPayPrice}" />원<input type="hidden"
										name="totalPayPrice" value="${tp.totalPayPrice }">
									</td>
								</c:when>
								<c:otherwise>
									<td>할인금액(할인 적용 금액): &nbsp; &nbsp;<fmt:formatNumber
											value="${tp.totalPayPrice }" />원<input type="hidden"
										name="totalPayPrice" value="${tp.totalPayPrice }">
									</td>
								</c:otherwise>
							</c:choose>
						</tr>
						<tr>
							<td>배송비: &nbsp; &nbsp;<fmt:formatNumber
									value="${tp.delPrice }" />원
							</td>
						</tr>
						<tr>
							<td>쿠폰할인: &nbsp; &nbsp;<fmt:formatNumber
									value="${tp.coupon }" />원
							</td>
						</tr>
						<tr>

							<c:choose>
								<c:when test="${tp.totalSalePrice eq 0 }">
									<td>결제금액 : &nbsp; &nbsp;<fmt:formatNumber
											value="${tp.totalPayPrice}" />원
									</td>
								</c:when>
								<c:otherwise>
									<td>결제금액: &nbsp; &nbsp;<fmt:formatNumber
											value="${tp.totalPayPrice }" />원
									</td>
								</c:otherwise>
							</c:choose>
						</tr>

					</tbody>
				</table>
			</div>
			<table id="btn">
				<tr>
					<th><label><input type="checkbox" name="infocheck"
							value="infocheck"> 주문 내용을 확인하였으며, 정보 제공 등에 동의합니다.</label> <br>
						<br> <input id="bbtn" type="button"
						class="btn btn-outline-dark" value="결제하기" onclick="pay_go()">
						<input type="button" class="btn btn-outline-dark" value="취소"
						onclick="cansel(this.form)"></th>
				</tr>
			</table>
		</form>
	</div>
	<script>
		$(document).ready(function() {
			$("input:radio[name=dpayment]").click(function() {
				if ($("input:radio[name=dpayment]:checked").val() == '무통장입금') {
					$(".radiodetail").attr('disabled', false);
				} else {
					$(".radiodetail").attr('disabled', true);
				}
			});
		})

		function pay_go() {
			var frm = document.frm;

			var chk_i = 0;
			if (frm.dname.value == "") {
				alert("이름을 입력하세요.");
				frm.dname.focus();
				return;
			}
			if (frm.dadress.value == "") {
				alert("주소를 입력하세요.");
				frm.dadress.focus();
				return;
			}
			if (frm.dphonenum.value == "") {
				alert("휴대폰번호를 입력하세요.");
				frm.dphonenum.focus();
				return;
			}
			if ((frm.dpayment[0].checked == false)
					&& (frm.dpayment[1].checked == false)
					&& (frm.dpayment[2].checked == false)) {
				alert("결제수단을 선택하세요.");
				return;
			}
			if ((frm.dpayment[0].checked == true)
					&& (frm.radiodetail.value == "")) {
				alert("결제수단을 선택하세요.");
				return;
			}
			if (frm.infocheck.checked != true) {
				alert("개인정보 수집에 동의해 주세요.");
				frm.confirm.focus();
				return false;

			} else {
				if ($("input[name=choose]").val() == "cart") {
					frm.action = "ccontroller?func=payment&funcc=cart&id=${id}";
					alert("결제가 완료되었습니다.");
					frm.submit();
				} else {
					frm.action = "ccontroller?func=payment&funcc=reorder&id=${id}";
					alert("결제가 완료되었습니다.");
					frm.submit();
				}
			}
		}
		function cansel(frm) {
			alert("결제가 취소되었습니다. 이전화면으로 돌아갑니다.")
			frm.action = "ccontroller?func=payment&funcc=cansel";
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
	</script>
</body>
<br><br><br><br><br><br><br><br><br><br><hr>
<footer>
	<p class="copyright">copyright © 2022 CaseShop (Case#). All rights reserved.</p>
	<p class="copyright">주소 : 서울시 강남구 테헤란로 124,4F(역삼동,삼원타워) | 대표번호 : 02-0123-4567 | 문의 : phonecaseshop@co.kr</p>
</footer>
</html>