
$(function () {
    $('#txtRagioneSociale').autocomplete({
        source: function (request, response) {
            $.ajax({
                url: "Ricerca.aspx/GetRagioneSociale",
                data: "{ 'pre':'" + request.term + "'}",
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    response($.map(data.d, function (item) {
                        return { value: item }
                    }))
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(textStatus);
                }
            });
        }
    });

    //$('#txtPIVA').autocomplete({
    //    source: function (request, response) {
    //        $.ajax({
    //            url: "Ricerca.aspx/GetPartitaIva",
    //            data: "{ 'pre':'" + request.term + "'}",
    //            dataType: "json",
    //            type: "POST",
    //            contentType: "application/json; charset=utf-8",
    //            success: function (data) {
    //                response($.map(data.d, function (item) {
    //                    return { value: item }
    //                }))
    //            },
    //            error: function (XMLHttpRequest, textStatus, errorThrown) {
    //                alert(textStatus);
    //            }
    //        });
    //    }
    //});

    $('#txtDealerCode').autocomplete({
        source: function (request, response) {
            $.ajax({
                url: "Ricerca.aspx/GetDealers",
                data: "{ 'pre':'" + request.term + "'}",
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    response($.map(data.d, function (item) {
                        return { value: item }
                    }))
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(textStatus);
                }
            });
        }
    });

    $('#txtLocalita').autocomplete({
        source: function (request, response) {
            //if ($("#ddlMProvincia").val() == "") return;
            $.ajax({
                url: "Ricerca.aspx/GetLocalita",
                data: "{ 'pre':'" + request.term + "','prov':'" + $("#ddlMProvincia").val() + "','regione':'" + $("#ddlMRegione").val() + "'}",
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    response($.map(data.d, function (item) {
                        return { value: item }
                    }))
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(textStatus);
                }
            });
        },
        minLengh: 5
    });

    $('#txMasterDealerCode').autocomplete({
        source: function (request, response) {
            $.ajax({
                url: "Ricerca.aspx/GetMasterDealers",
                data: "{ 'pre':'" + request.term + "'}",
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    response($.map(data.d, function (item) {
                        return { value: item }
                    }))
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(textStatus);
                }
            });
        }
    });

    $('#txtFunzionario').autocomplete({
        source: function (request, response) {
            $.ajax({
                url: "Ricerca.aspx/GetFunzionari",
                data: "{ 'pre':'" + request.term + "'}",
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    response($.map(data.d, function (item) {
                        return { value: item }
                    }))
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(textStatus);
                }
            });
        }
    });

    $('#txtSupporti').autocomplete({
        source: function (request, response) {
            $.ajax({
                url: "Ricerca.aspx/GetSupporti",
                data: "{ 'pre':'" + request.term + "'}",
                dataType: "json",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                success: function (data) {
                    response($.map(data.d, function (item) {
                        return { value: item }
                    }))
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    alert(textStatus);
                }
            });
        }
        //, minLengh: 5
    });
    
    DisableSharedField();

    //$("#link_raffina").click(function (e) {
    $("#link_1").click(function (e) {
        CheckRicercaAvanzata();
        $("#link_esporta").unbind('click');
        $("#link_esporta").click(function (e) {
            checkSearchFields(2);
        });

        $("#link_salvaricerca").unbind('click');
        $("#link_salvaricerca").click(function (e) {
            var strRicerca = GetSearchData(2);
            PageMethods.GestioneRicerca(strRicerca, "S", fnOKSalvaRicerca, fnKOSalvaRicerca);
        });

    });

    $("#imgRaffinaRicerca").click(function (e) {
        CheckRicercaAvanzata();
        $("#link_esporta").unbind('click');
        $("#link_esporta").click(function (e) {
            checkSearchFields(2);
        });

        $("#link_salvaricerca").unbind('click');
        $("#link_salvaricerca").click(function (e) {
            var strRicerca = GetSearchData(2);
            PageMethods.GestioneRicerca(strRicerca, "S", fnOKSalvaRicerca, fnKOSalvaRicerca);
        });

    });
    
    $("#link_0").click(function (e) {
        showHide(0);
        $("#link_esporta").unbind('click');
        $("#link_esporta").click(function (e) {
            checkSearchFields(1);
        });

        $("#link_salvaricerca").unbind('click');
        $("#link_salvaricerca").click(function (e) {
            var strRicerca = GetSearchData(1);
            PageMethods.GestioneRicerca(strRicerca, "S", fnOKSalvaRicerca, fnKOSalvaRicerca);
        });
    });

    $("#link_esporta").click(function (e) {
        checkSearchFields(1);
    });

    $("#TblstepNumber_1").click(function (e) {
        CheckRicercaAvanzata();
    });

    $("#link_salvaricerca").click(function (e) {
        var strRicerca = GetSearchData(1);
        PageMethods.GestioneRicerca(strRicerca, "S", fnOKSalvaRicerca, fnKOSalvaRicerca);
    });

    $("#link_esporta").click(function (e) {
        // window.open("ExportToExcel.aspx");
    });

    $("#link_caricaricerca").click(function (e) {
        PageMethods.GestioneRicerca("", "C", fnOKCaricaRicerca, fnKOCaricaRicerca);
    });

    $("select[id^=ddl]").each(function () {
        //$(this).attr("class", "cmbRicerca");
        $(this).addClass("cmbRicerca");
    });

    $("span.ui-dropdownchecklist-text").each(function () {
        $(this).addClass("cmbRicerca");
    });

    //added
    $("#ddlMProvincia").dropdownchecklist({
        emptyText: "Seleziona una Provincia",
        icon: { placement: 'right', toOpen: 'ui-icon-triangle-1-s', toClose: 'ui-icon-triangle-1-n' },
        width: 250,
        maxDropHeight: 250
    });
});

function CheckRicercaAvanzata() {

    if (!SelectedChoiceItems($("#ddlMTipologia"), true)) {
        ShowMessage("Il campo Tipologia &egrave; obbligatorio","html");
        return;
    }
    $("#lblChoices").empty();
    SelectedChoiceItems($("#ddlMTipologia"), false);
    SelectedChoiceItems($("#txtDealerCode"), false);
    SelectedChoiceItems($("#txtRagioneSociale"), false);
    SelectedChoiceItems($("#txtPIVA"), false);
    SelectedChoiceItems($("#ddlMStato"), false);
    SelectedChoiceItems($("#ddlMCanale"), false);
    SelectedChoiceItems($("#ddlMArea"), false);
    SelectedChoiceItems($("#ddlSOperativita"), false);
    SelectedChoiceItems($("#ddlSTechAss"), false);


    if ($("#lblChoices")[0].innerText == "")
        $("#lblChoices").append("Nessuna selezione precedente.").addClass('spanChoice');

    InitRicercaAvanzata();
    showHide(1);

}

function ShowMessage(msg,tipo)
{
    if(tipo=="text")
        $("#msgDialogBox").text(msg);
    else
        $("#msgDialogBox").html(msg);
    $("#dialog-message").dialog({
        dialogClass: 'no-close',
        modal: true,
        buttons: {
            "OK": function () {
                $(this).dialog("close");
            }
        }
    });

}

function fnOKSalvaRicerca(result)
{
    ShowMessage("Ricerca salvata correttamente.","text");
}

function fnKOSalvaRicerca(result)
{
    ShowMessage("Errore in fase di ricerca. Si prega di riprovare.","text");
}

function fnOKCaricaRicerca(result)
{
    $("#txtXMLRicerca").val(result);

    if (LoadSearch(result))
    {
        ShowMessage("Ricerca caricata correttamente.","text");
    }
    else
    {
        fnKOCaricaRicerca(result);
    }
}

function fnKOCaricaRicerca(result)
{
    ShowMessage("Errore in fase di ricerca. Si prega di riprovare.","text");
}


function LoadSearch(strXml)
{
    var browserName = navigator.appName;
    var doc;
    try {

        if (browserName == 'Microsoft Internet Explorer') {
            doc = new ActiveXObject('Microsoft.XMLDOM');
            doc.async = 'false'
            doc.loadXML(strXml);
        } else {
            doc = (new DOMParser()).parseFromString(strXml, 'text/xml');
        }
        var xml = doc;


        //var xmlDoc = $.parseXML(strXml),
        //    $xml = $(xmlDoc);

        //$($xml).each(function () {
        $(xml).each(function () {
            $(this).find("FIELD[typeDb='text']").each(function () {
                $("input[Desc=" + $(this).attr('id') + "]").val($(this).attr('value'));
            });
            $(this).find("FIELD[typeDb='combo'],FIELD[typeDb='comboReadonly']").each(function () {
                var valueXml = ($(this).attr('value') == "" ? "" : $(this).attr('value') + ",");
                if (valueXml != "") {
                    var obj = $("select[Desc=" + $(this).attr('id') + "]")
                    for (i = 0; i < obj[0].options.length; i++) {
                        if (obj[0].options[i].value!="" && valueXml.indexOf(obj[0].options[i].value + ",") != -1)
                            obj[0].options[i].selected = true;
                        else
                            obj[0].options[i].selected = false;
                    }
                }
                try{
                    $("select[Desc=" + $(this).attr('id') + "]").dropdownchecklist("refresh");
                }
                catch (e)
                {
                    //alert($(this).attr('id') + " : no refresh");
                }
            });

            $(this).find("FIELD[typeDb='dateperiod']").each(function () {
                if ($(this).attr('value') != "")
                {
                    $("#" + $(this).attr('clientid')).val($(this).attr('value'));
                }
                if ($(this).attr('value2'))
                {
                    $("#" + $(this).attr('clientid2')).val($(this).attr('value2'));
                }
            });

            $(this).find("FIELD[typeDb='radio']").each(function () {
                if ($(this).attr('value') != "")
                {
                    $("input[Desc=" + $(this).attr('id') + "][value=" + $(this).attr('value') + "]").prop('checked', true);
                }
            });

            $(this).find("FIELD[typeDb='schedule']").each(function () {


            });
            $(this).find("FIELD[typeDb='check']").each(function () {

                if ($(this).attr('value') == "1")
                    $("input[Desc=" + $(this).attr('id') + "]").prop('checked', true);
                else
                    $("input[Desc=" + $(this).attr('id') + "]").attr('checked', false);
            });


            //RECUPERO FLAG SU CHECK PER CAMPI ESPORTATI
            var ExportedChecks = ($(this).find("EXPORTFIELDS").attr("value")!="" ? $(this).find("EXPORTFIELDS").attr("value").split(",") : "");
            for (var i = 0; i<ExportedChecks.length; i++)
            {
                $("input[id='Exportchk" + ExportedChecks[i]+ "']").prop("checked", true);
            }

        });

        return true;
    }
    catch (e)
    {
        return false;
    }
}



