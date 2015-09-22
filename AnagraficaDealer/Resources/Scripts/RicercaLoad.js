
function showHide(divNum) {
    //$("[id^=stepNumber][id!=stepNumber0]").hide();
    for (i = 0; i < 2; i++) {
        var curDiv = document.getElementById('div_' + i);
        curDiv.style.display = 'none';
        if (i == divNum) {
            document.getElementById('link_' + i).className = 'linkSelected';
            document.getElementById('TblstepNumber_' + i).className = 'linkSelected tabRaffinaRicercaSelected';
            document.getElementById('stepNumber' + divNum).style.visibility = 'visible';
            document.getElementById('stepNumber' + divNum).style.display = 'block';
        } else {
            document.getElementById('link_' + i).className = 'linkUnselected';
            document.getElementById('TblstepNumber_' + i).className = 'linkUnselected tabRaffinaRicercaUnselected';
        }
    }

    //gestione link Risultati
    if (divNum != "2") {
        document.getElementById('link_Results').className = 'linkUnselected ';
        document.getElementById('TblResults').className = 'linkUnselected tabRaffinaRicercaUnselected';
        //$("[id=stepResults]").hide();
        $("[id=divResults]").hide();
    }
    else {
        document.getElementById('link_Results').className = 'linkSelected ';
        document.getElementById('TblResults').className = 'linkSelected tabRaffinaRicercaSelected';
        document.getElementById('stepResults').style.visibility = 'visible';
        document.getElementById('stepResults').style.display = 'block';
        $("[id=stepResults]").show();
        $("[id=divResults]").show();
    }
    //fine gestione link Risultati

    $("[id=stepNumber" + divNum + "]").show();
    $("[id=div_" + divNum + "]").show();
}


function fnOKTipoDealer(result) {
    $("#ddlMTipologia").empty();
    $("#ddlMTipologia").append('<option id="ALL" value="">TUTTI</option>');
    for (var i = 0; i < result.length; i++) {
        $("#ddlMTipologia").append('<option id="optT' + i + '" value="' + result[i].Value + '">' + result[i].Text + '</option>');
    }
    $("#ddlMTipologia").dropdownchecklist({
        emptyText: "Seleziona",
        icon: { placement: 'right', toOpen: 'ui-icon-triangle-1-s', toClose: 'ui-icon-triangle-1-n' },
        width: 150, maxDropHeight: 250, firstItemChecksAll: true, onComplete: function (selector) {
            var values = "";
            for (i = 0; i < selector.options.length; i++) {
                if (selector.options[i].selected && (selector.options[i].value != "")) {
                    values += selector.options[i].value + ";"; //LASCIO IL ; PER POTER EFFETTUARE L'INDEXOF NELLA CHECK SUI PERMESSI CAMPI
                }
            }
            DisableSharedField(); //RESET DEI PERMESSI CAMPI
            IdTipoDealer = values;
            ShowFieldCondition(values); //CHECK SUI PERMESSI
            $("#divLoad").show();
           PageMethods.GetInfoDealer("C", IdTipoDealer.substring(0, IdTipoDealer.length-1).replace(/;/g, ","), fnOKCanale, fnKOCanale);
        }
    });

    $("#divLoad").hide();
    ComboTLoaded = true;

}

function fnKOTipoDealer(result) {
    ShowMessage("Errore in fase di estrazione della Tipologia Dealer.<br/>Si prega di riprovare ", "html");
    ComboTLoaded = true;
}

function fnOKArea(result) {
    $("#ddlMArea").empty();
    $("#ddlMArea").append('<option id="ALL" value="">TUTTE</option>');

    for (var i = 0; i < result.length; i++) {
        $("#ddlMArea").append('<option id="optA' + i + '" value="' + result[i].Value + '">' + result[i].Text + '</option>');
    }
    $("#ddlMArea").dropdownchecklist({
        emptyText: "Seleziona",
        icon: { placement: 'right', toOpen: 'ui-icon-triangle-1-s', toClose: 'ui-icon-triangle-1-n' },
        width: 150, maxDropHeight: 250, firstItemChecksAll: true
    });

    ComboZLoaded = true;

}

