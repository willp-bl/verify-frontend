$(document).ready(function() {
    $.get("http://localhost:50300/hint", function(data) {
        console.log(data);
        if(data.value){
        //if(true){
            var e = $(".gem-c-radio:eq(1)");
            //e.prev().insertAfter(e);
            //$("#option-1").prop("checked", true);
            e.css("background-color", "lightgreen");
            $('#option-1').next().append(data.text)
    }
    })
});
