
<%@ page import="nci.bbrb.cdr.staticmembers.Study" %>
<%--<g:render template="caseDetails" bean="${bpvSixMonthFollowUpInstance.caseRecord}" var="caseRecord"/> --%>
<g:set var="labelNumber" value="${1}"/>

<div class="list">
  <div  class="div-t">
   
    <div class="div-t-r clearfix">
      <div >

        <div class="left width-30 "><label for="name">Name: </label></div>

        <div class="left width-30 value ${hasErrors(bean: studyInstance, field: 'name',  'errors')}">
          <div>
           ${studyInstance?.name}
          </div>
        </div>
      </div>
    </div>
    
    
 
    
    <div class="div-t-r clearfix">
    <div class="${hasErrors(bean: studyInstance, field: 'description:', 'errors')}"><label for="visit">Description: </label><br>

    ${studyInstance?.description}
    </div>
  </div>

  
     <div class="div-t-r clearfix">
      <div >

        <div class="left width-30 "><label for="name">Study Type: </label></div>

        <div class="left width-30 value ${hasErrors(bean: studyInstance, field: 'studyType',  'errors')}">
          <div>
         ${studyInstance?.studyType?.name}
          </div>
        </div>
      </div>
    </div>
    
    
     <div class="div-t-r clearfix">
      <div >

        <div class="left width-30 "><label for="name">Biospecimen Type: </label></div>

        <div class="left width-30 value ${hasErrors(bean: studyInstance, field: 'biospecimenType',  'errors')}">
          <div>
        ${studyInstance?.biospecimenType?.name}
          </div>
        </div>
      </div>
    </div>
  

</div>
</div>