var ComboTLoaded = ComboOLoaded = ComboALoaded = ComboCLoaded = ComboSLoaded = ComboZLoaded = ComboFLoaded = ComboVLoaded = ComboRLoaded = false;
var RicercaGet = false;
var poll;


var mostraRicerca = function () {
    //if (ComboTLoaded && ComboOLoaded && ComboALoaded && ComboCLoaded && ComboSLoaded && ComboZLoaded && ComboFLoaded && ComboVLoaded) {
    //if (ComboTLoaded && ComboOLoaded && ComboCLoaded && ComboSLoaded && ComboZLoaded && ComboFLoaded && ComboVLoaded) {
    if (ComboTLoaded && ComboOLoaded && ComboSLoaded && ComboZLoaded && ComboFLoaded && ComboVLoaded ) {
        window.clearInterval(poll);
        $("#divLoad").hide();
    }
};

var pollRicerca;
var doRicerca = function () {
    if (RicercaGet) {
        window.clearInterval(pollRicerca);
        $("#divLoad").hide();
    }
};

var pollAM;
var doAM = function () {
    if (ComboALoaded) {
        window.clearInterval(pollAM);
        $("#divLoad").hide();
    }
};


$(document).ready(function () {
     
    $('#popupBoxClose').click(function () {
        unloadPopupBox();
    });

    poll = setInterval(mostraRicerca, 500);
    $("#ddlMCanale").dropdownchecklist({
        emptyText: "Seleziona",
        icon: { placement: 'right', toOpen: 'ui-icon-triangle-1-s', toClose: 'ui-icon-triangle-1-n' },
        width: 150, maxDropHeight: 250, firstItemChecksAll: true
    });
    //showPopupSpinner();
    PageMethods.GetInfoDealer("T", "", fnOKTipoDealer, fnKOTipoDealer);
    PageMethods.GetInfoDealer("O", "", fnOKOperativita, fnKOOperativita);
    PageMethods.GetInfoDealer("S", "", fnOKStato, fnKOStato);
    //PageMethods.GetInfoDealer("C", "", fnOKCanale, fnKOCanale);
    PageMethods.GetInfoDealer("Z", "", fnOKArea, fnKOArea);
    PageMethods.GetInfoDealer("F", "", fnOKFunzionario, fnKOFunzionario);
    PageMethods.GetInfoDealer("V", "", fnOKModelloVendita, fnKOModelloVendita);
    PageMethods.GetInfoDealer("G", "", fnOKSegmentazione, fnKOSegmentazione);
    PageMethods.GetInfoDealer("CL", "", fnOKCluster, fnKOCluster);
    PageMethods.GetInfoDealer("AC", "", fnOKAreaCompetenza, fnKOAreaCompetenza);

    //nuove aggiunte da NB
    PageMethods.GetInfoDealer("TA", "", fnOKCentroAssistenzaTecnica, fnKOCentroAssistenzaTecnica);

    //modificato x combo a selez multiple
    PageMethods.GetInfoDealer("R", "", fnOKRegioni, fnKORegioni);

    //$("#divLoad").hide();
    $("input[id^=txt]").focus(function (e) {
        HandleText($(this),"f");
    });
    $("input[id^=txt]").blur(function (e) {
        HandleText($(this),"b");
    });

    $("input[typedb=data]").each(function () {
        $(this).datepicker({
            changeMonth: true,
            changeYear: true
        },
        $.datepicker.regional['it'],
        "option", "showAnim", "");
    });
    $("input[id^=txt][typedb=dateperiod]").each(function () {
        $(this).datepicker({
            changeMonth: true,
            changeYear: true
        },
        $.datepicker.regional['it'],
        "option", "showAnim", "");
    });

    //AGGIUNGE LA CHECKBOX PER ESPORTARE

    $("input[id^=txt][showexport!=no]").each(function (e) {
        $("td[Desc='" + $(this).attr("Desc") + "']").append("&nbsp;<input type='checkbox' id='Exportchk" + $(this).attr('Desc') + "' title='Seleziona per esportare in Excel' desc=" + $(this).attr("Desc") + "/>");
    });
    
    $('select[id^=ddl][showexport!=no]').each(function ()
    {
        $("td[Desc='" + $(this).attr("Desc") + "']").append("&nbsp;<input type='checkbox' id='Exportchk" + $(this).attr('Desc') + "' title='Seleziona per esportare in Excel' desc=" + $(this).attr("Desc") + "/>");
    });


    $("input[typedb = 'dateperiod'][type!='radio']").each(function () {
        $(this).attr("disabled", "disabled");
    });

});


//GESTIONE DEL TESTO WATERMARK NEI CAMPI (HIDE/SHOW)
var tmpText = "";
function HandleText(obj,action)
{

    if (action == "f")
    {
        if (obj[0].value.indexOf("--") == 0 && obj[0].value.slice(-2) == "--")
        {
            tmpText = obj[0].value;
            obj[0].value = "";
        }
    }
        
    else
    {
        if (obj[0].value == "")
            obj[0].value = tmpText;

    }
}


function InitRicercaAvanzata() {
    $("#divLoad").show();
    var values = "";
    for (i = 0; i < $("#ddlMArea")[0].options.length; i++) {
        if ($("#ddlMArea")[0].options[i].selected && ($("#ddlMArea")[0].options[i].value != "")) {
            if (values != "") values += ";";
            values += $("#ddlMArea")[0].options[i].value;
        }
    }
    if ($("#ddlMRegione").val() == "") {
        PageMethods.GetInfoDealer("R", values, fnOKRegioni, fnKORegioni);
    }
    else {
        $("#divLoad").hide();
    }

}

function SelectedChoiceItems(obj, retVal) {
    var values = "";
    var countMultiCheck = 0;
    if (obj.attr('type') === 'text') {
        if (obj.val().indexOf("--")==-1)
            values = obj.val();
    }
    else {

        for (i = 0; i < obj[0].options.length; i++) {
            if (obj[0].options[i].selected && (obj[0].options[i].value != "")) {
                if (values != "") values += ";";
                values += obj[0].options[i].innerText;
                countMultiCheck++;
            }
        }

    }
    if (values == "" || (values == "" && retVal == true)) return false;
    var span;
    if (obj.val().toString().substring(0, 1)==",")
    {
        span = $('<span />').addClass('spanChoice').html(obj.attr("TitleSearch") + " : TUTTI").attr("title", values);
    }
    else
    {
        span = $('<span />').addClass('spanChoice').html(obj.attr("TitleSearch") + " : " + truncateString(values, 10, countMultiCheck)).attr("title", values);
    }
    if ($("#lblChoices")[0].innerText != "")
        $("#lblChoices").append("&nbsp;&nbsp; | &nbsp;&nbsp;");
    else
        $("#lblChoices").append("&nbsp;&nbsp;");
    $("#lblChoices").append(span);
    return true;
}

function truncateString(str, length, countObj) {
    if (str.indexOf(";") != -1)
        return "MULTISELEZIONE";//str.substring(0, str.indexOf(";")) + (countObj > 1 ? '<sup style="color:red;font-weight:bold"> + ' + (parseInt(countObj) - 1).toString() + '</sup>' : ' ')
    else
        return str;
    //return str.length > length ? str.substring(0, str.indexOf(";")) + (countObj > 1 ? '<sup> + ' + (parseInt(countObj) - 1).toString() + '</sup>' : ' ') : str
}

function showHideAvanzata(iddiv, idtbl, iddivparent, idlink) {
    $("#divLoad").show();
    $("div[id^=divRR]").hide();
    $("#" + iddiv).show();
    $("span[id^=linkRR]").removeClass("linkSelected");
    $("div[id^=divMenuRR]").removeClass("divSelected");
    $("table[id^=TblRR]").removeClass("tabRaffinaRicercaSelected");
    $("div[id^=divMenuRR]").addClass("divUnselected");
    $("table[id^=TblRR]").addClass("tabRaffinaRicercaUnselected");
    $("span[id^=linkRR]").addClass("linkUnselected");
    $("#" + iddivparent).removeClass("divUnselected");
    $("#" + iddivparent).addClass("divSelected");
    $("#" + idtbl).removeClass("tabRaffinaRicercaUnselected");
    $("#" + idtbl).addClass("tabRaffinaRicercaSelected");
    $("#" + idlink).removeClass("linkUnselected");
    $("#" + idlink).addClass("linkSelected");

    //LE DROPDOWN A SCELTA MULTIPLA VANNO REFRESHATE QUANDO SI VISUALIZZA IL DIV, ALTRIMENTI SONO VUOTE
    if (iddiv == "divRRVendite")
    {
        if ($("#ddlMAM").children("option").length == 0) {
            PageMethods.GetInfoDealer("A", "", fnOKAM, fnKOAM);
            pollAM = setInterval(doAM, 500);
        } else { $("#divLoad").hide(); }
    }
    else
    { $("#divLoad").hide(); }
}


