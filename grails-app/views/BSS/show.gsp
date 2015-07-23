
<%@ page import="nci.bbrb.cdr.staticmembers.BSS" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="cahubTemplate"/>
        <g:set var="entityName" value="${message(code: 'BSS.label', default: 'BSS')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>

        <div id="nav" class="clearfix">
            <div id="navlist">
                <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
                   <g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link>
                   <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
                       </div>
                       </div>

                   <div id="container" class="clearfix">
                   <h1><g:message code="default.show.label" args="[entityName]" /></h1>
                    <g:if test="${flash.message}">
                        <div class="message" role="status">${flash.message}</div>
                    </g:if>
                    <div class="dialog">
                        <table>
                            <tbody>
                                
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="BSS.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: BSSInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="BSS.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: BSSInstance, field: "name")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="BSS.code.label" default="Code" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: BSSInstance, field: "code")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="BSS.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: BSSInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="BSS.parentBss.label" default="Parent Bss" /></td>
                            
                            <td valign="top" class="value"><g:link controller="BSS" action="show" id="${BSSInstance?.parentBss?.id}">${BSSInstance?.parentBss?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="BSS.IRBprotocol.label" default="IRB protocol" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: BSSInstance, field: "IRBprotocol")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="BSS.timeZone.label" default="Time Zone" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: BSSInstance, field: "timeZone")}</td>
                            
                        </tr>
                    
                            </tbody>
                        </table>
                    </div>
                    <div class="buttons">
                        <g:form url="[resource:BSSInstance, action:'delete']" method="POST" >
                            <g:hiddenField name="id" value="${BSSInstance?.id}" />
                            <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                            <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                        </g:form>
                    </div>
            </div>
    </body>
</html>
