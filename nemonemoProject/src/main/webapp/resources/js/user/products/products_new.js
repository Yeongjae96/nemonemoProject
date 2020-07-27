const fileList = [];
let index = 0;

$(function() {
	$('#fileName').on('change', function() {
		readURL(this);
	});

});

function readURL(input) {
	if(input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			/* */
			let count = $('.products-title--div small').text().slice(1,2);
			if(count >= 8) {
				alert('사진은 최대 8장 까지 올릴 수 있습니다.');
				return;
			}
			const $li = $('<li></li>');
			$li.attr({
				draggable: 'false',
				id: 'img_id_'+index
			});
			$li.addClass('image-registry--user');
			
			const $div = $('<div></div>');
			$div.addClass('text-registry--representive').text('대표이미지');
			
			const $image = $('<img/>');
			$image.attr({
				'src': e.target.result,
				alt: '상품이미지'
			});
			
			const $closeBtn = $('<button></button>');
			
			$closeBtn.attr('type', 'button');
			$closeBtn.addClass('btn-image--cancle');
			$closeBtn.on('click', deleteImage(index));
			
			
			$li.append($div);
			$li.append($image);
			$li.append($closeBtn);
			
			$('#imageList').append($li);
			
			console.log(input.files[0]);
			fileList.push(input.files[0]);
			console.log(`fileList : ${fileList}`);
			fileList.forEach(function(f){
				console.log(`f: ${f}`);
			});
			$('.products-title--div small').text(`(${parseInt(count) + 1}/8)`);
			index++;
			console.log(index);
		}
		reader.readAsDataURL(input.files[0]);
		
	}
}


function deleteImage(index) {
	console.log('index : ' + index);
	fileList.splice(index, 1);
	
	var img_id = "#img_id_"+index;
	$(img_id).remove();
	
	console.log(fileList);
}	

/*<li draggable="false" class="image-registry--user">
    <div class="text-registry--representive">대표이미지</div>
    <img src="https://media.bunjang.co.kr/images/crop/491549662_w404.jpg"
        alt="상품이미지">
    <button type="button" class="btn-image--cancle"></button>
</li>*/