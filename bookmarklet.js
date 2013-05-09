javascript:(function(e,a,g,h,f,c,b,d){if(!(f=e.jQuery)||g>f.fn.jquery||h(f)){c=a.createElement("script");c.type="text/javascript";c.src="http://ajax.googleapis.com/ajax/libs/jquery/"+g+"/jquery.min.js";c.onload=c.onreadystatechange=function(){if(!b&&(!(d=this.readyState)||d=="loaded"||d=="complete")){h((f=e.jQuery).noConflict(1),b=1);f(c).remove()}};a.documentElement.childNodes[0].appendChild(c)}})(window,document,"1.9.1",function($,L){
    console.log('loaded.');
    var selection = document.getSelection().toString();
    if (selection === '') {
        alert('please select text to pull from.');
    }

    console.log(selection);
    var array = [];
    var replaced, swap, text;
    array = selection.split(/[ ,.?;:"']+/);
    console.log(array);

    if (selection !== '') {
        $.getJSON('http://text-destabilizer.herokuapp.com/synonyms?callback=?', {text: array}, function(data) {
            var set = [];
            for (var i = 0; i < data.length; i++) {
                set.push([0, data[i]]);
            }
            console.log('made request');

            if (data.length >= 1) {
                textReplace(set);
            }
        });
    }

    function textReplace(set) {
        console.log('entered textReplace function');
        swap = {};
        for(var i = 0; i < set.length; i++) {
            replaced = false;
            if (set[i][1].length == 1) {
                replaced = true;
            }
            while (!replaced) {
                syn = Math.floor(Math.random() * set[i][1].length);
                currentIndex = set[i][0];

                console.log('supposedly replacing word');
                swap = {
                    replacing: set[i][1][currentIndex],
                    replaceWith: set[i][1][syn]
                };
                console.log('replacing: ' + swap.replacing + ' with ' + swap.replaceWith);
                set[i][0] = syn;
                replaced = true;
            }

            $('p').each(function() {
                text = $(this).text();
                $(this).text(text.replace(swap.replacing, swap.replaceWith));
            });
        }
    }



    console.log('afterquest');

});