$(function () {
    activateDeletes();

    // add3 is button for abnormalities

    // "editch_primaryTumorSite_${ch.id}"  
    //  "editch_monthYearOfFirstDiagnosis_${ch.id}" 
    //  "editch_source_${ch.id}
    //  "editch_treatments_${ch.id}
    //  "editch_monthYearOfLastTreatment_${ch.id}
    $("#add1").click(function () {
        //alert("add1 click");

        $("#ca-dialog").html("<label for=\"primaryTumorSiteTemp\">Primary Tumor Site: </label><br /><input type=\"text\" id=\"primaryTumorSiteTemp\" name=\"primaryTumorSiteTemp\"  /><br /><label for=\"monthYearOfFirstDiagnosisTemp\">Month Year Of First Diagnosis: </label><br /><input type=\"text\" id=\"monthYearOfFirstDiagnosisTemp\" name=\"monthYearOfFirstDiagnosisTemp\" <br /><label for=\"source\">Source: </label><br /><input type=\"text\" id=\"sourceTemp\" name=\"sourceTemp\" <br /><label for=\"treatments\">Treatment: </label><br /><input type=\"text\" id=\"treatmentsTemp\" name=\"treatmentsTemp\" <br /><label for=\"monthYearOfLastTreatmentTemp\">Month Year of Last Treament: </label><br /><input type=\"text\" id=\"monthYearOfLastTreatmentTemp\" name=\"monthYearOfLastTreatmentTemp\"/>");

        $('#monthYearOfFirstDiagnosisTemp').datepicker({dateFormat: 'mm/dd/yy'});
        $('#monthYearOfLastTreatmentTemp').datepicker({dateFormat: 'mm/dd/yy'});
        
        if ($("#monthYearOfFirstDiagnosisTemp").val().length > 0) {
            $.datepicker.parseDate('mm/dd/yy', $('#monthYearOfFirstDiagnosisTemp'));
        }
        if ($("#monthYearOfLastTreatmentTemp").val().length > 0) {
            $.datepicker.parseDate('mm/dd/yy', $('#monthYearOfLastTreatmentTemp'));
        }

        inputCharLimit();

        $("#ca-dialog").dialog({
            title: "Add Cancer History",
            autoOpen: false,
            modal: true,
            height: 300,
            width: 400,
            buttons: {
                "Save": function () {
                    $("#ca-dialog .redtext").remove();
                    if ($("#primaryTumorSiteTemp").val().length == 0) {
                        $("#ca-dialog").append("<span class=\"redtext\">Please specify primary tumor site</span>");
                        $("#primaryTumorSiteTemp").focus();
                    } else if ($("#monthYearOfFirstDiagnosisTemp").val().length == 0) {
                        $("#ca-dialog").append("<span class=\"redtext\">Please specify Month Year of First Diagnosis</span>");
                        $("#monthYearOfFirstDiagnosisTemp").focus();
                    } else if ($("#monthYearOfLastTreatmentTemp").val().length == 0) {
                        $("#ca-dialog").append("<span class=\"redtext\">Please specify Month Year of Last Treatment</span>");
                        $("#monthYearOfLastTreatmentTemp").focus();
                    }
                    else if ($("#sourceTemp").val().length == 0) {
                        $("#ca-dialog").append("<span class=\"redtext\">Please specify Source of Information</span>");
                        $("#sourceTemp").focus();
                    } else if ($("#treatmentsTemp").val().length == 0) {
                        $("#ca-dialog").append("<span class=\"redtext\">Please specify Treatment type</span>");
                        $("#treatmentsTemp").focus();
                    }
                    else {

                        $("#chprimaryTumorSite").val($("#primaryTumorSiteTemp").val());
                        $("#chmonthYearOfFirstDiagnosis").val($("#monthYearOfFirstDiagnosisTemp").val());
                        $("#chsource").val($("#sourceTemp").val());
                        $("#chtreatments").val($("#treatmentsTemp").val());
                        $("#chmonthYearOfLastTreatment").val($("#monthYearOfLastTreatmentTemp").val());
                        $.ajax({
                            url: '/cdrlite/healthHistory/save_ch?vessel=json',
                            type: 'POST',
                            data: $("form.hhfform").serialize(),
                            success: function (data) {
                                var newEntry = data.success;
                                var newEntryStr = "";
                                $(".new-entry").removeClass("new-entry");
                                if (newEntry != null && newEntry != undefined) {
                                    var newEntryid = newEntry[0].id;
                                    var newEntrypts = newEntry[0].primaryTumorSite;
                                    var newEntryfirstDiag = newEntry[0].monthYearOfFirstDiagnosis;
                                    //alert( newEntryfirstDiag);
                                    var newEntrysource = newEntry[0].source;
                                    var newEntrytreatment = newEntry[0].treatments;
                                    var newEntrylasttreat = newEntry[0].monthYearOfLastTreatment;
                                    if ($("#chTable tr").length == 0) {

                                        newEntryStr = "<thead><tr class=\"prop\" ><th class=\"label\">Primary Tumor Site</th><th>Month Year of First Diagnosis</th><th> Source</th><th>Treatment type </th><th> Month Year Of<br> Last Treatment</th><th class=\"action\"></th></tr></thead><tbody></tbody>";
                                        $("#chTable").html(newEntryStr);
                                    }
                                    newEntryStr = "<tr class=\"prop\" id=\"row" + newEntryid + "\">";
                                    newEntryStr += "<td><input size=\"30\" name=\"editch_primaryTumorSite_" + newEntryid + "\"  value=\"" + newEntrypts + "\"/></td>";
                                    newEntryStr += "<td><input size=\"30\" name=\"editch_monthYearOfFirstDiagnosis_" + newEntryid + "\"  value=\"" + newEntryfirstDiag + "\"/></td>";
                                    newEntryStr += "<td><input size=\"30\" name=\"editch_source_" + newEntryid + "\"  value=\"" + newEntrysource + "\"/></td>";
                                    newEntryStr += "<td><input size=\"30\" name=\"editch_treatments_" + newEntryid + "\"  value=\"" + newEntrytreatment + "\"/></td>";
                                    newEntryStr += "<td><input size=\"30\" name=\"editch_monthYearOfLastTreatment_" + newEntryid + "\"  value=\"" + newEntrylasttreat + "\"/></td>";
                                    newEntryStr += "<td><a class=\"delete-damage ui-button ui-state-default ui-corner-all removepadding\" data-deleteid=\"" + newEntryid + "\" title=\"delete\"  ><span class=\"ui-icon ui-icon-trash\">Remove</span></a></td>";
                                    $("#chTable tbody").append(newEntryStr);
                                    $("#chprimaryTumorSite").val("");
                                    $("#chmonthYearOfFirstDiagnosis").val("");
                                    activateDeletes();
                                    $("#row" + newEntryid).addClass("new-entry");
                                    inputCharLimit();
                                }
                            }
                        });
                        $("#ca-dialog").dialog("close");
                    }
                },
                "Cancel": function () {
                    $(this).dialog("close");
                }
            }
        });
        $("#ca-dialog").dialog("open");
    });
    
    
    $("#add2").click(function () {
        //alert("add1 click");

        $("#ca-dialog").html("<label for=\"diseaseNameTemp\">Disease Name: </label><br /><input type=\"text\" id=\"diseaseNameTemp\" name=\"diseaseNameTemp\"  /><br /><label for=\"monthYearOfFirstDiagnosisTemp\">Month Year Of First Diagnosis: </label><br /><input type=\"text\" id=\"monthYearOfFirstDiagnosisTemp\" name=\"monthYearOfFirstDiagnosisTemp\" <br /><label for=\"source\">Source: </label><br /><input type=\"text\" id=\"sourceTemp\" name=\"sourceTemp\" <br /><label for=\"treatments\">Treatment: </label><br /><input type=\"text\" id=\"treatmentsTemp\" name=\"treatmentsTemp\" <br /><label for=\"monthYearOfLastTreatmentTemp\">Month Year of Last Treament: </label><br /><input type=\"text\" id=\"monthYearOfLastTreatmentTemp\" name=\"monthYearOfLastTreatmentTemp\"/>");

        $('#monthYearOfFirstDiagnosisTemp').datepicker({dateFormat: 'mm/dd/yy'});
        $('#monthYearOfLastTreatmentTemp').datepicker({dateFormat: 'mm/dd/yy'});
        
        if ($("#monthYearOfFirstDiagnosisTemp").val().length > 0) {
            $.datepicker.parseDate('mm/dd/yy', $('#monthYearOfFirstDiagnosisTemp'));
        }
        if ($("#monthYearOfLastTreatmentTemp").val().length > 0) {
            $.datepicker.parseDate('mm/dd/yy', $('#monthYearOfLastTreatmentTemp'));
        }

        inputCharLimit();

        $("#ca-dialog").dialog({
            title: "Add General Medical History",
            autoOpen: false,
            modal: true,
            height: 300,
            width: 400,
            buttons: {
                "Save": function () {
                    $("#ca-dialog .redtext").remove();
                    if ($("#diseaseNameTemp").val().length == 0) {
                        $("#ca-dialog").append("<span class=\"redtext\">Please specify primary tumor site</span>");
                        $("#diseaseNameTemp").focus();
                    } else if ($("#monthYearOfFirstDiagnosisTemp").val().length == 0) {
                        $("#ca-dialog").append("<span class=\"redtext\">Please specify Month Year of First Diagnosis</span>");
                        $("#monthYearOfFirstDiagnosisTemp").focus();
                    } else if ($("#monthYearOfLastTreatmentTemp").val().length == 0) {
                        $("#ca-dialog").append("<span class=\"redtext\">Please specify Month Year of Last Treatment</span>");
                        $("#monthYearOfLastTreatmentTemp").focus();
                    }
                    else if ($("#sourceTemp").val().length == 0) {
                        $("#ca-dialog").append("<span class=\"redtext\">Please specify Source of Information</span>");
                        $("#sourceTemp").focus();
                    } else if ($("#treatmentsTemp").val().length == 0) {
                        $("#ca-dialog").append("<span class=\"redtext\">Please specify Treatment type</span>");
                        $("#treatmentsTemp").focus();
                    }
                    else {

                        $("#gmh_diseaseName").val($("#diseaseNameTemp").val());
                        $("#gmh_monthYearOfFirstDiagnosis").val($("#monthYearOfFirstDiagnosisTemp").val());
                        $("#gmh_source").val($("#sourceTemp").val());
                        $("#gmh_treatments").val($("#treatmentsTemp").val());
                        $("#gmh_monthYearOfLastTreatment").val($("#monthYearOfLastTreatmentTemp").val());
                        $.ajax({
                            url: '/cdrlite/healthHistory/save_gm?vessel=json',
                            type: 'POST',
                            data: $("form.hhfform").serialize(),
                            success: function (data) {
                                var newEntry = data.success;
                                var newEntryStr = "";
                                $(".new-entry").removeClass("new-entry");
                                if (newEntry != null && newEntry != undefined) {
                                    var newEntryid = newEntry[0].id;
                                    var newEntrypts = newEntry[0].primaryTumorSite;
                                    var newEntryfirstDiag = newEntry[0].monthYearOfFirstDiagnosis;
                                    var newEntrysource = newEntry[0].source;
                                    var newEntrytreatment = newEntry[0].treatments;
                                    var newEntrylasttreat = newEntry[0].monthYearOfLastTreatment;
                                    if ($("#chTable tr").length == 0) {

                                        newEntryStr = "<thead><tr class=\"prop\" ><th class=\"label\">Disease Name</th><th>Month Year of First Diagnosis</th><th> Source</th><th>Treatment type </th><th> Month Year Of<br> Last Treatment</th><th class=\"action\"></th></tr></thead><tbody></tbody>";
                                        $("#gmhTable").html(newEntryStr);
                                    }
                                    newEntryStr = "<tr class=\"prop\" id=\"row" + newEntryid + "\">";
                                    newEntryStr += "<td><input size=\"30\" name=\"editgmh_diseaseName_" + newEntryid + "\"  value=\"" + newEntrypts + "\"/></td>";
                                    newEntryStr += "<td><input size=\"30\" name=\"editgmh_monthYearOfFirstDiagnosis_" + newEntryid + "\"  value=\"" + newEntryfirstDiag + "\"/></td>";
                                    newEntryStr += "<td><input size=\"30\" name=\"editgmh_source_" + newEntryid + "\"  value=\"" + newEntrysource + "\"/></td>";
                                    newEntryStr += "<td><input size=\"30\" name=\"editgmh_treatments_" + newEntryid + "\"  value=\"" + newEntrytreatment + "\"/></td>";
                                    newEntryStr += "<td><input size=\"30\" name=\"editgmh_monthYearOfLastTreatment_" + newEntryid + "\"  value=\"" + newEntrylasttreat + "\"/></td>";
                                    newEntryStr += "<td><a class=\"delete-damage ui-button ui-state-default ui-corner-all removepadding\" data-deleteid=\"" + newEntryid + "\" title=\"delete\"  ><span class=\"ui-icon ui-icon-trash\">Remove</span></a></td>";
                                    $("#gmhTable tbody").append(newEntryStr);
                                    $("#gmh_diseaseName").val("");
                                    $("#gmh_monthYearOfFirstDiagnosis").val("");
                                    activateDeletes();
                                    $("#row" + newEntryid).addClass("new-entry");
                                    inputCharLimit();
                                }
                            }
                        });
                        $("#ca-dialog").dialog("close");
                    }
                },
                "Cancel": function () {
                    $(this).dialog("close");
                }
            }
        });
        $("#ca-dialog").dialog("open");
    });
    
    
    $("#add3").click(function () {
        //alert("add1 click");

        $("#ca-dialog").html("<label for=\"medicationNameTemp\">Medication Name: </label><br /><input type=\"text\" id=\"medicationNameTemp\" name=\"medicationNameTemp\"  /><br /><label for=\"monthYearOfLastAdminTemp\">Month Year Of Last Administration: </label><br /><input type=\"text\" id=\"monthYearOfLastAdminTemp\" name=\"monthYearOfLastAdminTemp\" <br /><label for=\"source\">Source: </label><br /><input type=\"text\" id=\"sourceTemp\" name=\"sourceTemp\" <br>");

        $('#monthYearOfLastAdminTemp').datepicker({dateFormat: 'mm/dd/yy'});
       
        
        if ($("#monthYearOfLastAdminTemp").val().length > 0) {
            $.datepicker.parseDate('mm/dd/yy', $('#monthYearOfLastAdminTemp'));
        }
       

        inputCharLimit();

        $("#ca-dialog").dialog({
            title: "Add Medication History",
            autoOpen: false,
            modal: true,
            height: 300,
            width: 400,
            buttons: {
                "Save": function () {
                    $("#ca-dialog .redtext").remove();
                    if ($("#medicationNameTemp").val().length == 0) {
                        $("#ca-dialog").append("<span class=\"redtext\">Please specify primary tumor site</span>");
                        $("#medicationNameTemp").focus();
                    } else if ($("#monthYearOfLastAdminTemp").val().length == 0) {
                        $("#ca-dialog").append("<span class=\"redtext\">Please specify Month Year of First Diagnosis</span>");
                        $("#monthYearOfLastAdminTemp").focus();
                    } 
                    else if ($("#sourceTemp").val().length == 0) {
                        $("#ca-dialog").append("<span class=\"redtext\">Please specify Source of Information</span>");
                        $("#sourceTemp").focus();
                    } 
                    else {

                        $("#med_medicationName").val($("#medicationNameTemp").val());
                        $("#med_dateofLastAdministration").val($("#monthYearOfLastAdminTemp").val());
                        $("#med_source").val($("#sourceTemp").val());
                         $.ajax({
                            url: '/cdrlite/healthHistory/save_med?vessel=json',
                            type: 'POST',
                            data: $("form.hhfform").serialize(),
                            success: function (data) {
                                var newEntry = data.success;
                                var newEntryStr = "";
                                $(".new-entry").removeClass("new-entry");
                                if (newEntry != null && newEntry != undefined) {
                                    var newEntryid = newEntry[0].id;
                                    var newEntrypts = newEntry[0].medicationName;
                                    var newEntrylastAdmin = newEntry[0].dateofLastAdministration;
                                    var newEntrysource = newEntry[0].source;
                                    
                                    if ($("#medTable tr").length == 0) {

                                        newEntryStr = "<thead><tr class=\"prop\" ><th class=\"label\">Medication Name</th><th>Month Year of Last Administration</th><th> Source</th><th class=\"action\"></th></tr></thead><tbody></tbody>";
                                        $("#chTable").html(newEntryStr);
                                    }
                                    newEntryStr = "<tr class=\"prop\" id=\"row" + newEntryid + "\">";
                                    newEntryStr += "<td><input size=\"30\" name=\"editmed_medicationName_" + newEntryid + "\"  value=\"" + newEntrypts + "\"/></td>";
                                    newEntryStr += "<td><input size=\"30\" id=\"dateofLastAdminTemp\" name=\"editmed_dateofLastAdministration_" + newEntryid + "\"  value=\"" + newEntrylastAdmin + "\"/></td>";
                                    newEntryStr += "<td><input size=\"30\" name=\"editmed_source_" + newEntryid + "\"  value=\"" + newEntrysource + "\"/></td>";
                                     newEntryStr += "<td><a class=\"delete-damage ui-button ui-state-default ui-corner-all removepadding\" data-deleteid=\"" + newEntryid + "\" title=\"delete\"  ><span class=\"ui-icon ui-icon-trash\">Remove</span></a></td>";
                                    $("#medTable tbody").append(newEntryStr);
                                    $("#med_medicationName").val("");
                                    $("#med_dateofLastAdministration").val("");
                                    
                                   
                                    activateDeletes();
                                    $("#row" + newEntryid).addClass("new-entry");
                                    inputCharLimit();
                                }
                            }
                        });
                        $("#ca-dialog").dialog("close");
                    }
                },
                "Cancel": function () {
                    $(this).dialog("close");
                }
            }
        });
        $("#ca-dialog").dialog("open");
    });
    
    
    
    
    
});

