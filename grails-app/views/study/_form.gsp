
<%@ page import="nci.bbrb.cdr.study.Study" %>
<%--<g:render template="caseDetails" bean="${bpvSixMonthFollowUpInstance.caseRecord}" var="caseRecord"/> --%>
<g:set var="labelNumber" value="${1}"/>

<div class="list">
  <div  class="div-t">
   
    <div class="div-t-r clearfix">
      <div >

        <div class="left width-30"><label for="name">Name: </label></div>

        <div class="left width-30 value ${hasErrors(bean: studyInstance, field: 'name',  'errors')}">
          <div>
           <g:textField name="name" required="" value="${studyInstance?.name}"/>
          </div>
        </div>
      </div>
    </div>
    
    
   
<%-- removed
    <div class="div-t-r clearfix">
      <div >

        <div class="left width-30"><label for="name">Code: </label></div>

        <div class="left width-30 value ${hasErrors(bean: studyInstance, field: 'code',  'errors')}">
          <div>
           <g:textField name="code" required="" value="${studyInstance?.code}"/>
          </div>
        </div>
      </div>
    </div>
    
       --%>
    
    <div class="div-t-r clearfix">
    <div class="${hasErrors(bean: studyInstance, field: 'description:', 'errors')}"><label for="visit">Description: </label><br>

     <g:textArea class="textwide" name="description" cols="40" rows="5" value="${studyInstance?.description}" />
    </div>
  </div>

    <%-- comment out for now 
     <div class="div-t-r clearfix">
      <div >

        <div class="left width-30"><label for="name">Case Record: </label></div>

        <div class="left width-30 value ${hasErrors(bean: studyInstance, field: 'caseRecord',  'errors')}">
          <div>
           <g:select id="caseRecord" name="caseRecord.id" from="${nci.bbrb.cdr.datarecords.CaseRecord.list()}" optionKey="id" value="${studyInstance?.caseRecord?.id}"  noSelection="['null': '']"/>
          </div>
        </div>
      </div>
    </div>
    --%>
     <div class="div-t-r clearfix">
      <div >

        <div class="left width-30"><label for="name">Study Type: </label></div>

        <div class="left width-30 value ${hasErrors(bean: studyInstance, field: 'studyType',  'errors')}">
          <div>
         <g:select id="studyType" name="studyType.id" from="${nci.bbrb.cdr.staticmembers.StudyType.list()}" optionKey="id" value="${studyInstance?.studyType?.id}" class="many-to-one" noSelection="['null': '']"/>
          </div>
        </div>
      </div>
    </div>
    
    
     <div class="div-t-r clearfix">
      <div >

        <div class="left width-30"><label for="name">Biospecimen Type: </label></div>

        <div class="left width-30 value ${hasErrors(bean: studyInstance, field: 'biospecimenType',  'errors')}">
          <div>
          <g:select id="biospecimenType" name="biospecimenType.id" from="${nci.bbrb.cdr.staticmembers.BiospecimenType.list()}" optionKey="id" required="" value="${studyInstance?.biospecimenType?.id}" class="many-to-one" noSelection="['null': '']"/>
          </div>
        </div>
      </div>
    </div>
  

</div>
</div>



