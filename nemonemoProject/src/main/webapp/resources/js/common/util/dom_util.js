var DOMUtil = (function() {
	
	function cE(tag, option, text) {
		if(!tag) return false;
		
		const result = document.createElement(tag)
		if(option && option.constructor != Object) {
			text = option;  
			option = undefined;
		}
		
		if(option) {
			Object.entries(option).forEach(([k,v]) => {
				result.setAttribute(k, v);
			});
		}
		if(text && (typeof text == 'string' || typeof text == 'number')) {
			const textNode = cT(text);
			if(result && textNode) {
				result.append(textNode);
			}
		}
		
		return result;
	}
	
	function cT(text) {
		const textType = typeof text;
		if(!text && (textType == 'string' || textType == 'number')) return null;
		return document.createTextNode(text);
	}
	
	return {
		cE : function(tag, option, text) {
			return cE(tag, option, text);
		},
		cT : function(text) {
			return cT(text);
		}
	}
}());