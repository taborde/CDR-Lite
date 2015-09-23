<%@ page import="nci.bbrb.cdr.bps.history.HealthHistory" %>
<%  def labelNumber = 1%>
<div id="hhr-rec" class="div-t">
  <div class="div-t-h">Section A: General Health History</div>
  <div class="div-t-r">
    <div class="left width-30">
      <label for="Source">${labelNumber++}. Source: </label>
      </div>
      <div  class="value ${hasErrors(bean: healthHistoryInstance, field: 'source', 'errors')}">
      <%-- <g:select name="source" from="${nci.bbrb.cdr.bps.history.HealthHistory$SourceType?.values()}" keys="${nci.bbrb.cdr.bps.history.HealthHistory$SourceType.values()*.name()}" value="${healthHistoryInstance?.source?.name()}"  noSelection="['': '']"/> --%>
      <g:select name="source" from="${['Self Report','Medical Record','Family Report']}" value="${healthHistoryInstance.source?.encodeAsHTML()}" />
   <%-- <g:select name="envTemperature" from="${['','Yes','No', 'Unknown']}" value="${tissueRecoveryBmsInstance.envTemperature}" /> --%>
      </div>
    
    </div>
    
    <div class="div-t-r">
    <div class="left width-30">
      <label for="Source">${labelNumber++}. History Of Cancer: </label>
      </div>
     <div class="value">
      <g:radio  id="hcyes" name="historyOfCancer"  value="Yes" checked="${healthHistoryInstance.historyOfCancer?.encodeAsHTML() =='Yes'}" /><label for="hcyes">Yes</label> &nbsp;&nbsp;&nbsp;
      <g:radio id="hcno" name="historyOfCancer"  value="No" checked="${healthHistoryInstance.historyOfCancer?.encodeAsHTML() =='No'}" /><label for="hcno">No</label>
    </div>
    
    </div>
    
    <%--
 <div class="div-t-r list">
    <label for="damComments">${labelNumber++}. Please note any abnormalities observed upon histopathologic evaluation of the brain for processing: </label><br />
    <a id="add3" title="Add new Abnormality" class="uibutton"><span class="ui-icon ui-icon-plusthick"></span>Add</a>
    <input type="hidden" name="hpRegion" id="hpRegion" />
    <input type="hidden" name="hpObservation" id="hpObservation"/>
    <table id="hpRegionTable"> 
    <g:if test="${showhp}">
      <thead><tr class="prop" ><th class="label">Region of Brain</th><th> Observations</th><th class="action"></th></tr></thead>
      <tbody><g:each in="${damlist}" status="k" var="dam">
        <g:if test="${dam.studyType.equals('histopathological evaluation') && dam.userInput == true }">
          <tr class="prop " id="row${dam.id}">
            <td><g:textField size="30" maxlength="255"  name="editHpRegion_${dam.id}"  value="${dam.region}"/></td>
            <td><g:textArea name="editHpObservation_${dam.id}" value="${dam.observation}" cols="30" rows="2"/></td>
            <td><a class="delete-damage ui-button ui-state-default ui-corner-all removepadding" data-deleteid="${dam.id}" title="delete" action="removeDamage"  ><span class="ui-icon ui-icon-trash">Remove</span></a></td>
          </tr>
        </g:if>
      </g:each></tbody>
    </g:if>
    </table>
  </div>