function fnKOArea(result) {
    ShowMessage("Errore in fase di estrazione dell'Area.<br/>Si prega di riprovare ", "html");
    ComboZLoaded = true;
}


function fnOKStato(result) {
    $("#ddlMStato").empty();
    $("#ddlMStato").append('<option id="ALL" value="">TUTTI</option>');

    for (var i = 0; i < result.length; i++) {
        $("#ddlMStato").append('<option id="optS' + i + '" value="' + result[i].Value + '">' + result[i].Text + '</option>');
    }
    $("#ddlMStato").dropdownchecklist({
        emptyText: "Seleziona",
        icon: { placement: 'right', toOpen: 'ui-icon-triangle-1-s', toClose: 'ui-icon-triangle-1-n' }, width: 150, maxDropHeight: 250, firstItemChecksAll: true
    });

    ComboSLoaded = true;


}

function fnKOStato(result) {
    ShowMessage("Errore in fase di estrazione dello Stato Dealer.<br/>Si prega di riprovare ", "html");
    ComboSLoaded = true;
}


function fnOKCanale(result) {
    $("#ddlMCanale").dropdownchecklist("destroy");
    $("#ddlMCanale").empty();
    $("#ddlMCanale").append('<option id="ALL" value="">TUTTI</option>');

    for (var i = 0; i < result.length; i++) {
        $("#ddlMCanale").append('<option id="optC' + i + '" value="' + result[i].Value + '">' + result[i].Text + '</option>');
    }
    $("#ddlMCanale").append('<option id="VIS" value="">VIS</option>');

    $("#ddlMCanale").dropdownchecklist({
        emptyText: "Seleziona",
        icon: { placement: 'right', toOpen: 'ui-icon-triangle-1-s', toClose: 'ui-icon-triangle-1-n' }, width: 150, maxDropHeight: 250, firstItemChecksAll: true, onComplete: function (selector) {
            var values = "";
            for (i = 0; i < selector.options.length; i++) {
                if (selector.options[i].selected && (selector.options[i].value != "")) {
                    values += selector.options[i].text + ";"; //LASCIO IL ; PER POTER EFFETTUARE L'INDEXOF NELLA CHECK SUI PERMESSI CAMPI
                }
            }
            if (values.indexOf("VIS") == -1) 
            {
                $("[Desc=ShopInStore]").attr("disabled", "disabled");
            }
            else
            {
                if (IdTipoDealer.indexOf("2;")!=-1)
                    $("[Desc=ShopInStore]").removeAttr("disabled");
            }
        }
    });

    ComboCLoaded = true;
    $("#divLoad").hide();
}

function fnKOCanale(result) {
    ShowMessage("Errore in fase di estrazione del Canale Dealer.<br/>Si prega di riprovare ", "html");
    ComboCLoaded = true;
    $("#divLoad").hide();
}

function fnOKAM(result) {
    $("#ddlMAM").empty();
    $("#ddlMAM").append('<option id="ALL" value="">Tutte le Aree Manager</option>');

    for (var i = 0; i < result.length; i++) {
        $("#ddlMAM").append('<option id="optC' + i + '" value="' + result[i].Value + '">' + result[i].Text + '</option>');
    }
    $("#ddlMAM").dropdownchecklist({
        emptyText: "Seleziona Area Manager",
        icon: { placement: 'right', toOpen: 'ui-icon-triangle-1-s', toClose: 'ui-icon-triangle-1-n' },
        width: 200, maxDropHeight: 250, firstItemChecksAll: true
    });

    ComboALoaded = true;
}

function fnKOAM(result) {
    ShowMessage("Errore in fase di estrazione dell' Area Manager.<br/>Si prega di riprovare ", "html");
    ComboALoaded = true;
}


