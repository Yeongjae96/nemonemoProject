(function(d) {
		d.addEventListener('DOMContentLoaded', function(e){
			const menuList = document.getElementsByClassName('product-nav-link');
			
			const tempUrl = d.location.href;
			const target = tempUrl.slice(tempUrl.lastIndexOf('/')+1, tempUrl.lastIndexOf('.'));
			
			Array.prototype.forEach.call(menuList, e => {
				if(e.dataset.set == target) {
					e.style.fontWeight = 'bold';
					e.style.color='#EE5058';
					return false;
				}
			});
		});
}(document));