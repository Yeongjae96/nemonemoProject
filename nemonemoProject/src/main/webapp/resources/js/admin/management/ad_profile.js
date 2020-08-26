

var table = $('#admin-table');

$(function () {
    $('#admin-table tbody').on('click','.admin-del-btn', function(){
        var selected = this;
        $('#smallModal').modal("toggle");
    });
    // del-btn 의 adminno 값을 del-confirm에게 전달
    $('.admin-del-btn').click(function() {
    	$('#admin-del-confirm').data('adminno', $(this).data('adminno'));
    });
    $('#admin-del-confirm').click(deleteBtnEvent);
        

    table.dataTable({
        language: {
            "decimal": "",
            "emptyTable": "표에서 사용할 수있는 데이터가 없습니다.",
            "info": "총 _TOTAL_개",
            "infoEmpty": "0 개 항목 중 0 ~ 0 개 표시",
            "infoFiltered": "(_MAX_ 총 항목에서 필터링 됨)",
            "infoPostFix": "",
            "thousands": ",",
            "lengthMenu": "_MENU_",
            "search": "검색:",
            "zeroRecords": "일치하는 레코드가 없습니다.",
            "paginate": {
                "first": "처음",
                "last": "마지막",
                "next": "다음",
                "previous": "이전"
            },
            "aria": {
                "sortAscending": ": 오름차순으로 정렬",
                "sortDescending": ": 내림차순으로 정렬",
            }
        }

    });
    
    function deleteBtnEvent() {
        	alert("해당 고객 선택");
        	const adminNo = $(this).data('adminno');
    		alert(adminNo);
    		console.log($(this));
    		$form = $('<form></form>').attr({
    			action: "profile/delete.mdo",
    			method: "POST"
    		});
    	
    		$input = $('<input/>').attr({
    			type: 'hidden',
    			name: 'adminNo',
    			value: adminNo,
    		});
    		
    		$form.append($input);
    		$('body').append($form);
    		$form[0].submit();
    }    
});


$(function () {
    $('#admin-table tbody').on('click','.admin-upd-btn', function(){
        var selected = this;
        $('#admin_upd_modal').modal("toggle");
        if($('#admin_upd_btn').click(function(){
            console.log("수정하겠습니다!");
        }));
    });
});


    