function fnOKOperativita(result) {
    $("#ddlSOperativita").empty();
    //$("#ddlSOperativita").append('<option value="">Seleziona Operatività</option>');
    var AllOP = "";
    if (result != null) {
        //for (var i = 0; i < result.length; i++) {
        //    AllOP += result[i].Value + (i == result.length - 1 ? "" : ",");
        //}
        //$("#ddlSOperativita").append('<option id="ALL" value="' + AllOP + '">Tutte</option>');
        $("#ddlSOperativita").append('<option id="ALL" value="">Tutte</option>');

        for (var i = 0; i < result.length; i++) {
            $("#ddlSOperativita").append('<option id="optC' + i + '" value="' + result[i].Value + '">' + result[i].Text + '</option>');
        }
    }
    
    $("#ddlSOperativita").append('<option id="NULL" value="NULL">n.d.</option>');
    $("#ddlSOperativita").attr("style", "width:200px");

    ComboOLoaded = true;
}

function fnKOOperativita(result) {
    ShowMessage("Errore in fase di estrazione dell'Operativit&agrave;.<br/>Si prega di riprovare ", "html");
    ComboOLoaded = true;
}

function fnOKFunzionario(result) {
    $("#ddlSFunzionario").empty();
    $("#ddlSFunzionario").append('<option value="">Seleziona Funzionario</option>');
    $("#ddlSFunzionario").append('<option id="0">TUTTI</option>');

    for (var i = 0; i < result.length; i++) {
        $("#ddlSFunzionario").append('<option id="optF' + i + '" value="' + result[i].Value + '">' + result[i].Text + '</option>');
    }
    ComboFLoaded = true;
}

function fnKOFunzionario(result) {
    ShowMessage("Errore in fase di estrazione del Funzionario.<br/>Si prega di riprovare ", "html");
    ComboFLoaded = true;
}



function fnOKRegioni(result) {
    //$("#ddlSRegione").dropdownchecklist("destroy");
    var allRegions = "";
    $("#ddlMRegione").empty();
    if (result != null) {
        //$("#ddlSRegione").append('<option value="" selected>Seleziona una Regione</option>');

        //non serve con la combo multipla;
        //for (var i = 0; i < result.length; i++) {
        //    allRegions += result[i].Value + (i == result.length - 1 ? "" : ",");
        //}

        $("#ddlMRegione").append('<option id="ALL" value="0">Tutte le Regioni</option>');
    }
    for (var i = 0; i < result.length; i++) {
        $("#ddlMRegione").append('<option id="optR' + i + '" value="' + result[i].Value + '">' + result[i].Text + '</option>');
    }

    //inizio aggiunta ddcl
    $("#ddlMRegione").dropdownchecklist({
        emptyText: "Seleziona una Regione",
        icon: { placement: 'right', toOpen: 'ui-icon-triangle-1-s', toClose: 'ui-icon-triangle-1-n' },
        width: 250,
        maxDropHeight: 250,
        firstItemChecksAll: true,
        onComplete: function (selector) {
            var values = "";
            var noItemSelected = true;
            for (i = 0; i < selector.options.length; i++) {
                if (selector.options[i].selected && (selector.options[i].value != "")) {
                    values += selector.options[i].value + ";"; //LASCIO IL ; PER POTER EFFETTUARE L'INDEXOF NELLA CHECK SUI PERMESSI CAMPI
                    noItemSelected = false;
                }
                
            }

            $.each(values.split(","), function (i, e) {
                $("#ddlMRegione option[value='" + e + "']").prop("selected", true);
            });

            $("#ExportchkIDRegione").prop("checked", !noItemSelected );

            $("#divLoad").show();
            PageMethods.GetInfoDealer("P", values, fnOKProvince, fnKOProvince);
        }
    });

    //hack for incorrect ddcl's width and height
    $("#ddcl-ddlMRegione-ddw").css({ "width": "255px", "height": "255px" });
    $("#ddcl-ddlMRegione-ddw div:first").css({ "height": "255px" });
    //fine aggiunta

    //$("#ddlSRegione").change(function () {
    //    var val = $(this).val();
    //    $("#divLoad").show();
    //    PageMethods.GetInfoDealer("P", val, fnOKProvince, fnKOProvince);
    //})

    $("#divLoad").hide();
}

