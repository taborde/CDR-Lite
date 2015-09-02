<g:set var="bodyclass" value="opshome home" scope="request"/>
<html>
  <head>
    <title>CDR Data Management Home</title>
    <meta name="layout" content="cahubTemplate" />
  </head>
  <body>
       <div id="nav" class="clearfix">
          <div id="navlist">
            <a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a> 
            <g:if test="${session.authorities.contains('ROLE_SUPER') || session.authorities.contains('ROLE_ADMIN')}">
                <g:link controller="backoffice" class="list" action="index">Back Office</g:link>
            </g:if> 
          </div>
      </div>
      <div id="container" class="clearfix">
            <h1>Data Management Home</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                  <thead>
                  <tr>
                    <th>DM Areas</th>
                  </tr>
                  </thead>
                  <tr class="odd">
                    <td>
                      <span class="controller"><a href="/cdrlite/userLogin/">User Login History</a></span>
                    </td>
                  </tr>
                  <tr class="even">
                    <td>
                      <span class="controller"><a href="/cdrlite/formMetadata/list">BPV form data</a></span>
                    </td>
                  </tr>
                  <tr class="odd">
                    <td>
                      <span class="controller"><a href="/cdrlite/SOP/list">SOP's</a></span>
                    </td>
                  </tr>
                  <tr class="even">
                    <td>
                      <span class="controller"><a href="/cdrlite/sopVersion/list">SOP Version</a></span>
                    </td>
                  </tr> 
                  <!--
                  <tr class="odd">
                    <td>
                      <span class="controller"><a href="/cdrlite/">More cool features on the way!</a></span>
                    </td>
                  </tr>
                  -->
                  <tr class="odd">
                    <td>
                      <span class="controller"><a href="/cdrlite/accountStatus/acctStatus">Application Users Status Board</a></span>
                    </td>
                  </tr>
                  
                  <tr class="even">
                    <td>
                      <span class="controller"><a class="startLink" href="/cdrlite/helpFileUpload/create">Upload help guides for OBBR, GTEx or BPV</a></span>
                    </td>
                  </tr>
                  
                  <tr class="odd">
                    <td>
                      <span class="controller"><a class="startLink" href="/cdrlite/caseWithdraw/wd_cases">Cases Recalled</a></span>
                    </td>
                  </tr>
                  
                  <tr class="even">
                    <td>
                      <span class="controller"><a class="startLink" href="/cdrlite/query/list">Query Tracker</a></span>
                    </td>
                  </tr>

                  <tr class="odd">
                    <td>
                      <span class="controller"><a class="startLink" href="/cdrlite/deviation/list">Deviation List</a></span>
                    </td>
                  </tr>
                    <%--
                  <tr class="even">
                    <td>
                      <span class="controller"><a class="startLink" href="/cdrlite/prcUnaccReason/list">Reason For Unacceptable Tissues</a></span>
                    </td>
                  </tr>
                   --%>
                  <tr class="odd">
                    <td>
                      <span class="controller"><a class="startLink" href="/cdrlite/memo/list">Memo Management</a></span>
                    </td>
                  </tr>
                   
                  
                  <tr class="even">
                    <td>
                      <span class="controller"><a class="startLink" href="/cdrlite/home/vocabhome">Vocabulary</a></span>
                    </td>
                  </tr>
                  
                </table>
            </div>
        </div>
    </body>
</html>
