(function(d) {
		d.addEventListener('DOMContentLoaded', function(e){
			const menuList = document.getElementsByClassName('product-nav-link');
			
			const tempUrl = d.location.href;
			const target = tempUrl.slice(tempUrl.lastIndexOf('/')+1, tempUrl.indexOf('.'));
			
			Array.prototype.forEach.call(menuList, e => {
				console.log(e);
				console.log(e.dataset.set);
				console.log(target);
				if(e.dataset.set == target) {
					e.style.fontWeight = 'bold';
					e.style.color='#EE5058';
					return false;
				}
			});
		});
}(document));