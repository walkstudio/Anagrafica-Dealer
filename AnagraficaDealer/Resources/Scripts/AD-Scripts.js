//Metodo implementazione redirect 
function goTo(theUrl, idMenu) {
    document.location.href = theUrl;

}


function CheckBoxCheckAll(checkboxs, checkbox) {
    $('#' + checkboxs).change(function () {
        var checked = $(this).is(':checked');
        $('input[id*="' + checkbox + '"]').attr('checked', checked);
    });

    $('input[id*="' + checkbox + '"]').change(function () {
        var checked = $(this).is(':checked');
        if (!checked) {
            $('#' + checkboxs).attr('checked', false);
        }
        else {
            var allchecked = true;
            $('input[id*="' + checkbox + '"]').each(function () {
                var checked = $(this).is(':checked');
                if (!checked) {
                    allchecked = false;
                }
            });
            $('#' + checkboxs).attr('checked', allchecked);
        }
    });
}
