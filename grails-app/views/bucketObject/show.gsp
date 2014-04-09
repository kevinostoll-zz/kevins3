
<%@ page import="kevins3.BucketObject" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'bucketObject.label', default: 'BucketObject')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-bucketObject" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index" id="${params.bucketName}"  ><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create" id="${params.bucketName}" ><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>

<div class="body">
  <h3>Bucket: ${params.bucketName} Key: ${params.key}</h3>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <g:if test="${(meta['Content-Length'] > params.max)}">
    <div class="paginateButtons">
      <g:paginate total="${(meta['Content-Length'])}" 
        max="10000" params="${params}"/>              
    </div>
  </g:if>
  <div style="width:1024px">
    <pre>${text}</pre>
  </div>
  <div class="buttons">
    <g:form>
      <g:hiddenField name="bucketName" value="${params.bucketName}" />
      <g:hiddenField name="key" value="${params.key}" />
      <span class="button"><g:actionSubmit class="delete" 
       action="delete" 
       value="${message(code: 'default.button.delete.label', default: 'Delete')}" 
       onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
      </span>
    </g:form>
  </div>
</div>

	</body>
</html>
