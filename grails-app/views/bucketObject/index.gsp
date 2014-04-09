
<%@ page import="kevins3.BucketObject" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bucketObject.label', default: 'BucketObject')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-bucketObject" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>

<div class="list">
  <table>
  <thead><tr><th>id</th>
  <th>last modified</th><th>content type</th
  ><th>content length</th><th>Download</th>
  </tr></thead>
  <tbody>
  <g:each in="${bucketObjectsSummaries}" status="i" var="bucketObj">
    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
      <td><g:link action="show" 
      params="[bucketName:bucketObj.bucketName,key:bucketObj.key]">
      ${bucketObj.key}</g:link></td>
      <td>${bucketObj.lastModified}</td>
      <td>${metadataList[i]['Content-Type']}</td>
      <td>${metadataList[i]['Content-Length']}</td>
      <td><g:link action="download" 
      params="[bucketName:bucketObj.bucketName,key:bucketObj.key]">
      download</g:link></td>
    </tr>
  </g:each>
   
  </tbody>
  </table>
</div>
<div class="buttons">
<g:form action="delete" controller="bucket" method="post">
  <g:hiddenField name="bucketName" value="${bucketName}" />
  <span class="button"><g:submitButton class="delete" 
      name="delete" value="Delete Entire Bucket" 
      onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
</g:form>
</div>
<% if (flash.page) { %>
<div class="paginateButtons">
  <a href="/s3browser/bucketObject/list/${bucketName}" class="prevLink">First</a>
  Page: ${flash.page}
  <% if (flash.bucketObjects) { %>
    <a href="/s3browser/bucketObject/list/${bucketName}?page=next" class="prevLink">Next</a>
  <% } %>
</div>
<% } %>


		</div>
	</body>
</html>
