$(function(){
	/* 식단 공유 버튼 이벤트*/
	$("td").on("click","#shareDietbtn",function(){
		var dcode=$(this).val();
		var $button = $(this);
		if(confirm('해당 식단을 공유하시겠습니까?')) 
		{ 
			var data = "dcode="+dcode+"&share=1";
			$.ajax({
				url : "dietShare.dt",
				type :"post", 
				data : data,
				dataType : "json",
				cache : false,
				success : function(data){
					alert("식단을 공유했습니다.");
					$button.text("공유중");
					$button.attr("disabled",true);
				},
				error : function(){
					console.log('에러');
				}
			});
			
		} 
	});
	/* 식단 삭제 버튼 이벤트*/
	$("td").on("click","#DeleteDietbtn",function(){
		var dcode=$(this).val();
		if(confirm('해당 식단을 삭제하시겠습니까?')) 
		{ 
			location.href="dietDelete.dt?dcode="+dcode;
		}
	});
	
	/* 식단 수정 버튼 이벤트*/
	$("td").on("click","#UpdateDietbtn",function(){
		var dcode=$(this).val();
		if(confirm('해당 식단을 수정하시겠습니까?')) 
		{ 
			location.href="configDiet.cf?dcode="+dcode;
		}
	});
	
	/* 식단 상세보기 버튼 이벤트*/
	$("td").on("click","#DetailDietbtn",function(){
		var dcode=$(this).val();
		var data ="dcode="+dcode+"&state=1";
		$.ajax({
			url :"dietDetail.dt",
			type :"post", 
			data : data,
			dataType : "json",
			cache : false,
			success : function(data){
			},
			error : function(){
				console.log('에러');
			}
		});
	});
	
	
	/* 식단구성 페이지 이동 버튼 이벤트*/
	$("#compDiet").click(function(){
		location.href="configDiet.cf";
	});
	
	/* 식단 리스트 검색 이미지 클릭 이벤트*/
	$("#searchDiet").click(function(){
		if($.trim($("#searchText").val())== ""){
			alert("검색어를 입력하세요");
			$("#searchText").focus();
			return false;
		}
		location.href="dietpage.dt?search="+$("#searchText").val();
	});
});