--%>
    
       
  
  <div id="addCancerHistory" class="div-t-r depends-on ${hasErrors(bean: healthHistoryInstance, field: 'historyOfCancer', 'errors')}" data-id="hcyes">   
    <label>${labelNumber}.  If yes to above, please add history of cancer:</label>
   
   <div class="div-t-r list">
    
    <a id="add1" title="Add Cancer History" class="uibutton"><span class="ui-icon ui-icon-plusthick"></span>Add</a>
    <input type="hidden" name="chprimaryTumorSite" id="chprimaryTumorSite" />
    <input type="hidden" name="chmonthYearOfFirstDiagnosis" id="chmonthYearOfFirstDiagnosis"/>
    <input type="hidden" name="chsource" id="chsource" />
    <input type="hidden" name="chmonthYearOfLastTreatment" id="chmonthYearOfLastTreatment"/>
    <input type="hidden" name="chtreatments" id="chtreatments" />
    
    <input type="hidden" id="candId" name="candId" value="${healthHistoryInstance.candidateRecord.id}"/>
    <table id="chTable"> 
    
        <thead><tr class="prop" ><th class="label">Primary Tumor Site</th><th> Month Year Of<br> First Diagnosis</th><th> Source</th><th> Treatment Type </th><th> Month Year Of<br> Last Treatment</th><th> Action</th></tr> </thead>
      <tbody >
    <g:each in="${chList}" status="k" var="ch">
       
          <tr class="prop " id="row${ch.id}">
            <td><g:textField  size="30" maxlength="255"  name="editch_primaryTumorSite_${ch.id}"  value="${ch.primaryTumorSite}"/></td>
            <td><g:jqDatePicker size="30" maxlength="255" name="editch_monthYearOfFirstDiagnosis_${ch.id}" value="${ch.monthYearOfFirstDiagnosis}" /></td>
            <td><g:textField size="30" maxlength="255" name="editch_source_${ch.id}" value="${ch.source}" /></td>
            <td> <g:textField size="30" maxlength="255" name="editch_treatments_${ch.id}" value="${ch.treatments}"/>  </td> 
             <td><g:jqDatePicker size="30" maxlength="255" name="editch_monthYearOfLastTreatment_${ch.id}" value="${ch.monthYearOfLastTreatment}" /></td>
            <td><a class="delete-cancer ui-button ui-state-default ui-corner-all removepadding" data-deleteid="${ch.id}" title="delete" action="removeCancerEntry"  ><span class="ui-icon ui-icon-trash">Remove</span></a></td>
            
          </tr>
           
              
              
    </g:each>
      </tbody>
    
    </table>
  </div>
      
  </div>
  
  
  <div id="addGMHistory" class="div-t-r" >   
    <label>${labelNumber}.  Add General Medical History:</label>
   
   <div class="div-t-r list">
    
    <a id="add2" title="Add General Medical History" class="uibutton"><span class="ui-icon ui-icon-plusthick"></span>Add</a>
    <input type="hidden" name="gmh_diseaseName" id="gmh_diseaseName" />
    <input type="hidden" name="gmh_monthYearOfFirstDiagnosis" id="gmh_monthYearOfFirstDiagnosis"/>
    <input type="hidden" name="gmh_source" id="gmh_source" />
    <input type="hidden" name="gmh_monthYearOfLastTreatment" id="gmh_monthYearOfLastTreatment"/>
    <input type="hidden" name="gmh_treatments" id="gmh_treatments" />
    
    <input type="hidden" id="candId" name="candId" value="${healthHistoryInstance.candidateRecord.id}"/>
    <table id="gmhTable"> 
    
        <thead><tr class="prop" ><th class="label">Disease Name</th><th> Month Year Of<br> First Diagnosis</th><th> Source</th><th> Treatment Type </th><th> Month Year Of<br> Last Treatment</th><th> Action</th></tr> </thead>
      <tbody >
    <g:each in="${gmhList}" status="g" var="gmh">
       
          <tr class="prop " id="row${gmh.id}">
            <td><g:textField  size="30" maxlength="255"  name="editgmh_diseaseName_${gmh.id}"  value="${gmh.diseaseName}"/></td>
            <td><g:jqDatePicker size="30" maxlength="255" name="editgmh_monthYearOfFirstDiagnosis_${gmh.id}" value="${gmh.monthYearOfFirstDiagnosis}" /></td>
            <td><g:textField size="30" maxlength="255" name="editgmh_source_${gmh.id}" value="${gmh.source}" /></td>
            <td> <g:textField size="30" maxlength="255" name="editgmh_treatments_${gmh.id}" value="${gmh.treatments}"/>  </td> 
             <td><g:jqDatePicker size="30" maxlength="255" name="editgmh_monthYearOfLastTreatment_${gmh.id}" value="${gmh.monthYearOfLastTreatment}" /></td>
            <td><a class="delete-gmh ui-button ui-state-default ui-corner-all removepadding" data-deleteid="${gmh.id}" title="delete" action="removeGMHEntry"  ><span class="ui-icon ui-icon-trash">Remove</span></a></td>
            
          </tr>
           
              
              
    </g:each>
      </tbody>
    
    </table>
  </div>
      
  </div>
  
  
  
  <div id="addMedHistory" class="div-t-r" >   
    <label>${labelNumber}.  Add Medication History:</label>
   
   <div class="div-t-r list">
    
    <a id="add3" title="Add Medication History" class="uibutton"><span class="ui-icon ui-icon-plusthick"></span>Add</a>
    <input type="hidden" name="med_medicationName" id="med_medicationName" />
    <input type="hidden" name="med_dateofLastAdministration" id="med_dateofLastAdministration"/>
    <input type="hidden" name="med_source" id="med_source" />
        
    <input type="hidden" id="candId" name="candId" value="${healthHistoryInstance.candidateRecord.id}"/>
    <table id="medTable"> 
    
        <thead><tr class="prop" ><th class="label">Medication Name</th><th> Month Year Of<br> last Administration</th><th> Source</th><th> Action</th></tr> </thead>
      <tbody >
    <g:each in="${medList}" status="m" var="med">
       
          <tr class="prop " id="row${med.id}">
            <td><g:textField  size="30" maxlength="255"  name="editmed_medicationName_${med.id}"  value="${med.medicationName}"/></td>
            <td><g:jqDatePicker size="30" maxlength="255" name="editmed_dateofLastAdministration_${med.id}" value="${med.dateofLastAdministration}" /></td>
            <td><g:textField size="30" maxlength="255" name="editmed_source_${med.id}" value="${med.source}" /></td>
             <td><a class="delete-med ui-button ui-state-default ui-corner-all removepadding" data-deleteid="${med.id}" title="delete" action="removeMedEntry"  ><span class="ui-icon ui-icon-trash">Remove</span></a></td>
            
          </tr>
           
              
              
    </g:each>
      </tbody>
    
    </table>
  </div>
      
  </div>
  
  
  
  
 
  </div>
  
</div>