function fnKORegioni(result) {
    ShowMessage("Errore in fase di estrazione delle Regioni.<br/>Si prega di riprovare ", "html");
    $("#divLoad").hide();
}

function fnOKProvince(result) {
    //$("#ddlMProvincia").prop("multiple", true);
    $("#ddlMProvincia").empty();
    //$("#ddlMProvincia").append('<option value="">Seleziona una Provincia</option>');
    $("#ddlMProvincia").append('<option id="ALL" value="0">Tutte le Province in lista</option>');
    for (var i = 0; i < result.length; i++) {
        $("#ddlMProvincia").append('<option id="optP' + i + '" value="' + result[i].Value + '">' + result[i].Text + '</option>');
    }

    //inizio aggiunta ddcl
    $("#ddlMProvincia").dropdownchecklist("destroy");
    $("#ddlMProvincia").dropdownchecklist({
        emptyText: "Seleziona una Provincia",
        icon: { placement: 'right', toOpen: 'ui-icon-triangle-1-s', toClose: 'ui-icon-triangle-1-n' },
        width: 250,
        maxDropHeight: 250,
        firstItemChecksAll: true,
        onComplete: function (selector) {
            var values = "";
            var noItemSelected = true;
            for (i = 0; i < selector.options.length; i++) {
                if (selector.options[i].selected && (selector.options[i].value != "")) {
                    values += selector.options[i].value + ";"; //LASCIO IL ; PER POTER EFFETTUARE L'INDEXOF NELLA CHECK SUI PERMESSI CAMPI
                    noItemSelected = false;
                }

            }
 
            $.each(values.split(","), function (i, e) {
                $("#ddlMProvincia option[value='" + e + "']").prop("selected", true);
            });

            $("#ExportchkIDProvincia").prop("checked", !noItemSelected );
            //$("#divLoad").show();
            //PageMethods.GetInfoDealer("L", values, fnOKComuni, fnKOComuni);
        }
    });

    $("#divLoad").hide();
}

function fnKOProvince(result) {
    ShowMessage("Errore in fase di estrazione delle Province.<br/>Si prega di riprovare ", "html");
    $("#divLoad").hide();
}

//function fnOKComuni(result) {
//    //$("#ddlSComune").dropdownchecklist("destroy");
//    var allCities = "";
//    $("#ddlSComune").empty();
//    $("#ddlSComune").append('<option value="">SELEZIONA UN COMUNE</option>');

//    for (var i = 0; i < result.length; i++) {
//        allCities += result[i].Value + (i == result.length - 1 ? "" : ",");
//    }
//    $("#ddlSComune").append('<option id="ALL" value="' + allCities + '">TUTTI I COMUNI</option>');
//    for (var i = 0; i < result.length; i++) {
//        $("#ddlSComune").append('<option id="optP' + i + '" value="' + result[i].Value + '">' + result[i].Text + '</option>');
//    }
    

//    $("#divLoad").hide();
//}

//function fnKOComuni(result) {
//    ShowMessage("Errore in fase di estrazione delle Localit&agrave;.<br/>Si prega di riprovare ", "html");
//    $("#divLoad").hide();
//}

function fnOKModelloVendita(result) {
    var allMV = "";
    $("#ddlSModelloVendita").empty();
    $("#ddlSModelloVendita").append('<option value="" selected>Seleziona Modello di Vendita</option>');
    if (result != null) {
        for (var i = 0; i < result.length; i++) {
            allMV += result[i].Value + (i == result.length - 1 ? "" : ",");
        }
        $("#ddlSModelloVendita").append('<option id="ALL" value="' + allMV + '">Tutti i Modelli Vendita</option>');
    }
    for (var i = 0; i < result.length; i++) {
        $("#ddlSModelloVendita").append('<option id="optV' + i + '" value="' + result[i].Value + '">' + result[i].Text + '</option>');
    }

    //$("#divLoad").hide();
    ComboVLoaded = true;
}

