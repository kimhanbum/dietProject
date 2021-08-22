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
	
	
	
	
	$("#mealCheck").click(function(){
		$.ajax({
			type:"post",
			url:"dietDetailMeal.to",
			dataType:"json",
			success:function(data){
				$('#submodal .modal-body').empty();
				output='';
				var rowIdx=1;
				if(data !=null){
					$(data.allMealList).each(function(index,item){
						if(rowIdx%3==1)
							output+='<div class="row">';
						output+='<div class="col-md-6 col-lg-4 snack_container">'
							   +'  <div id="mealCheckGroup">'
							   +'      <input type="checkbox" class="snack_checkbox"'
							   +'       value="'+item.meal_code+','+item.meal_img_name+','+item.meal_name+','+item.meal_cal+'">'+item.meal_name
							   +'  </div>'  
							   +'  <img src="images/dietSnack/'+item.meal_img_name+'" class="imgsnack">'
							   +'</div>';
						if(rowIdx%3==0)
							output+="</div><br>";
						rowIdx++;
					});
					if(rowIdx%3!=0)
						output+="</div><br>";			
					$('#submodal .modal-body').append(output)
				}
				
			}//success end
		});//ajax end
	});
	
	//meal 체크박스 선택은 하나만 체크하도록하는 클릭 이벤트
	$(document).on("click","#mealbody input[type='checkbox']",function(){
		if($(this).prop('checked')){
			 $('#mealbody input[type="checkbox"]').prop('checked',false);
			 $(this).prop('checked',true);
		 } 
	});
	
	
	//체크 박스 저장한 meal 저장
	$(document).on("click","#selectMeal",function(){
		if($("#mealbody input[type='checkbox']:checked").length == 0){
			alert("체크박스를 체크해주세요.");
			return false;
		}
		var data = $('#mealbody input[type="checkbox"]:checked').val();
		var code=data.split(",")[0];
		var img = data.split(",")[1];
		var name=data.split(",")[2];
		var cal=data.split(",")[3];
		
		$('#selectedMealDiet').empty();
		output='<img src="images/dietSnack/'+img+'" id="recordimg">'
		      +' &nbsp;&nbsp;&nbsp;&nbsp;'
		      +' <span>'+name+' </span>'
		      +' &nbsp;&nbsp;&nbsp;&nbsp;'
		      +' <span>'+cal+'kcal </span> &nbsp;&nbsp;'
		      +' <input type="hidden" value="'+code+'">';
		$('#selectedMealDiet').append(output);
		
		$('#submodal').modal("hide"); 
		$('body').children().last().remove();
	});

	
	
	$("#dietCheck").click(function(){
		$.ajax({
			type:"post",
			url:"dietDetailDiet.to",
			dataType:"json",
			success:function(data){
				$('#submodal2 .modal-body').empty();
				output='';
				var rowIdx=1;
				if(data !=null){
					$(data.allDietlList).each(function(index,item){
						if(rowIdx%3==1)
							output+='<div class="row">';
						output+='<div class="col-md-6 col-lg-4 snack_container">'
							   +'  <div id="mealCheckGroup">'
							   +'      <input type="checkbox" class="snack_checkbox"'
							   +'       value="'+item.diet_code+','+item.diet_img_name+','+item.diet_name+','+item.diet_total_cal+'">'+item.diet_name
							   +'  </div>'  
							   +'  <img src="images/food/'+item.diet_img_name+'.jpg" class="imgsnack">'
							   +'</div>';
						if(rowIdx%3==0)
							output+="</div><br>";
						rowIdx++;
					});
					if(rowIdx%3!=0)
						output+="</div><br>";			
					$('#submodal2 .modal-body').append(output)
				}
			}//success end
		});//ajax end
	});
	
	//diet 체크박스 선택은 하나만 체크하도록하는 클릭 이벤트
	$(document).on("click","#dietbody input[type='checkbox']",function(){
		if($(this).prop('checked')){
			 $('#dietbody input[type="checkbox"]').prop('checked',false);
			 $(this).prop('checked',true);
		 } 
	});
	
	//체크박스 선택한 식단 저장
	$(document).on("click","#selectDiet",function(){
		if($("#dietbody input[type='checkbox']:checked").length == 0){
			alert("체크박스를 체크해주세요.");
			return false;
		}
		var data = $('#dietbody input[type="checkbox"]:checked').val();
		var code=data.split(",")[0];
		var img = data.split(",")[1];
		var name=data.split(",")[2];
		var cal=data.split(",")[3];
		
		$('#selectedMealDiet').empty();
		output='<img src="images/food/'+img+'.jpg" id="recordimg">'
		      +' &nbsp;&nbsp;&nbsp;&nbsp;'
		      +' <span>'+name+' </span>'
		      +' &nbsp;&nbsp;&nbsp;&nbsp;'
		      +' <span>'+cal+'kcal </span> &nbsp;&nbsp;'
		      +' <input type="hidden" value="'+code+'">';
		$('#selectedMealDiet').append(output);
		
		$('#submodal2').modal("hide"); 
		$('body').children().last().remove();
	});
	
	//total_info 에 값 넣기 이벤트
	$("#insertTotalInfo").click(function(){
		var mealtype='';
		switch($('#downbtn').val())
		{
			case "아침":
				mealtype ="TOTAL_BF";
				break;
			case "점심":
				mealtype ="TOTAL_LUNCH";
				break;
			case "저녁":
				mealtype ="TOTAL_DINNER";
				break;
			case "간식":
				mealtype ="TOTAL_SNACK";
				break;
		}
		
		var code = $('#selectedMealDiet>input:hidden').val();
		var setDate = $('#currDate').text();
		if(confirm($('#downbtn').val() + "을 변경하시겠습니까?")){
			$.ajax({
				type:"post",
				url:"bottomProcess.to",
				data : { 
					"mealtype" : mealtype,
					"code" : code,
					"setDate" : setDate
				},
				dataType:"json",
				success:function(data){
					if(data ==1 ){
						alert("식단 기록을  완료하였습니다.");
						location.href ="todayDiet.to";
					}
				}//success end
			});//ajax end
		}
	});
	//메인 모달이 닫힐 경우 선택된 meal/diet를 초기화
	$(myModal).on('hide.bs.modal', function(e){
		$('#selectedMealDiet').empty();
	});
});