function checkSearchFields(args)
{
    //var v = $("[id^=regexEmail]");
    //for (var i = 0; i <= v.length; i++) {
    //    ValidatorValidate(v[i]);
    //    if (!v[i].isvalid)
    //        return false;
    //}
    var values = "";
    var obj = $("#ddlMTipologia");
    for (i = 0; i < obj[0].options.length; i++) {
        if (obj[0].options[i].selected && (obj[0].options[i].value != "")) {
            if (values != "") values += ";";
            values += obj[0].options[i].innerText;
        }
    }

    if (values == "") {
        ShowMessage("Il campo Tipologia &egrave; obbligatorio","html");
        //loadPopupBox();
        return;
    }
    $("#divLoad").show();
    pollRicerca = setInterval(doRicerca, 500);
    var strRicerca = GetSearchData(args);
    if (args == 0) //RICERCA
    {
        PageMethods.RicercaDealer(strRicerca, fnOKRicerca, fnKORicerca);
    }
    else //EXPORT
    {
        PageMethods.ExportQuery(strRicerca, fnOKExport, fnKOExport);
    }
}

//var rowsShown = 0;
var rowsTotal = 0;
var numPages = 0;
var pageNum = 0;
//var maxPager = 0;
var currMaxPage = 0;
var currPage = 0;
var actualPage = 0; //NUMERO PAGINE CREATE NELLA SEZIONE PAGINATORE
                    //SERVE PER CAPIRE EVENTUALMENTE QUANTE NE MANCANO NELL'ULTIMO SET E GESTIRE IN MANIERA CORRETTA IL TASTO PRECEDENTE

function fnOKRicerca(result)
{
    if (result == null)
    {
        $("#divLoad").hide();
        $("[id=stepResults]").hide();
        $("[id=divResults]").hide();
        ShowMessage("La ricerca eseguita non ha prodotto alcun risultato.", "html");
        return;
    }
    if (result != null) {
        document.getElementById('link_Results').className = 'linkSelected ';
        document.getElementById('TblResults').className = 'linkSelected tabRaffinaRicercaSelected';
        document.getElementById('stepResults').style.visibility = 'visible';
        document.getElementById('stepResults').style.display = 'block';
    } else {
        document.getElementById('link_Results').className = 'linkUnselected ';
        document.getElementById('TblResults').className = 'linkUnselected tabRaffinaRicercaUnselected';
    }



    for (i = 0; i < 2; i++)
    {
        document.getElementById('link_' + i).className = 'linkUnselected';
        document.getElementById('TblstepNumber_' + i).className = 'linkUnselected tabRaffinaRicercaUnselected';
        $("[id=div_" + i + "]").hide();
    }

    var table = document.getElementById('grvResults');
    
    $("table[id=grvResults]").find("tr:gt(0)").remove();
    var cssRow = "";

    //rowsShown = 8; //RECORD PER PAGINA
    rowsTotal = result.length/6;
    numPages = rowsTotal / rowsShown; //Numero totale di pagine che verranno create
    pageNum = 0;
    //maxPager = 20; //NUMERO DI PAGINE VISUALIZZATA NEL PAGER
    currMaxPage = 0;

    $('#pager').empty();
    $('#pager').append('<span class="pagerStyle" rel="prev">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>');
    for (var i = pageNum; i < pageNum + maxPager; i++) {
        if (i < parseInt(Math.round(numPages))) {
            var pageText = (i + 1);
            if (pageText < 10)
                pageText = "&nbsp;" + pageText + "&nbsp;";
            if (pageText > 10 && pageText < 100)
                pageText = "&nbsp;" + pageText;
            $('#pager').append('<span class="pagerStyle" rel="' + i + '">' + pageText + (currMaxPage < Math.round(parseInt(numPages))-1?" -":"") + '</span>');
            currMaxPage = i;
        }
    }
    if (currMaxPage < parseInt(Math.round(numPages))-1)
        $('#pager').append('<span class="pagerStyle" rel="next">&nbsp;Succ.</span>');

    var j = 1;
    //VIENE APPLICATO UN MODULO 5 VISTO CHE OGNI RECORD OCCUPA 5 POSIZIONI NELLA STRINGA RITORNATA
    //OBJ1 COL1 - OBJ1 COL2 - OBJ1 COL2 - OBJ1 COL3 - OBJ1 COL4 - OBJ1 COL5 - OBJ2 COL1 - OBJ2 COL 2 ecc.ecc.
    for (var i = 0 ; i < rowsShown * 6 ; i = i + 6) {
        //Righe pari/dispari per applicare lo stili a colori alterni

        //var newRow = "<tr class='" + cssRow + "'><td id=iddealer style='visibility:hidden;width:1px;'>" + (j > rowsTotal ? "&nbsp;" : result[i]) + "</td><td id=dealercode style='padding-bottom:5px;padding-top:5px;'>" + (j > rowsTotal ? "&nbsp;" : result[i + 1]) + "</td><td>" + (j > rowsTotal ? "&nbsp;" : result[i + 2]) + "</td><td style='width:450px;word-wrap:break-all;text-align:left'>" + (j > rowsTotal ? "&nbsp;" : (result[i + 3] == "" ? "&nbsp;" : result[i + 3])) + "</td><td>" + (j > rowsTotal ? "&nbsp;" : result[i + 4]) + "</td><td>" + (j > rowsTotal ? "&nbsp;" : result[i + 5]) + "</td></tr>";
        var newRow = "<tr class='resultsRow' iddealer='" + (j > rowsTotal ? "&nbsp;" : result[i]) + "'><td id=dealercode style='padding-bottom:5px;padding-top:5px;'>" + (j > rowsTotal ? "" : result[i + 1]) + "</td><td>" + (j > rowsTotal ? "" : result[i + 2]) + "</td><td style='width:450px;word-wrap:break-all;text-align:left'>" + (j > rowsTotal ? "" : (result[i + 3] == "" ? "&nbsp;" : result[i + 3])) + "</td><td>" + (j > rowsTotal ? "" : result[i + 4]) + "</td><td>" + (j > rowsTotal ? "" : result[i + 5]) + "</td></tr>";

        $("#grvResults tbody").append(newRow);
        j++;
    }


    $("[id=grvResults] tr").click(
        function (e) {
            e.stopPropagation();
            var iddealer = $(this).attr("iddealer"); //$.trim($(this).closest("tr").find("td[id=iddealer]").text());
            // alert("iddealer: " + dealercode);
            if (iddealer != "")
                PageMethods.SaveDealerId(iddealer, fnOKSalvaIDDealer, fnKOSalvaIDDealer);
        }
      )

    $("#divLoad").hide();
    $("[id=stepResults]").show();
    $("[id=divResults]").show();


    $('#pager span:first').addClass('active');
    $('#pager span').click(function () {
        pagerClick($(this), result);
    });
    
    RicercaGet = true;
}


function fnKORicerca(result) {
    ShowMessage("Errore in fase di Ricerca.<br/>Si prega di riprovare ", "html");
    RicercaGet = true;
}


function fnOKExport(result) {
    if (result != 0) {
        fnKOExport(result);
        return;
    }
        
    window.open("ExportToExcel.aspx");
    RicercaGet = true;
}

function fnKOExport(result) {
    ShowMessage("Errore in fase di Export.<br/>Si prega di riprovare ", "html");
    return;
}



