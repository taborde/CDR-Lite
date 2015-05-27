
      <table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'study.name.label', default: 'Study_Name')}" />
					
						<%--<g:sortableColumn property="code" title="${message(code: 'study.code.label', default: 'Code')}" /> --%>
					
						<g:sortableColumn property="description" title="${message(code: 'study.description.label', default: 'Description')}" />
					
						<th><g:message code="study.caseRecord.label" default="Case Record" /></th>
					
						<th><g:message code="study.studyType.label" default="Study Type" /></th>
					
						<th><g:message code="study.biospecimenType.label" default="Biospecimen Type" /></th>
                                                <th><g:message code="study.dateCreated.label" default="Date Created" /></th>
                                                <th> Action</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${studyInstanceList}" status="i" var="studyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link controller="study" action="show" id="${studyInstance.id}">${fieldValue(bean: studyInstance, field: "name")}</g:link></td>
					
						<%--<td>${fieldValue(bean: studyInstance, field: "code")}</td>--%>
					
						<td>${fieldValue(bean: studyInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: studyInstance, field: "caseRecord")}</td>
					
						<td>${fieldValue(bean: studyInstance, field: "studyType")}</td>
					
						<td>${fieldValue(bean: studyInstance, field: "biospecimenType")}</td>
                                                
                                               <td>${studyInstance.dateCreated?.format('MM-dd-yyyy HH:mm')}</td>
                                               
                                                <td nowrap>

            <g:if test="${session.SPRING_SECURITY_CONTEXT?.authentication?.principal?.getUsername() == 'admin'}">
                 <g:link class="ui-button ui-state-default ui-corner-all removepadding" title="delete" controller="study" action="delete" id="${studyInstance.id}" onclick="return confirm('Are you sure to remove the file?')"><span class="ui-icon ui-icon-trash">Remove</span></g:link>
            </g:if>
            </td>
					
					</tr>
				</g:each>
				</tbody>
	</table>
			<div class="paginateButtons">
				<g:paginate total="${studyInstanceCount ?: 0}" />
			</div>
	
