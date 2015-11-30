// JavaScript Document
window.onload = function(){
	var in_ad = document.getElementById('in_ad');	
}

function clicks(){
	var x = document.getElementById('mod_win');

	if(x.style.display == 'none'){
		x.style.display = 'block';
		x.style.position = 'fixed';
		x.style.fontFamily = 'Arial, Helvetica, sans-serif;';
	    x.style.top = '0';
		x.style.right = '0';
		x.style.left = '0';
		x.style.bottom = '0';
		x.style.background = 'rgba(229, 229, 229, 0.8)';
		x.style.zIndex = '999';
		x.style.transition = 'opacity 400ms ease-in';
		x.style.pointerevents = 'none';
		x.style.webkittransition = 'opacity 400ms ease-in';
		x.style.moztransition  = 'opacity 400ms ease-in';
	} else {
	   x.style.display = 'none';
	}
}