function pagerClick(obj, result)
{
    $("table[id=grvResults]").find("tr:gt(0)").remove();
    $('#pager span').removeClass('active');
    obj.addClass('active');
    if (obj.attr('rel') == "next")
    {
        currPage = currMaxPage + 1;
    }
    else if (obj.attr('rel') == "prev")
    {
        currPage = (currMaxPage + (maxPager - actualPage)) - (maxPager * 2); //GESTISCE EVENTUALE DISPARITA' DELL'ULTIMO PAGER
        if (currPage < 0) //pagina negativa -> tornato al primo record
        {
            currPage = 0;
            currMaxPage = 1;
        }
        else
        {
            currPage = currPage + 1;
            currMaxPage = currMaxPage - (maxPager * 2); //toglie una paginazione,tornando alla prima pagina della precedente
        }
    }
    else
    {
        currPage = obj.attr('rel');
    }
    //var currPage = $(this).attr('rel');
    var startItem = currPage * rowsShown;
    var endItem = startItem + rowsShown;
    j = startItem + 1;
    //VIENE APPLICATO UN MODULO 5 VISTO CHE OGNI RECORD OCCUPA 5 POSIZIONI NELLA STRINGA RITORNATA
    //OBJ1 COL1 - OBJ1 COL2 - OBJ1 COL2 - OBJ1 COL3 - OBJ1 COL4 - OBJ1 COL5 - OBJ2 COL1 - OBJ2 COL 2 ecc.ecc.
    for (var i = startItem * 6 ; i < endItem * 6 ; i = i + 6) {

        var newRow = "<tr class='resultsRow' iddealer='" + (j > rowsTotal ? "&nbsp;" : result[i]) + "'><td id=dealercode style='padding-bottom:5px;padding-top:5px;'>" + (j > rowsTotal ? "" : result[i + 1]) + "</td><td>" + (j > rowsTotal ? "" : result[i + 2]) + "</td><td style='width:450px;word-wrap:break-all;text-align:left'>" + (j > rowsTotal ? "" : (result[i + 3] == "" ? "&nbsp;" : result[i + 3])) + "</td><td>" + (j > rowsTotal ? "" : result[i + 4]) + "</td><td>" + (j > rowsTotal ? "" : result[i + 5]) + "</td></tr>";
        $("#grvResults tbody").append(newRow);
        j++;
    }


    $("[id=grvResults] tr").click(
     function (e) {
         e.stopPropagation();
         //var iddealer = $.trim($(this).closest("tr").find("td[id=iddealer]").text());
         var iddealer = $(this).attr("iddealer");
         //    alert("iddealer: " + dealercode);
         if (iddealer != "")
             PageMethods.SaveDealerId(iddealer, fnOKSalvaIDDealer, fnKOSalvaIDDealer);
     });

    if (obj.attr('rel') == "next" || obj.attr('rel') == "prev") {
        $('#pager').empty();
        if (currPage > currMaxPage)
            $('#pager').append('<span class="pagerStyle" rel="prev">Prec.&nbsp;</span>');
        else
            $('#pager').append('<span class="pagerStyle" rel="prev">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>');

        actualPage = 0; //RESET DEL CONTATORE SEZIONE ATTUALE

        for (var i = currPage; i < currPage + maxPager; i++) {
            var pageText = (i + 1);
            if (pageText < 10)
                pageText = "&nbsp;" + pageText + "&nbsp;";
            if (pageText > 10 && pageText < 100)
                pageText = "&nbsp;" + pageText;
            if (i < parseInt(Math.round(numPages))) {
                {
                    $('#pager').append('<span class="pagerStyle" rel="' + i + '">' + pageText + (currMaxPage < Math.round(parseInt(numPages)) - 1 ? " -" : "") + '</span>');
                    actualPage++;
                }

                currMaxPage = i;
            }
        }
        if (currMaxPage <  parseInt(Math.round(numPages)))
            $('#pager').append('<span class="pagerStyle" rel="next">&nbsp;Succ.</span>');
        $('#pager span').click(function () {
            pagerClick($(this), result);
        });
    }

}




function fnOKSalvaIDDealer(result)
{
    if (result != 0) {
        ShowMessage("Errore durante la selezione del Dealer.<br/>Si prega di riprovare.", "html");
        return;
    }
    window.location.replace("DettaglioDealer.aspx");
}

function fnKOSalvaIDDealer(result)
{

}

