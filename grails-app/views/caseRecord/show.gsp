
<%@ page import="nci.bbrb.cdr.datarecords.CaseRecord" %>
<%@ page import="nci.bbrb.cdr.util.FileUpload" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="cahubTemplate"/>
        <g:set var="entityName" value="${message(code: 'caseRecord.label', default: 'CaseRecord')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>

        <div id="nav" class="clearfix">
            <div id="navlist">
                <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
                       </div>
                       </div>

                   <div id="container" class="clearfix">
                   <h1>Show Case Record Details for ${caseRecordInstance.caseId} </h1>
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <div class="dialog">
                        <table>
                            <tbody>
                          <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseRecord.caseId.label" default="Case Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: caseRecordInstance, field: "caseId")}</td>
                            
                        </tr>       
                    
                          <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseRecord.caseCollectionType.label" default="Collection Type" /></td>
                            
                            <td valign="top" class="value">${caseRecordInstance?.caseCollectionType?.encodeAsHTML()}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseRecord.caseStatus.label" default="Case Status" /></td>
                            
                            <td valign="top" class="value">${caseRecordInstance?.caseStatus?.encodeAsHTML()}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseRecord.bss.label" default="BSS" /></td>
                            
                            <td valign="top" class="value"><g:link controller="BSS" action="show" id="${caseRecordInstance?.bss?.id}">${caseRecordInstance?.bss?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                          <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseRecord.primaryTissueType.label" default="Primary Organ" /></td>
                            
                            <td valign="top" class="value">${caseRecordInstance?.primaryTissueType?.encodeAsHTML()}</td>
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseRecord.candidateRecord.label" default="Candidate Record ID" /></td>
                            
                            <td valign="top" class="value"><g:link controller="candidateRecord" action="show" id="${caseRecordInstance?.candidateRecord?.id}">${caseRecordInstance?.candidateRecord?.candidateId}</g:link></td>
                            
                        </tr>
                    
                      
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseRecord.study.label" default="Study" /></td>
                            
                            <td valign="top" class="value">${caseRecordInstance?.study?.encodeAsHTML()}</td>
                            
                        </tr>
                    
                    
                       
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseRecord.dateCreated.label" default="Date Created" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${caseRecordInstance?.dateCreated}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="caseRecord.lastUpdated.label" default="Last Updated" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${caseRecordInstance?.lastUpdated}" /></td>
                            
                        </tr>
                    
                      
                    
                       <tr class="prop"><td valign="top" class="name formheader" colspan="3">Uploaded Files:</td></tr>
                       <tr>
                            <td valign="top" class="value" colspan="3">
                          <g:if test="${FileUpload.findAll('from FileUpload as f where f.caseId=?', [caseRecordInstance?.caseId])}">
                            <div class="list">
                              <table>
                                <thead>
                                  <tr>
                                    <th>File Name</th>
                                    <th >Date Uploaded</th>
                                    <th >Category</th>
                                <g:if test="${session.org.code == 'DCC'}">
                                  <th><nobr> Hide From BSS</nobr></th>
                                </g:if>
                                <th>Comments</th>
                                <g:if test="${session.DM}">
                                  <th>Action</th>

                                </g:if>
                                </tr>
                                </thead>
                                <tbody>
                                <g:each in="${FileUpload.findAll('from FileUpload as f where f.caseId=?', [caseRecordInstance?.caseId])}" status="i" var="fileUploadInstance">

                                   <g:if test="${fileUploadInstance.hideFromBss == true && session.org.code != 'DCC'}"><!--dont show file if user NOT DCC AND  if 'hide from BSS' is selected --> </g:if>
                                   <g:if test="${fileUploadInstance.dmUseOnly == true && !(session?.org?.code.equals('DCC') && session.DM==true)}"><!--dont show file this file if user not DM --> </g:if>
                                  <g:else>
                                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                                      <td><g:link controller="fileUpload" action="download" id="${fileUploadInstance.id}">${fileUploadInstance.fileName}</g:link></td>
                                    <td><nobr>${fileUploadInstance.uploadTime}</nobr></td>
                                    <td><nobr>${fileUploadInstance.category}</nobr></td>
                                    <g:if test="${session.org.code == 'DCC'}">
                                      <td><nobr>${fileUploadInstance.hideFromBss ?'Yes':'No'}</nobr></td>
                                    </g:if>
                                    <td class="unlimitedstr"><div>${fieldValue(bean: fileUploadInstance, field: "comments")}</div></td>
                                    <g:if test="${session.DM}">
                                      <td nowrap>
                                      <!--  <g:link controller="fileUpload" action="remove" id="${fileUploadInstance.id}" onclick="return confirm('Are you sure to remove the file?')">Remove</g:link> -->

                                          <g:if test="${(fileUploadInstance?.bss?.code?.equals(session.org.code) || session.org.code == 'DCC' ) }"> 
                                        <g:link class="ui-button ui-state-default ui-corner-all removepadding" title="edit" controller="fileUpload" action="edit" id="${fileUploadInstance.id}" ><span class="ui-icon ui-icon-pencil">Edit</span></g:link>
                                        <g:link class="ui-button ui-state-default ui-corner-all removepadding" title="delete" controller="fileUpload" action="delete" id="${fileUploadInstance.id}" onclick="return confirm('Are you sure to remove the file?')"><span class="ui-icon ui-icon-trash">Remove</span></g:link>
                                      </g:if>
                                      </td>
                                    </g:if>
                                    </tr>
                                  </g:else>

                                </g:each>
                                </tbody>
                              </table>
                            </div>
                          </g:if>
                          <g:if test="${session.DM}">
                            <a class="uibutton" href="/cdrlite/fileUpload/create?caseRecord.id=${caseRecordInstance.id}" title="Upload case documents" />
                            <span class="ui-icon ui-icon-circle-arrow-n left"></span>Upload
                            </a>
                          </g:if>
                     </td>
                     </tr>
                    
                          <tr class="prop"><td valign="top" class="name formheader" colspan="3">Specimens (${caseRecordInstance.specimens.size()}):  
                          </td></tr>
      <tr>
        <td valign="top" class="value" colspan="3"> 
          <div class="list">
         <table class="nowrap">
           <thead>
           <tr>
            <th>Specimen Id</th>              
            <th>Tissue Type</th>        
            <th>Fixative</th>
           </tr>
         </thead>
         <tbody>
          <g:each in="${caseRecordInstance.specimens}" status="i" var="s">
          <tr class="${(i % 2) == 0 ? 'odd' : 'even'}" id="${s.specimenId.toUpperCase()}">

            <td class="itemid"><g:link action="show" controller="specimenRecord" id="${s.id}">${s.specimenId}</g:link></td>
          
          <td>${s.tissueType}</td>

         

          <td>${s.fixative}</td>

          </tr>
         </g:each>
        </tbody>
      </table>
    </div>
     </td>

</tr>
        
                       
                            </tbody>
                        </table>
                    </div>
                    <div class="buttons">
                        <g:form url="[resource:caseRecordInstance, action:'delete']" method="POST" >
                            <g:hiddenField name="id" value="${caseRecordInstance?.id}" />
                            <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                        </g:form>
                    </div>
            </div>
            
         
            
    </body>
</html>
