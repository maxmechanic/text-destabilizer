text-destabilizer
=================

A way to destabilize text by replacing words with synonyms.

Select text in the browser and send to the server with the bookmarklet. 

The Sinatra-based back-end uses a WordNet database to look for synonyms, then passes those back to the browser where they're randomly swapped in.

Drag [this link][1] into your bookmarks tool bar to use on pages. 

[1]:"javascript:(function(e,a,g,h,f,c,b,d){if(!(f=e.jQuery)||g>f.fn.jquery||h(f)){c=a.createElement("script");c.type="text/javascript";c.src="http://ajax.googleapis.com/ajax/libs/jquery/"+g+"/jquery.min.js";c.onload=c.onreadystatechange=function(){if(!b&&(!(d=this.readyState)||d=="loaded"||d=="complete")){h((f=e.jQuery).noConflict(1),b=1);f(c).remove()}};a.documentElement.childNodes[0].appendChild(c)}})(window,document,"1.9.1",function($,L){%20console.log('loaded.');%20var%20selection%20=%20document.getSelection().toString();%20if%20(selection%20===%20'')%20{%20alert('please%20select%20text%20to%20pull%20from.');%20}%20console.log(selection);%20var%20array%20=%20[];%20var%20replaced,%20swap,%20text;%20array%20=%20selection.split(/[%20,.?;:"']+/);%20console.log(array);%20%20if%20(selection%20!==%20'')%20{%20$.getJSON('http://localhost:4567/synonyms?callback=?',%20{text:%20array},%20function(data)%20{%20var%20set%20=%20[];%20for%20(var%20i%20=%200;%20i%20<%20data.length;%20i++)%20{%20set.push([0,%20data[i]]);%20}%20console.log('made%20request');%20%20if%20(data.length%20>=%201)%20{%20replaceSetup(set);%20}%20});%20}%20%20function%20replaceSetup(set)%20{%20setInterval(function(){textReplace(set);},%205000);%20}%20%20function%20textReplace(set)%20{%20console.log('entered%20textReplace%20function');%20replaced%20=%20false;%20do%20{%20word%20=%20Math.floor(Math.random()%20*%20set.length);%20}%20while%20(set[word][1].length%20==%201);%20%20while%20(!replaced)%20{%20syn%20=%20Math.floor(Math.random()%20*%20set[word][1].length);%20currentIndex%20=%20set[word][0];%20if%20(currentIndex%20!=%20syn%20&&%20set[word][1][currentIndex]%20!=%20set[word][1][syn])%20{%20console.log('supposedly%20replacing%20word');%20swap%20=%20{%20replacing:%20set[word][1][currentIndex],%20replaceWith:%20set[word][1][syn]%20};%20console.log('replacing:%20'%20+%20swap.replacing%20+%20'%20with%20'%20+%20swap.replaceWith);%20set[word][0]%20=%20syn;%20replaced%20=%20true;%20}%20}%20%20$('p').each(function()%20{%20text%20=%20$(this).text();%20$(this).text(text.replace(swap.replacing,%20swap.replaceWith));%20});%20%20}%20%20%20%20console.log('afterquest');%20%20});"
