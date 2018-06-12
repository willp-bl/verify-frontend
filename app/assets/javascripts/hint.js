$(document).ready(function() {
    $.get("https://www.signin.service.gov.uk/hint", function(data) {
        console.log(data);
        if(data.value){
        //if(true){
            var verifyRadio = $("input[value=sign-in-with-gov-uk-verify]")
            var verifyContainer = verifyRadio.parent();
            //verifyContainer.prev().insertAfter(verifyContainer);
            //verifyRadio.prop("checked", true);
            verifyContainer.css("background-color", "lightgreen");
            verifyRadio.next().append(data.text)
        }
    })
});
