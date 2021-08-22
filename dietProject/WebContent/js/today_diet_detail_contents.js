/* 모달 식사 타입 선택 ▼ */
$(document).ready(function() {
	$("#downbtn").change(function() {
		if ($("#downbtn").val() == "") {
			$("#domain").text("").focus();
			$("#domain").prop("readonly", false);
		} else {
			$("#domain").text($("#downbtn").val());
			$("#domain").prop("readOnly", true);
		}
	})

	/* 날짜변경 버튼 이미지 클릭 이벤트 */

	$("#weekLeftbtn").click(function() {
		console.log('left current date : ' + $('#currDate').text());
		location.href = "todayDiet.to?today=-1&currentdate="+$('#currDate').text();
		alert(버튼확인);
	})
	$("#weekRightbtn").click(function() {
		console.log('left current date : ' + $('#currDate').text());
		location.href = "todayDiet.to?today=1&currentdate="+$('#currDate').text();
	})


	/* 서브모달 이미지 선택 이벤트 */
	
	
	
	
	
	
	

});