<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
tr td h2 {
	color: #4cde03;
	padding: 30px;
}

tr td h1 {
	color: #ee626b;
	padding: 20px;
}

#pdset {
	padding-left: 30px;
}

h1 {
	
}
</style>

<script src="https://js.tosspayments.com/v1/payment-widget"></script>

</head>
<body>

	<section class="page-top-section set-bg"
		data-setbg="usertemplet/img/images/bg-top-4.png">
		<div class="page-info">
			<h2>Cart</h2>
			<div class="site-breadcrumb">
				<a href="home.do">Home</a> / <span>Cart</span>
			</div>
		</div>
	</section>
	<!-- Page top end-->
	<div class="container">
		<div class="nk-store nk-store-cart">
			<div class="table-responsive">

				<!-- START: Products in Cart -->
				<table class="table nk-store-cart-products">
					<tbody>
						<!--  ITEM in Cart start -->
						<c:forEach items="${carts }" var="c">

							<c:if test="${c.cartPersonal == name }">
								<tr>
									<td class="nk-product-cart-thumb"><a
										href="javascript:selectGame(${c.gameId })"
										class="nk-image-box-1 nk-post-image"> <img
											src="${c.gameIllustMini }" alt="" width="115">
									</a></td>
									<td class="nk-product-cart-title">
										<h5 class="h6" id="pdset">Product:</h5>
										<div class="nk-gap-1"></div>
										<h2 class="nk-post-title h4">
											<a href="javascript:selectGame(${c.gameId })">${c.gameName }</a>
										</h2>
									</td>

									<td class="nk-product-cart-price">
										<h5 class="h6">Price:</h5>
										<div class="nk-gap-1"></div> <strong>${c.gamePrice }</strong>
									</td>

									<td class="nk-product-cart-quantity">
										<h5 class="h6">Discount:</h5> <c:if
											test="${c.gamePriceDiscount == 0 }">
											<div class="nk-gap-1"></div>
											<strong> - </strong>
										</c:if> <c:if test="${c.gamePriceDiscount != 0 }">
											<div class="nk-gap-1"></div>
											<strong>- ${c.gamePrice - c.gamePriceDiscount } </strong>
										</c:if>
									</td>

									<td class="nk-product-cart-total">
										<h5 class="h6">Total:</h5> <c:if
											test="${c.gamePriceDiscount == 0 }">
											<div class="nk-gap-1"></div>
											<strong>${c.gamePrice }원</strong>
										</c:if> <c:if test="${c.gamePriceDiscount != 0 }">
											<div class="nk-gap-1"></div>
											<strong>${c.gamePriceDiscount }원</strong>
										</c:if>
									</td>
									<td class="nk-product-cart-remove">
										<form action="cartitemdelete.do" method="post"
											onsubmit="return confirmDelete();">
											<input type="hidden" id="itemId" name="itemId"
												value="${c.itemId}"> <input type="hidden"
												id="cartPersonal" name="cartPersonal"
												value="${c.cartPersonal}">
											<button type="submit" class="btn btn-primary btn-round"
												aria-label="Remove">
												<span class="ion-android-close">X</span>
											</button>
										</form>
									</td>

								</tr>

							</c:if>
						</c:forEach>
						<c:if test="${empty carts && not empty id }">
							<tr>
								<td colspan="6" align="center"><h2>CAN PUT EVERYTHING
										TO HERE</h2></td>
							</tr>
							<tr>
								<td colspan="6" align="center"><h2>JUST ENJOY THE GAME
										IN LIFE ! ! !</h2></td>
							</tr>
						</c:if>
						<c:if test="${empty id}">
							<tr>
								<td colspan="6" align="center">
									<h2>CAN USE EVERYTHING</h2>
								</td>
							</tr>
							<tr>
								<td colspan="6" align="center">
									<h1>GAMERZ MEMBERZ !</h1>
								</td>
							</tr>
						</c:if>
						<!--  ITEM in Cart end -->
					</tbody>
				</table>
				<c:if test="${empty carts && not empty id}">
					<div class="nk-gap-1"></div>
					<a class="btn btn-primary btn-round btn-marquee float-right"
						href="promotion.do">GO LIFE ! DO GAME !</a>
				</c:if>
				<c:if test="${empty id}">
					<div class="nk-gap-1"></div>
					<a class="btn btn-primary btn-round btn-marquee float-right"
						href="logincontroller.do">GO LOGIN ! DO SIGNUP !</a>

				</c:if>
				<!-- END: Products in Cart -->
			</div>
			<c:forEach items="${carts }" var="c">

				<c:if
					test="${not empty carts && not empty id && c.cartPersonal == name }">

					<div class="nk-gap-1"></div>
					<a class="nk-btn nk-btn-rounded nk-btn-color-white float-right"
						href="gamelibrary.do">more games!</a>

					<div class="clearfix"></div>
					<div class="nk-gap-2"></div>
					<div class="row vertical-gap">
						<div class="col-md-6">

							<!-- START: Calculate Shipping -->

							<!-- END: Calculate Shipping -->

						</div>
						<div class="col-md-6">
							<!-- START: Cart Totals -->
							<div class="section title text-white">
								<h4>CART TOTALS</h4>
								<div class="nk-gap-1"></div>
							</div>
							<table class="nk-table nk-table-sm">
								<tbody>
									<tr class="nk-store-cart-totals-subtotal">
										<td>Order Name</td>
										<td>${c.cartPersonal }</td>
									</tr>
									<tr class="nk-store-cart-totals-shipping">
										<td>Order Address</td>
										<td>${c.memberAddress }</td>
									</tr>
									<tr class="nk-store-cart-totals-total">
										<td>Total</td>
										<td>${c.cartTotal }원</td>
									</tr>
								</tbody>
							</table>
							<!-- END: Cart Totals -->
						</div>
					</div>

					<div class="nk-gap-2"></div>

					<input id="tosspay"
						class="nk-btn nk-btn-rounded nk-btn-color-main-1 float-right"
						value="Proceed to Checkout" onclick='toggleToss()' />

					<div class="clearfix"></div>
				</c:if>
			</c:forEach>
		</div>

		<!-- 상품 정보 영역-->
		<c:forEach items="${carts }" var="c">
			<c:if test="${not empty id }">

				<hr>

				<!-- 결제 방법 영역-->
				<div id="toss" style="display: none;">
					<div class="title"></div>
					<div id="payment-method"></div>
					<div id="agreement"></div>
					<button id="payment-button"
						class="btn btn-primary btn-ghost btn-through">결제하기</button>
				</div>
			</c:if>
		</c:forEach>

	</div>

	<div class="nk-gap-2"></div>
	<div>
		<form id="gamefrm" action="gameinfo.do" method="post">
			<input type="hidden" id="gameId" name="gameId">
		</form>
	</div>