function activateDeletes() {
    //alert(" iam i ad")
    $(".delete-cancer").click(function () {
        var thisid = $(this).data("deleteid");
        $("#ca-dialog").html("Are you sure you want to delete this cancer history entry?");
        $("#ca-dialog").dialog({
            title: "Delete Cancer History entry",
            autoOpen: false,
            modal: true,
            height: 120,
            width: 300,
            buttons: {
                "Yes": function () {
                    $.ajax({
                        type: 'POST',
                        dataType: 'jsonp',
                        url: '/cdrlite/healthHistory/removeCancerEntry/' + thisid
                    }).done(function (data) {
                        if (data.chDel == "yes") {

                            $("#row" + data.delid).remove();
                            $("#ca-dialog").dialog("close");
                        }
                    });
                },
                "Cancel": function () {
                    $(this).dialog("close");
                }
            }
        });
        $("#ca-dialog").dialog("open");
    });
    
    
    $(".delete-gmh").click(function () {
        var thisid = $(this).data("deleteid");
        $("#ca-dialog").html("Are you sure you want to delete this General Medical history entry?");
        $("#ca-dialog").dialog({
            title: "Delete General Medical history Entry",
            autoOpen: false,
            modal: true,
            height: 120,
            width: 300,
            buttons: {
                "Yes": function () {
                    $.ajax({
                        type: 'POST',
                        dataType: 'jsonp',
                        url: '/cdrlite/healthHistory/removeGMHEntry/' + thisid
                    }).done(function (data) {
                        if (data.chDel == "yes") {

                            $("#row" + data.delid).remove();
                            $("#ca-dialog").dialog("close");
                        }
                    });
                },
                "Cancel": function () {
                    $(this).dialog("close");
                }
            }
        });
        $("#ca-dialog").dialog("open");
    });
    
    
    
     $(".delete-med").click(function () {
        var thisid = $(this).data("deleteid");
        $("#ca-dialog").html("Are you sure you want to delete this Medication history entry?");
        $("#ca-dialog").dialog({
            title: "Delete Medication history Entry",
            autoOpen: false,
            modal: true,
            height: 120,
            width: 300,
            buttons: {
                "Yes": function () {
                    $.ajax({
                        type: 'POST',
                        dataType: 'jsonp',
                        url: '/cdrlite/healthHistory/removeGMHEntry/' + thisid
                    }).done(function (data) {
                        if (data.chDel == "yes") {

                            $("#row" + data.delid).remove();
                            $("#ca-dialog").dialog("close");
                        }
                    });
                },
                "Cancel": function () {
                    $(this).dialog("close");
                }
            }
        });
        $("#ca-dialog").dialog("open");
    });


}



