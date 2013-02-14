javascript:(function(e,a,g,h,f,c,b,d){if(!(f=e.jQuery)||g>f.fn.jquery||h(f)){c=a.createElement("script");c.type="text/javascript";c.src="http://ajax.googleapis.com/ajax/libs/jquery/"+g+"/jquery.min.js";c.onload=c.onreadystatechange=function(){if(!b&&(!(d=this.readyState)||d=="loaded"||d=="complete")){h((f=e.jQuery).noConflict(1),b=1);f(c).remove()}};a.documentElement.childNodes[0].appendChild(c)}})(window,document,"1.9.1",function($,L){
	console.log('loaded.');

	var selection = document.getSelection().toString();
	console.log(selection);
	var array = [];
	array = selection.split(/[ ,.?;:"']+/);
	console.log(array);

	$.getJSON('http://localhost:4567/test?callback=?', {test: array}, function(data) {
		alert(data);
		console.log('maderequest');
	});
	console.log('afterquest');

});