var IdTipoDealer = "";
function GetSearchData(args)
{


    var fieldsValues = "<XML>";
    var fields2export = "";

    $('[id=ddlMTipologia]').each(function () {
        var selOptions = "";
        for (i = 0; i < $(this)[0].options.length; i++) {
            if ($(this)[0].options[i].selected && ($(this)[0].options[i].value != ""))
            {
                if (selOptions != "") selOptions += ",";
                selOptions += $(this)[0].options[i].value;
            }
        }
        IdTipoDealer = selOptions;
    });

    fieldsValues += "<FIELD id='IDTipoDealer' value='" + IdTipoDealer + "' typeDb='combo' IDTipoDealer = '" + IdTipoDealer + "' />";


    $("input[id^=txt][typedb!=dateperiod]").each(function ()
    {
        fieldsValues += "<FIELD ";
        if (($(this).val().indexOf("--") == 0 && $(this).val().slice(-2) == "--") || $(this).val()=="")
            fieldsValues += "clientid='" + $(this).attr("id") + "' id='" + $(this).attr("Desc") + "' value='' typeDb='" + $(this).attr("typedb") + "' IDTipoDealer = '" + IdTipoDealer + "'/>";
        else
            fieldsValues += "clientid='" + $(this).attr("id") + "' id='" + $(this).attr("Desc") + "' value='" + $(this).val().replace("'","") + "' typeDb='" + $(this).attr("typedb") + "' IDTipoDealer = '" + IdTipoDealer + "'/>";
    });

    //$("input[id^=txt][typedb=dateperiod]").each(function () {
    //    fieldsValues += "<FIELD ";
    //    if (($(this).val().indexOf("--") == 0 && $(this).val().slice(-2) == "--") || $(this).val() == "")
    //        fieldsValues += "id='" + $(this).attr("Desc") + "' value='' typeDb='" + $(this).attr("typedb") + "' IDTipoDealer = '" + IdTipoDealer + "'/>";
    //    else
    //        fieldsValues += "id='" + $(this).attr("Desc") + "' value='" + $(this).val() + "' typeDb='" + $(this).attr("typedb") + "' IDTipoDealer = '" + IdTipoDealer + "'/>";
    //});

    
    if ($('input[name=rdTrasloco]:checked').val() == "Period")
    {
        //fieldsValues += "<FIELD id='StoricoIndirizzo.DataInizio' value='Period' typeDb='radio' />";

        var TDal = "";
        var TAl = "";
        if (($("#txtTraslocoDal").val().indexOf("--") == 0 && $("#txtTraslocoDal").val().slice(-2) == "--") || $("#txtTraslocoDal").val() == "")
            TDal = "";
        else
            TDal = $("#txtTraslocoDal").val();

        if (($("#txtTraslocoAl").val().indexOf("--") == 0 && $("#txtTraslocoAl").val().slice(-2) == "--") || $("#txtTraslocoAl").val() == "")
            TDal = "";
        else
            TDal = $("#txtTraslocoAl").val();


        fieldsValues += "<FIELD ";
        fieldsValues += "clientid='txtTraslocoDal' id='StoricoIndirizzo.DataInizio' clientid2='txtTraslocoAl' id='" + $("#txtTraslocoDal").attr("Desc") + "' value='" + TDal + "' value2='" + TAl + "' typeDb='dateperiod' IDTipoDealer = '" + IdTipoDealer + "'/>";

        //fieldsValues += "<FIELD ";
        //fieldsValues += "clientid='txtTraslocoDal' clientid2='txtTraslocoAl' id='" + $("#txtTraslocoAl").attr("Desc") + "' value='" + TDal + "' value2='" + TAl + "' typeDb='dateperiod' IDTipoDealer = '" + IdTipoDealer + "'/>";

    } else if ($('input[name=rdTrasloco]:checked').val() == "All")
    {
        fieldsValues += "<FIELD id='StoricoIndirizzo.DataInizio' value='0' typeDb='radio' />";
    }

    if ($('input[name=rdSubentro]:checked').val() == "Period")
    {
        //fieldsValues += "<FIELD id='StoricoCodice.DataInizio' value='Period' typeDb='radio' />";
        var SDal = "";
        var SAl = "";
        if (($("#txtSubentroDal").val().indexOf("--") == 0 && $("#txtSubentroDal").val().slice(-2) == "--") || $("#txtSubentroDal").val() == "")
            SDal = "";
        else
            SDal = $("#txtSubentroDal").val();


        if (($("#txtSubentroAl").val().indexOf("--") == 0 && $("#txtSubentroAl").val().slice(-2) == "--") || $("#txtSubentroAl").val() == "")
            SAl = "";
        else
            SAl = $("#txtSubentroAl").val();

        fieldsValues += "<FIELD ";
        fieldsValues += "clientid='txtSubentroDal' id='StoricoCodice.DataInizio' clientid2='txtSubentroAl' id='" + $("#txtSubentroDal").attr("Desc") + "' value='" + SDal + "' value2='" + SAl + "' typeDb='dateperiod' IDTipoDealer = '" + IdTipoDealer + "'/>";

        //fieldsValues += "<FIELD ";
        //fieldsValues += "clientid='txtSubentroDal' clientid2='txtSubentroAl' id='" + $("#txtSubentroAl").attr("Desc") + "' value='" + SDal + "' value2='" + SAl + "' typeDb='dateperiod' IDTipoDealer = '" + IdTipoDealer + "'/>";

    }
    else if ($('input[name=rdSubentro]:checked').val()=="All") {
        fieldsValues += "<FIELD id='StoricoCodice.DataInizio' value='0' typeDb='radio' />";
    }

    if ($('input[name=rdCambioCanale]:checked').val() == "Period")
    {
        //fieldsValues += "<FIELD id='StoricoCanale' value='Period' typeDb='radio' />";
        var CDal = "";
        var CAl = "";
        if (($("#txtCambioCanaleDal").val().indexOf("--") == 0 && $("#txtCambioCanaleDal").val().slice(-2) == "--") || $("#txtCambioCanaleDal").val() == "")
            CDal = "";
        else
            CDal = $("#txtCambioCanaleDal").val();

        if (($("#txtCambioCanaleAl").val().indexOf("--") == 0 && $("#txtCambioCanaleAl").val().slice(-2) == "--") || $("#txtCambioCanaleAl").val() == "")
            CAl = "";
        else
            CAl = $("#txtCambioCanaleAl").val();

        fieldsValues += "<FIELD "; 
        fieldsValues += "clientid='txtCambioCanaleDal' id='StoricoCanale.DataInizio' clientid2='txtCambioCanaleAl' id='" + $("#txtCambioCanaleDal").attr("Desc") + "' value='" + CDal + "' value2='" + CAl + "' typeDb='dateperiod' IDTipoDealer = '" + IdTipoDealer + "'/>";

        //fieldsValues += "<FIELD ";
        //fieldsValues += "clientid='txtCambioCanaleDal'  clientid2='txtCambioCanaleAl' id='" + $("#txtCambioCanaleAl").attr("Desc") + "' value='" + CDal + "' value2='" + CAl + "' typeDb='dateperiod' IDTipoDealer = '" + IdTipoDealer + "'/>";

    } else if ($('input[name=rdCambioCanale]:checked').val() == "All") {
        fieldsValues += "<FIELD id='StoricoCanale.DataInizio' value='0' typeDb='radio' />";
    }

    if ($('input[name=rdAperturaNegozio]:checked').val() == "Period")
    {
        //fieldsValues += "<FIELD id='DataAperturaNegozio' value='Period' typeDb='radio' />";

        var ADal = "";
        var AAl = "";
        if (($("#txtAperturaNegozioDal").val().indexOf("--") == 0 && $("#txtAperturaNegozioDal").val().slice(-2) == "--") || $("#txtAperturaNegozioDal").val() == "")
            ADal = "";
        else
            ADal = $("#txtAperturaNegozioDal").val();


        if (($("#txtAperturaNegozioAl").val().indexOf("--") == 0 && $("#txtAperturaNegozioAl").val().slice(-2) == "--") || $("#txtAperturaNegozioAl").val() == "")
            AAl = "";
        else
            AAl = $("#txtAperturaNegozioAl").val();

        fieldsValues += "<FIELD ";
        fieldsValues += "clientid='txtAperturaNegozioDal' id='DataAperturaNegozio' clientid2='txtAperturaNegozioAl' id='" + $("#txtAperturaNegozioDal").attr("Desc") + "' value='" + ADal + "' value2='" + AAl + "' typeDb='dateperiod' IDTipoDealer = '" + IdTipoDealer + "'/>";

        //fieldsValues += "<FIELD ";
        //fieldsValues += "clientid='txtAperturaNegozioDal' clientid2='txtAperturaNegozioAl' id='" + $("#txtAperturaNegozioAl").attr("Desc") + "' value='" + ADal + "' value2='" + AAl + "' typeDb='dateperiod' IDTipoDealer = '" + IdTipoDealer + "'/>";

    } else if ($('input[name=rdAperturaNegozio]:checked').val() == "All") {
        fieldsValues += "<FIELD id='DataAperturaNegozio' value='0' typeDb='radio' />";
    }

    if ($('input[name=rdChiusuraNegozio]:checked').val() == "Period")
    {
        //fieldsValues += "<FIELD id='DataChiusuraNegozio' value='Period' typeDb='radio' />";
        var ChDal = "";
        var ChAl = "";
        if (($("#txtChiusuraNegozioDal").val().indexOf("--") == 0 && $("#txtChiusuraNegozioDal").val().slice(-2) == "--") || $("#txtChiusuraNegozioDal").val() == "")
            ChDal = "";
        else
            ChDal = $("#txtChiusuraNegozioDal").val();


        if (($("#txtChiusuraNegozioAl").val().indexOf("--") == 0 && $("#txtChiusuraNegozioAl").val().slice(-2) == "--") || $("#txtChiusuraNegozioAl").val() == "")
            ChAl = "";
        else
            ChAl = $("#txtChiusuraNegozioAl").val();

        fieldsValues += "<FIELD ";
        fieldsValues += "clientid='txtChiusuraNegozioDal' id='DataChiusuraNegozio' clientid2='txtChiusuraNegozioAl' id='" + $("#txtChiusuraNegozioDal").attr("Desc") + "' value='" + ChDal + "' value2='" + ChAl + "' typeDb='dateperiod' IDTipoDealer = '" + IdTipoDealer + "'/>";

        //fieldsValues += "<FIELD ";
        //fieldsValues += "clientid='txtChiusuraNegozioDal' clientid2='txtChiusuraNegozioAl' id='" + $("#txtChiusuraNegozioAl").attr("Desc") + "' value='" + ChDal + "' value2='" + ChAl + "' typeDb='dateperiod' IDTipoDealer = '" + IdTipoDealer + "'/>";

    } else if ($('input[name=rdChiusuraNegozio]:checked').val() == "All") {
        fieldsValues += "<FIELD id='DataChiusuraNegozio' value='0' typeDb='radio' />";
    }

    if ($('input[name=rdAperturaCodice]:checked').val() == "Period")
    {
        //fieldsValues += "<FIELD id='DataAperturaCodice' value='Period' typeDb='radio' />";
        var AcDal = "";
        var AcAl = "";
        if (($("#txtAperturaCodiceDal").val().indexOf("--") == 0 && $("#txtAperturaCodiceDal").val().slice(-2) == "--") || $("#txtAperturaCodiceDal").val() == "")
            AcDal = "";
        else
            AcDal = $("#txtAperturaCodiceDal").val();


        if (($("#txtAperturaCodiceAl").val().indexOf("--") == 0 && $("#txtAperturaCodiceAl").val().slice(-2) == "--") || $("#txtAperturaCodiceAl").val() == "")
            AcAl = "";
        else
            AcAl = $("#txtAperturaCodiceAl").val();

        fieldsValues += "<FIELD ";
        fieldsValues += "clientid='txtAperturaCodiceDal' id='DataAperturaCodice' clientid2='txtAperturaCodiceAl' id='" + $("#txtAperturaCodiceDal").attr("Desc") + "' value='" + AcDal + "' value2='" + AcAl + "' typeDb='dateperiod' IDTipoDealer = '" + IdTipoDealer + "'/>";

        //fieldsValues += "<FIELD ";
        //fieldsValues += "clientid='txtAperturaCodiceDal' clientid2='txtAperturaCodiceAl' id='" + $("#txtAperturaCodiceAl").attr("Desc") + "' value='" + AcDal + "' value2='" + AcAl + "' typeDb='dateperiod' IDTipoDealer = '" + IdTipoDealer + "'/>";

    } else if ($('input[name=rdAperturaCodice]:checked').val() == "All") {
        fieldsValues += "<FIELD id='DataAperturaCodice' value='0' typeDb='radio' />";
    }

    if ($('input[name=rdChiusuraCodice]:checked').val() == "Period") {
        //fieldsValues += "<FIELD id='DataAperturaCodice' value='Period' typeDb='radio' />";
        var CcDal = "";
        var CcAl = "";
        if (($("#txtChiusuraCodiceDal").val().indexOf("--") == 0 && $("#txtChiusuraCodiceDal").val().slice(-2) == "--") || $("#txtChiusuraCodiceDal").val() == "")
            CcDal = "";
        else
            CcDal = $("#txChiusuraCodiceDal").val();

        if (($("#txtChiusuraCodiceAl").val().indexOf("--") == 0 && $("#txtChiusuraCodiceAl").val().slice(-2) == "--") || $("#txtChiusuraCodiceAl").val() == "")
            CcAl = "";
        else
            CcAl = $("#txtAperturaCodiceAl").val();

        fieldsValues += "<FIELD ";
        fieldsValues += "clientid='txtAperturaCodiceDal' id='DataChiusuraCodice' clientid2='txtChiusuraCodiceAl' id='" + $("#txtChiusuraCodiceDal").attr("Desc") + "' value='" + CcDal + "' value2='" + CcAl + "' typeDb='dateperiod' IDTipoDealer = '" + IdTipoDealer + "'/>";

        //fieldsValues += "<FIELD ";
        //fieldsValues += "clientid='txtChiusuraCodiceDal' clientid2='txtChiusuraCodiceAl' id='" + $("#txtChiusuraCodiceAl").attr("Desc") + "' value='" + CcDal + "' value2='" + CcAl + "' typeDb='dateperiod' IDTipoDealer = '" + IdTipoDealer + "'/>";

    } else if ($('input[name=rdChiusuraCodice]:checked').val() == "All") {
        fieldsValues += "<FIELD id='DataChiusuraCodice' value='0' typeDb='radio' />";
    }


    //$("input[id=geoLat]").each(function () {
        
    //    if (($(this).val().indexOf("--") == 0 && $(this).val().slice(-2) == "--") || $(this).val() == "")
    //    {
    //        fieldsValues += "<FIELD ";
    //        fieldsValues += "id='' value='' value2='' typedb='geography' IDTipoDealer = '" + IdTipoDealer + "'/>";
    //    }
    //    else
    //    {
    //        fieldsValues += "<FIELD ";
    //        fieldsValues += "id='' value='" + $(this).val() + "' value2='" + $("input[id=geoLong]").val() + "' typeDb='geography' IDTipoDealer = '" + IdTipoDealer + "'/>";
    //    }
    //});

    $("input[id=HHOraDaMattino]").each(function () {
    });

    $(':radio:checked').each(function () {
        fieldsValues += "<FIELD ";
        fieldsValues += "id='" + $(this).attr("Desc") + "' value='" + $(this).val() + "' typeDb='" + $(this).attr("typedb") + "' IDTipoDealer = '" + IdTipoDealer + "'/>";
    });

    $('input[id^=chk]').each(function () {
        fieldsValues += "<FIELD ";
        var sThisVal = ($(this).prop("checked") ? $(this).val() : "false");
        fieldsValues += "id='" + $(this).attr("Desc") + "' value='" + sThisVal + "' typeDb='" + $(this).attr("typedb") + "' IDTipoDealer = '" + IdTipoDealer + "'/>";

    });

    $('select[id^=ddlS]').each(function () {
        fieldsValues += "<FIELD ";
        if ($(this).find('option:selected').val() == "0")
        {
            var tmpVal = "";
            $(this).find('option').each(function () {
                tmpVal += $(this).val() + ";";
            });
            if(tmpVal!="")
                tmpVal = tmpVal.substring(0, tmpVal.length - 1);
            fieldsValues += "id='" + $(this).attr("Desc") + "' value='" + tmpVal + "' typeDb='" + $(this).attr("typedb") + "' IDTipoDealer = '" + IdTipoDealer + "'/>";
        }
        else
            fieldsValues += "id='" + $(this).attr("Desc") + "' value='" + $(this).find('option:selected').val() + "' typeDb='" + $(this).attr("typedb") + "' IDTipoDealer = '" + IdTipoDealer + "'/>";

    });

    //SEZIONE COMBOBOX A SCELTA MULTIPLA

    $('select[id^=ddlM][id!=ddlMTipologia]').each(function () {
        fieldsValues += "<FIELD ";
        var selOptions = "";
        for (i = 0; i < $(this)[0].options.length; i++) {
            if ($(this)[0].options[i].selected && ($(this)[0].options[i].value != "")) {
                if (selOptions != "") selOptions += ",";
                selOptions += $(this)[0].options[i].value;
            }
        }
        fieldsValues += "id='" + $(this).attr("Desc") + "' value='" + selOptions + "' typeDb='" + $(this).attr("typedb") + "' IDTipoDealer = '" + IdTipoDealer + "'/>";


    });

    //FINE SEZIONE COMBOBOX A SCELTA MULTIPLA

     //VENGONO AGGIUNTI I CAMPI DI DEFAULT PER L'EVENTUALE EXPORT
     fields2export += "Cliente,Codice,RagioneSociale,Stato,Canale,Area,DataDisdetta,";

    $("input[id^=Exportchk]").each(function () {
        // SE SI E' IN RAFFINA RICERCA VENGONO PRESI SOLO I CAMPI FLAGGATI 
        if (args == 2) { 
            if ($(this).prop("checked")) {
                fields2export += $(this).attr("Desc") + ",";
            }
        }
        else if (args == 1) // SE SI E' IN RICERCA VENGONO PRESI TUTTI I CAMPI 
        {
            fields2export += $(this).attr("Desc") + ",";
        }

    });
    fieldsValues += "<RETURNFIELD value='IDDealer,Codice,Canale,RagioneSociale,Stato,Area' />";

    if (args == 1 || args==2)
    {
        fields2export = fields2export.replace(/\//g, '');
        var TOTexportedfields = (fields2export != "" ? fields2export.substring(0, fields2export.length - 1) : "")
        fieldsValues += "<EXPORTFIELDS value='" + TOTexportedfields + "'>";
        var arrTOTexportedfields = TOTexportedfields.split(",");
        for (var i = 0; i < arrTOTexportedfields.length; i++) {
            fieldsValues += "<EXPFIELD id='" + arrTOTexportedfields[i] + "' IDTipoDealer='"+IdTipoDealer+"'/>";
        }
        fieldsValues += "</EXPORTFIELDS>";
    }
    fieldsValues += "</XML>";



    //RESET PERMESSI SUI CAMPI: per quelli comuni resta il valore della combo del TipoDealer.
    //Per quelli non comuni viene sovrascritto il valore, in modo che le condizioni di where non diano errori nelle viste 
    //Esempio: la Stored Procedure della ricerca non puo' aggiungere la where sul MasterDealer per la vista dei committenti (campo non esistente) 

    //1	Committenti
    //2	PosPod
    //3	Point
    //4	Agenti Committenti
    //5	SubAgenti


    try {

        var browserName = navigator.appName;
        var doc;

        if (browserName == 'Microsoft Internet Explorer') {
            doc = new ActiveXObject('Microsoft.XMLDOM');
            doc.async = 'false'
            doc.loadXML(strXml);
        } else {
            doc = (new DOMParser()).parseFromString(strXml, 'text/xml');
        }
        var xml = doc;

        //var xmlDoc = $.parseXML(fieldsValues);
            //$xml = $(xmlDoc);
        $xml = xml;
        $xml.find("FIELD[id=IDAreaManager]").attr("IDTipoDealer", "1,2,4,5");
        $xml.find("FIELD[id=Canale]").attr("IDTipoDealer", "1,2,4,5");
        $xml.find("FIELD[id=IDAreaManager]").attr("IDTipoDealer", "1,2,4,5");
        $xml.find("FIELD[id=Funzionario]").attr("IDTipoDealer", "1,2,4,5");
        $xml.find("FIELD[id=Cliente]").attr("IDTipoDealer", "1,2,3,4,5");
        $xml.find("FIELD[id=DataAperturaCodice]").attr("IDTipoDealer", "1,2,4,5");
        $xml.find("FIELD[id=DataChiusuraCodice]").attr("IDTipoDealer", "1,2,4,5");
        $xml.find("FIELD[id=MasterDealer]").attr("IDTipoDealer", "3");
        $xml.find("FIELD[id=IDRegione]").attr("IDTipoDealer", "1,2,3,4");
        $xml.find("FIELD[id=IDProvincia]").attr("IDTipoDealer", "1,2,3,4");
        $xml.find("FIELD[id=Localita]").attr("IDTipoDealer", "1,2,3,4");
        $xml.find("FIELD[id=Disdetta]").attr("IDTipoDealer", "1,2,3,4");
        $xml.find("FIELD[id=DataDisdetta]").attr("IDTipoDealer", "3,4");
        $xml.find("FIELD[id=AreaDiCompetenza]").attr("IDTipoDealer", "1,2");
        $xml.find("FIELD[id=SegmentazioneCanale]").attr("IDTipoDealer", "1,2");
        $xml.find("FIELD[id=CentroCommerciale]").attr("IDTipoDealer", "2,3");
        $xml.find("FIELD[id=GestoriCondivisi]").attr("IDTipoDealer", "2,3");
        $xml.find("FIELD[id=ZonaAssegnata]").attr("IDTipoDealer", "4,5");
        $xml.find("FIELD[id=ModelloVendita]").attr("IDTipoDealer", "4,5");
        $xml.find("FIELD[id=NegozioTop]").attr("IDTipoDealer", "2");
        $xml.find("FIELD[id=Tipologia]").attr("IDTipoDealer", "2");
        $xml.find("FIELD[id=ShopInStore]").attr("IDTipoDealer", "2");
        $xml.find("FIELD[id=DatiCateneAm]").attr("IDTipoDealer", "2");
        $xml.find("FIELD[id=DatiCateneFunzionario]").attr("IDTipoDealer", "2"); 
        $xml.find("FIELD[id=CentroAssistenzaTecnica]").attr("IDTipoDealer", "2");
        $xml.find("FIELD[id=Latitudine]").attr("IDTipoDealer", "2");
        $xml.find("FIELD[id=Longitudine]").attr("IDTipoDealer", "2");
        $xml.find("FIELD[id=ValoreAffitto]").attr("IDTipoDealer", "2");
        $xml.find("FIELD[id=Insegna]").attr("IDTipoDealer", "2"); 
        $xml.find("FIELD[id=MagazzinoCentralizzato]").attr("IDTipoDealer", "2"); 
        $xml.find("FIELD[id=DimensioneAreaVendita]").attr("IDTipoDealer", "2,3"); 
        $xml.find("FIELD[id=OrariApertura]").attr("IDTipoDealer", "1,3,4,5"); 
        $xml.find("FIELD[id=TipologiaArredo]").attr("IDTipoDealer", "2,3");
        $xml.find("FIELD[id=DataAperturaNegozio]").attr("IDTipoDealer", "2,3");
        $xml.find("FIELD[id=DataChiusuraNegozio]").attr("IDTipoDealer", "2,3");
        $xml.find("FIELD[id=StoricoIndirizzo]").attr("IDTipoDealer", "2,3");
        $xml.find("FIELD[id=StoricoCanale]").attr("IDTipoDealer", "1,2,4,5");


        $xml.find("EXPFIELD[id=IDAreaManager]").attr("IDTipoDealer", "1,2,4,5");
        $xml.find("EXPFIELD[id=Canale]").attr("IDTipoDealer", "1,2,4,5");
        $xml.find("EXPFIELD[id=IDAreaManager]").attr("IDTipoDealer", "1,2,4,5");
        $xml.find("EXPFIELD[id=Funzionario]").attr("IDTipoDealer", "1,2,4,5");
        $xml.find("EXPFIELD[id=Cliente]").attr("IDTipoDealer", "1,2,3,4,5");
        $xml.find("EXPFIELD[id=DataAperturaCodice]").attr("IDTipoDealer", "1,2,4,5");
        $xml.find("EXPFIELD[id=DataChiusuraCodice]").attr("IDTipoDealer", "1,2,4,5");
        $xml.find("EXPFIELD[id=MasterDealer]").attr("IDTipoDealer", "3");
        $xml.find("EXPFIELD[id=IDRegione]").attr("IDTipoDealer", "1,2,3,4");
        $xml.find("EXPFIELD[id=IDProvincia]").attr("IDTipoDealer", "1,2,3,4");
        $xml.find("EXPFIELD[id=Localita]").attr("IDTipoDealer", "1,2,3,4");
        $xml.find("EXPFIELD[id=Disdetta]").attr("IDTipoDealer", "1,2,3,4");
        $xml.find("EXPFIELD[id=DataDisdetta]").attr("IDTipoDealer", "3,4");
        $xml.find("EXPFIELD[id=AreaDiCompetenza]").attr("IDTipoDealer", "1,2");
        $xml.find("EXPFIELD[id=SegmentazioneCanale]").attr("IDTipoDealer", "1,2");
        $xml.find("EXPFIELD[id=CentroCommerciale]").attr("IDTipoDealer", "2,3");
        $xml.find("EXPFIELD[id=GestoriCondivisi]").attr("IDTipoDealer", "2,3");
        $xml.find("EXPFIELD[id=ZonaAssegnata]").attr("IDTipoDealer", "4,5");
        $xml.find("EXPFIELD[id=ModelloVendita]").attr("IDTipoDealer", "4,5");
        $xml.find("EXPFIELD[id=NegozioTop]").attr("IDTipoDealer", "2");
        $xml.find("EXPFIELD[id=Tipologia]").attr("IDTipoDealer", "2");
        $xml.find("EXPFIELD[id=ShopInStore]").attr("IDTipoDealer", "2");
        $xml.find("EXPFIELD[id=DatiCateneAm]").attr("IDTipoDealer", "2");
        $xml.find("EXPFIELD[id=DatiCateneFunzionario]").attr("IDTipoDealer", "2");
        $xml.find("EXPFIELD[id=CentroAssistenzaTecnica]").attr("IDTipoDealer", "2");
        $xml.find("EXPFIELD[id=Latitudine]").attr("IDTipoDealer", "2");
        $xml.find("EXPFIELD[id=Longitudine]").attr("IDTipoDealer", "2");
        $xml.find("EXPFIELD[id=ValoreAffitto]").attr("IDTipoDealer", "2");
        $xml.find("EXPFIELD[id=Insegna]").attr("IDTipoDealer", "2");
        $xml.find("EXPFIELD[id=MagazzinoCentralizzato]").attr("IDTipoDealer", "2");
        $xml.find("EXPFIELD[id=PT]").attr("IDTipoDealer", "2");
        $xml.find("EXPFIELD[id=FTE]").attr("IDTipoDealer", "2");
        $xml.find("EXPFIELD[id=DimensioneAreaVendita]").attr("IDTipoDealer", "2,3");
        $xml.find("EXPFIELD[id=OrariApertura]").attr("IDTipoDealer", "1,3,4,5");
        $xml.find("EXPFIELD[id=TipologiaArredo]").attr("IDTipoDealer", "2,3");
        $xml.find("EXPFIELD[id=DataAperturaNegozio]").attr("IDTipoDealer", "2,3");
        $xml.find("EXPFIELD[id=DataChiusuraNegozio]").attr("IDTipoDealer", "2,3");
        $xml.find("EXPFIELD[id=StoricoIndirizzo]").attr("IDTipoDealer", "2,3");
        $xml.find("EXPFIELD[id=StoricoCanale]").attr("IDTipoDealer", "1,2,4,5");
        $xml.find("EXPFIELD[id=FideiussioneCommerciale]").attr("IDTipoDealer", "1");
        $xml.find("EXPFIELD[id=FideiussioneAffitto]").attr("IDTipoDealer", "1"); 
        $xml.find("EXPFIELD[id=ClassificazioneMaster]").attr("IDTipoDealer", "1");
        $xml.find("EXPFIELD[id=ProvRea]").attr("IDTipoDealer", "1,3,4");
        $xml.find("EXPFIELD[id=Rea]").attr("IDTipoDealer", "1,3,4");
        $xml.find("EXPFIELD[id=DataContratto]").attr("IDTipoDealer", "1,4,5"); 
        $xml.find("EXPFIELD[id=FirmaDigitale]").attr("IDTipoDealer", "1,3,4,5");
        $xml.find("EXPFIELD[id=TipoRemunerazione]").attr("IDTipoDealer", "1,2,4,5");
        $xml.find("EXPFIELD[id=BOL]").attr("IDTipoDealer", "1,2,4,5");
        $xml.find("EXPFIELD[id=NumeroVetrine]").attr("IDTipoDealer", "1,2,3");
        $xml.find("EXPFIELD[id=Piu12]").attr("IDTipoDealer", "1");
        //FINE RESET
        fieldsValues = $xml[0].xml;
    } catch (e) { }

    $("#txtXMLRicerca").val(fieldsValues);
    return fieldsValues;
}



function unloadPopupBox() {    // To Unload the Popupbox
    $('#popup_box').hide();
}

function loadPopupBox() {    // To Load the Popupbox
    $('#popup_box').show();
}

function HandleDateField(field1,field2,status)
{
    if(!status)
    {
        $("#" + field1).attr("disabled", "disabled");
        $("#" + field1).val("");
        $("#" + field2).attr("disabled", "disabled");
        $("#" + field2).val("");
    }
    else {
        $("#" + field1).removeAttr("disabled");
        $("#" + field2).removeAttr("disabled");
    }

}

function DisableSharedField()
{

    $("[Desc=IDCanale]").attr("disabled", "disabled");
   // $("[Desc=IDCanale]").val("");
    $("input[type='checkbox'][Desc=IDCanale]").attr("checked", false);
    $("[Desc=IDAreaManager]").attr("disabled", "disabled");
    //$("[Desc=IDAreaManager]").val("");
    $("input[type='checkbox'][Desc=IDAreaManager]").attr("checked", false);
    $("[Desc=Funzionario]").attr("disabled", "disabled");
    //$("[Desc=Funzionario]").val("");
    $("input[type='checkbox'][Desc=Funzionario]").attr("checked", false);
    $("[Desc=Cliente]").attr("disabled", "disabled");
    //$("[Desc=Cliente]").val("");
    $("input[type='checkbox'][Desc=Cliente]").attr("checked", false);
    $("[Desc=DataAperturaCodice]").attr("disabled", "disabled");
    //$("[Desc=DataAperturaCodice]").val("");
    $("input[type='checkbox'][Desc=DataAperturaCodice]").attr("checked", false);
    $("[Desc=DataChiusuraCodice]").attr("disabled", "disabled");
    //$("[Desc=DataChiusuraCodice]").val("");
    $("input[type='checkbox'][Desc=DataChiusuraCodice]").attr("checked", false);
    $("[Desc=MasterDealer]").attr("disabled", "disabled");
    //$("[Desc=MasterDealer]").val("");
    //$("input[type='checkbox'][Desc=MasterDealer]").attr("checked", false);
    $("[Desc=IDRegione]").attr("disabled", "disabled");
    //$("[Desc=IDRegione]").val("");
    $("input[type='checkbox'][Desc=IDRegione]").attr("checked", false);
    $("[Desc=IDProvincia]").attr("disabled", "disabled");
    //$("[Desc=IDProvincia]").val("");
    $("input[type='checkbox'][Desc=IDProvincia]").attr("checked", false);
    $("[Desc=Localita]").attr("disabled", "disabled");
    //$("[Desc=Localita]").val("");
    $("input[type='checkbox'][Desc=Localita]").attr("checked", false);
    $("[Desc=Disdetta]").attr("disabled", "disabled");
    //$("[Desc=Disdetta]").val("");
    $("input[type='checkbox'][Desc=Disdetta]").attr("checked", false);
    $("[Desc=DataDisdetta]").attr("disabled", "disabled");
    //$("[Desc=DataDisdetta]").val("");
    $("input[type='checkbox'][Desc=DataDisdetta]").attr("checked", false);
    $("[Desc=AreaDiCompetenza]").attr("disabled", "disabled");
    //$("[Desc=AreaDiCompetenza]").val("");
    $("input[type='checkbox'][Desc=AreaDiCompetenza]").attr("checked", false);
    $("[Desc=SegmentazioneCanale]").attr("disabled", "disabled");
    //$("[Desc=SegmentazioneCanale]").val("");
    $("input[type='checkbox'][Desc=SegmentazioneCanale]").attr("checked", false);
    $("[Desc=CentroCommerciale]").attr("disabled", "disabled");
    //$("[Desc=CentroCommerciale]").val("");
    $("input[type='checkbox'][Desc=CentroCommerciale]").attr("checked", false);
    $("[Desc=GestoriCondivisi]").attr("disabled", "disabled");
    //$("[Desc=GestoriCondivisi]").val("");
    $("input[type='checkbox'][Desc=GestoriCondivisi]").attr("checked", false);
    $("[Desc=ZonaAssegnata]").attr("disabled", "disabled");
    //$("[Desc=ZonaAssegnata]").val("");
    $("input[type='checkbox'][Desc=ZonaAssegnata]").attr("checked", false);
    $("[Desc=ModelloVendita]").attr("disabled", "disabled");
    //$("[Desc=ModelloVendita]").val("");
    $("input[type='checkbox'][Desc=ModelloVendita]").attr("checked", false);
    $("[Desc=NegozioTop]").attr("disabled", "disabled");
    //$("[Desc=NegozioTop]").val("");
    $("input[type='checkbox'][Desc=NegozioTop]").attr("checked", false);
    $("[Desc=Tipologia]").attr("disabled", "disabled");
    //$("[Desc=Tipologia]").val("");
    $("input[type='checkbox'][Desc=Tipologia]").attr("checked", false);
    $("[Desc=ShopInStore]").attr("disabled", "disabled");
    //$("[Desc=ShopInStore]").val("");
    $("input[type='checkbox'][Desc=ShopInStore]").attr("checked", false);
    $("[Desc=DatiCateneAm]").attr("disabled", "disabled");
    //$("[Desc=DatiCateneAm]").val("");
    $("input[type='checkbox'][Desc=DatiCateneAm]").attr("checked", false);
    $("[Desc=DatiCateneFunzionario]").attr("disabled", "disabled");
    //$("[Desc=DatiCateneFunzionario]").val("");
    $("input[type='checkbox'][Desc=DatiCateneFunzionario]").attr("checked", false);
}

function ShowFieldCondition(TipoDealer)
{

    //1	Committenti
    //2	PosPod
    //3	Point
    //4	Agenti Committenti
    //5	SubAgenti

    if (TipoDealer == "3;") {
        $("[Desc=Canale]").attr("disabled", "disabled");
        $("[Desc=IDAreaManager]").attr("disabled", "disabled");
        $("[Desc=Funzionario]").attr("disabled", "disabled");
        $("[Desc=Cliente]").attr("disabled", "disabled");
        $("[Desc=DataAperturaCodice]").attr("disabled", "disabled");
        $("[Desc=DataChiusuraCodice]").attr("disabled", "disabled");
    }
    else {
        $("[Desc=Canale]").removeAttr("disabled");
        $("[Desc=IDAreaManager]").removeAttr("disabled");
        $("[Desc=Funzionario]").removeAttr("disabled");
        $("[Desc=Cliente]").removeAttr("disabled");
        $("[Desc=DataAperturaCodice]").removeAttr("disabled");
        $("[Desc=DataChiusuraCodice]").removeAttr("disabled");
    }


    if (TipoDealer.indexOf("3;") == -1)
        $("[Desc=MasterDealer]").attr("disabled", "disabled");
    else {
        $("[Desc=MasterDealer]").removeAttr("disabled");
    }
    if (TipoDealer == "5;") {
        $("[Desc=IDRegione]").attr("disabled", "disabled");
        $("[Desc=IDProvincia]").attr("disabled", "disabled");
        $("[Desc=Localita]").attr("disabled", "disabled");
        $("[Desc=Disdetta]").attr("disabled", "disabled");
    } else {
        $("[Desc=IDRegione]").removeAttr("disabled");
        $("[Desc=IDProvincia]").removeAttr("disabled");
        $("[Desc=Localita]").removeAttr("disabled");
        $("[Desc=Disdetta]").removeAttr("disabled");
    }


    if (TipoDealer.indexOf("3;") != -1 || TipoDealer.indexOf("4;") != -1)
        $("[Desc=DataDisdetta]").removeAttr("disabled");
    else
        $("[Desc=DataDisdetta]").attr("disabled", "disabled");

    if (TipoDealer.indexOf("1;") != -1 || TipoDealer.indexOf("2;") != -1) {
        $("[Desc=AreaDiCompetenza]").removeAttr("disabled");
        $("[Desc=SegmentazioneCanale]").removeAttr("disabled");
    }
    else {
        $("[Desc=AreaDiCompetenza]").attr("disabled", "disabled");
        $("[Desc=SegmentazioneCanale]").attr("disabled", "disabled");
    }


    if (TipoDealer.indexOf("3;") != -1 || TipoDealer.indexOf("2;") != -1) {
        $("[Desc=CentroCommerciale]").removeAttr("disabled");
        $("[Desc=GestoriCondivisi]").removeAttr("disabled");
        $("[Desc=DimensioneAreaVendita]").removeAttr("disabled");
        $("[Desc=TipologiaArredo]").removeAttr("disabled");
        $("[Desc=DataAperturaNegozio]").removeAttr("disabled");
        $("[Desc=DataChiusuraNegozio]").removeAttr("disabled");
        $("[Desc=StoricoIndirizzo]").removeAttr("disabled");
        $("[Desc=DimensioneAreaVendita]").removeAttr("disabled");
    } else {
        $("[Desc=CentroCommerciale]").attr("disabled", "disabled");
        $("[Desc=GestoriCondivisi]").attr("disabled", "disabled");
        $("[Desc=DimensioneAreaVendita]").attr("disabled", "disabled");
        $("[Desc=TipologiaArredo]").attr("disabled", "disabled");
        $("[Desc=DataAperturaNegozio]").attr("disabled", "disabled");
        $("[Desc=DataChiusuraNegozio]").attr("disabled", "disabled");
        $("[Desc=StoricoIndirizzo]").attr("disabled", "disabled");
        $("[Desc=DimensioneAreaVendita]").attr("disabled", "disabled");
    }

    if (TipoDealer.indexOf("4;") != -1 || TipoDealer.indexOf("5;") != -1) {
        $("[Desc=ZonaAssegnata]").removeAttr("disabled");
        $("[Desc=ModelloVendita]").removeAttr("disabled");
    } else {
        $("[Desc=ZonaAssegnata]").attr("disabled", "disabled");
        $("[Desc=ModelloVendita]").attr("disabled", "disabled");
    }

    if (TipoDealer.indexOf("2;") == -1) {
        $("[Desc=NegozioTop]").attr("disabled", "disabled");
        $("[Desc=Tipologia]").attr("disabled", "disabled");
        $("[Desc=ShopInStore]").attr("disabled", "disabled");
        $("[Desc=Insegna]").attr("disabled", "disabled");
        $("[Desc=DatiCateneAm]").attr("disabled", "disabled");
        $("[Desc=DatiCateneFunzionario]").attr("disabled", "disabled");
        $("[Desc=Latitudine]").attr("disabled", "disabled");
        $("[Desc=Longitudine]").attr("disabled", "disabled");
        $("[Desc=ValoreAffitto]").attr("disabled", "disabled");
        $("[Desc=CentroAssistenzaTecnica]").attr("disabled", "disabled");
        $("[Desc=MagazzinoCentralizzato]").attr("disabled", "disabled");
        $("[Desc=PT]").attr("disabled", "disabled");
        $("[Desc=FTE]").attr("disabled", "disabled");
    } else {
        $("[Desc=NegozioTop]").removeAttr("disabled");
        $("[Desc=Tipologia]").removeAttr("disabled");
        $("[Desc=ShopInStore]").removeAttr("disabled");
        $("[Desc=Insegna]").removeAttr("disabled");
        $("[Desc=DatiCateneAm]").removeAttr("disabled");
        $("[Desc=DatiCateneFunzionario]").removeAttr("disabled");
        $("[Desc=Latitudine]").removeAttr("disabled");
        $("[Desc=Longitudine]").removeAttr("disabled");
        $("[Desc=ValoreAffitto]").removeAttr("disabled");
        $("[Desc=CentroAssistenzaTecnica]").removeAttr("disabled");
        $("[Desc=MagazzinoCentralizzato]").removeAttr("disabled");
        $("[Desc=PT]").removeAttr("disabled");
        $("[Desc=FTE]").removeAttr("disabled");
    }

    if (TipoDealer.indexOf("1;") == -1)
    {
        $("[Desc=FideiussioneCommerciale]").attr("disabled", "disabled");
        $("[Desc=FideiussioneAffitto]").attr("disabled", "disabled");
        $("[Desc=ClassificazioneMaster]").attr("disabled", "disabled");
        $("[Desc=Piu12]").attr("disabled", "disabled");
    }
    else
    {
        $("[Desc=FideiussioneCommerciale]").removeAttr("disabled");
        $("[Desc=FideiussioneAffitto]").removeAttr("disabled");
        $("[Desc=ClassificazioneMaster]").removeAttr("disabled");
        $("[Desc=Piu12]").removeAttr("disabled");

    }


    if (TipoDealer.indexOf("1;") != -1 || TipoDealer.indexOf("3;") != -1 || TipoDealer.indexOf("4;") != -1 || TipoDealer.indexOf("5;") != -1) {
        $("[Desc=OrariApertura]").removeAttr("disabled");
        $("[Desc=FirmaDigitale]").removeAttr("disabled");
    }
    else {
        $("[Desc=OrariApertura]").attr("disabled", "disabled");
        $("[Desc=FirmaDigitale]").attr("disabled", "disabled");

    }

    if (TipoDealer.indexOf("1;") != -1 || TipoDealer.indexOf("2;") != -1 || TipoDealer.indexOf("4;") != -1 || TipoDealer.indexOf("5;") != -1) {
        $("[Desc=StoricoCanale]").removeAttr("disabled");
        $("[Desc=BOL]").removeAttr("disabled");
        $("[Desc=TipoRemunerazione]").removeAttr("disabled");
    }
    else {
        $("[Desc=StoricoCanale]").attr("disabled", "disabled");
        $("[Desc=BOL]").attr("disabled", "disabled");
        $("[Desc=TipoRemunerazione]").attr("disabled", "disabled");
    }

    if (TipoDealer.indexOf("1;") != -1 || TipoDealer.indexOf("3;") != -1 || TipoDealer.indexOf("4;") != -1) {
        $("[Desc=ProvRea]").removeAttr("disabled");
        $("[Desc=Rea]").removeAttr("disabled");
    }
    else {
        $("[Desc=ProvRea]").attr("disabled", "disabled");
        $("[Desc=Rea]").attr("disabled", "disabled");
    }

    if (TipoDealer.indexOf("1;") != -1 || TipoDealer.indexOf("4;") != -1 || TipoDealer.indexOf("5;") != -1) {
        $("[Desc=DataContratto]").removeAttr("disabled");
    }
    else {
        $("[Desc=DataContratto]").attr("disabled", "disabled");
    }

    if (TipoDealer.indexOf("1;") != -1 || TipoDealer.indexOf("2;") != -1 || TipoDealer.indexOf("3;") != -1) {
        $("[Desc=NumeroVetrine]").removeAttr("disabled");
    }
    else {
        $("[Desc=NumeroVetrine]").attr("disabled", "disabled");
    }


}