</body>


<script>
<c:forEach items="${carts }" var="c">
<c:if test="${not empty id }">
  const clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq' // 상점을 특정하는 키
  const customerKey = 'YbX2HuSlsC9uVJW6NMRMj' // 결제 고객을 특정하는 키
  const amount = "${c.cartTotal}"// 결제 금액

  /*결제위젯 영역 렌더링*/
  const paymentWidget = PaymentWidget(clientKey, customerKey) // 회원 결제
  paymentMethods = paymentWidget.renderPaymentMethods('#payment-method', amount)
  
  /*약관 영역 렌더링*/
  const paymentAgreement = paymentWidget.renderAgreement('#agreement')
  
  /*결제창 열기*/
  document.querySelector("#payment-button").addEventListener("click",()=>{
    paymentWidget.requestPayment({
      orderId: '${c.gameId}',
      orderName: '${c.gameName}',         
      successUrl: 'http://localhost/gamerz/success.do',
      failUrl: 'http://localhost/gamerz/fail.jsp',    
      customerEmail: '${c.memberEmail}',
      customerName: '${c.cartPersonal}'      
      }
    ).catch(function (error) {
          if (error.code === 'USER_CANCEL') {
          // 결제 고객이 결제창을 닫았을 때 에러 처리
          } if (error.code === 'INVALID_CARD_COMPANY') {
            // 유효하지 않은 카드 코드에 대한 에러 처리
          }
      })
    console.log('${c.cartPersonal}', '${c.gameId}', '${c.gameName}');  
  })
  </c:if>
  </c:forEach>
 
  
</script>
<script type="text/javascript">
function toggleToss() {
	  
	  // 토글 할 버튼 선택 (toss)
	  const toss = document.getElementById('toss');
	  
	  // btn1 숨기기 (display: none)
	  if(toss.style.display !== 'none') {
	    toss.style.display = 'none';
	  }
	  // btn` 보이기 (display: block)
	  else {
	    toss.style.display = 'block';
	  }
	  
	}
function confirmDelete() {
	if( confirm("Are you sure you want to delete this item?") ){
    window.location.href="cart.do";
    return;
	}
}

</script>

</html>