function fnKOModelloVendita(result) {
    ShowMessage("Errore in fase di estrazione del Modello Vendita.<br/>Si prega di riprovare ", "html");
    ComboVLoaded = true;
}

function fnOKSegmentazione(result) {
    $("#ddlSSegmentazione").empty();
    $("#ddlSSegmentazione").append('<option value="" selected>Seleziona Segmentazione Canale</option>');
    var allSC = "";
    if (result != null) {
        for (var i = 0; i < result.length; i++) {
            allSC += result[i].Value + (i == result.length - 1 ? "" : ",");
        }
        $("#ddlSSegmentazione").append('<option id="ALL" value="' + allSC + '">Tutte le Segmentazioni Canale</option>');
    }
    for (var i = 0; i < result.length; i++) {
        $("#ddlSSegmentazione").append('<option id="optG' + i + '" value="' + result[i].Value + '">' + result[i].Text + '</option>');
    }

    //$("#divLoad").hide();
    ComboVLoaded = true;
}

function fnKOSegmentazione(result) {
    ShowMessage("Errore in fase di estrazione della Segmentazione Canale.<br/>Si prega di riprovare ", "html");
    ComboVLoaded = true;
}

function fnOKCluster(result) {
    $("#ddlSCluster").empty();
    $("#ddlSCluster").append('<option value="" selected>Seleziona un Cluster</option>');
    var allCluster = "";
    if (result != null) {
        for (var i = 0; i < result.length; i++) {
            allCluster += result[i].Value + (i == result.length - 1 ? "" : ",");
        }
        $("#ddlSCluster").append('<option id="ALL" value="' + allCluster + '">Tutti i Cluster</option>');
    }
    for (var i = 0; i < result.length; i++) {
        $("#ddlSCluster").append('<option id="optG' + i + '" value="' + result[i].Value + '">' + result[i].Text + '</option>');
    }

    //$("#divLoad").hide();
    ComboVLoaded = true;
}

function fnKOCluster(result) {
    ShowMessage("Errore in fase di estrazione dei Cluster.<br/>Si prega di riprovare ", "html");
    ComboVLoaded = true;
}

function fnOKAreaCompetenza(result) {
    $("#ddlSAreaCompetenza").empty();
    $("#ddlSAreaCompetenza").append('<option value="" selected>Seleziona Area di Competenza</option>');
    var allAC = "";
    if (result != null) {
        for (var i = 0; i < result.length; i++) {
            allAC += result[i].Value + (i == result.length - 1 ? "" : ",");
        }
        $("#ddlSAreaCompetenza").append('<option id="ALL" value="' + allAC + '">Tutte le Aree</option>');
    }
    for (var i = 0; i < result.length; i++) {
        $("#ddlSAreaCompetenza").append('<option id="optG' + i + '" value="' + result[i].Value + '">' + result[i].Text + '</option>');
    }

    //$("#divLoad").hide();
    ComboVLoaded = true;
}

function fnKOAreaCompetenza(result) {
    ShowMessage("Errore in fase di estrazione dell'Area di Competenza.<br/>Si prega di riprovare ", "html");
    ComboVLoaded = true;
}

function fnOKCentroAssistenzaTecnica(result) {
    $("#ddlSTechAss").empty();
    $("#ddlSTechAss").append('<option value="">Seleziona Centro Assistenza</option>');
    if (result != null) {
        for (var i = 0; i < result.length; i++) {
            $("#ddlSTechAss").append('<option id="optTA' + i + '" value="' + result[i].Value + '">' + result[i].Text + '</option>');
        }
    }

    //$("#ddlSTechAss").attr("style", "width:200px");

    //ComboTALoaded = true;
}

function fnKOCentroAssistenzaTecnica(result) {
    ShowMessage("Errore in fase di estrazione dei Centri di Assistenza Tecnica.<br/>Si prega di riprovare ", "html");
    //ComboTALoaded = true;
}