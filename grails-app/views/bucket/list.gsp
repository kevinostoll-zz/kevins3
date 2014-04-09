
<%@ page import="kevins3.Bucket" %>
<!DOCTYPE html>
<html>
        <head>
                <meta name="layout" content="main">
                <g:set var="entityName" value="${message(code: 'bucket.label', default: 'Bucket')}" />
                <title><g:message code="default.show.label" args="[entityName]" /></title>
        </head>
        <body>
                <a href="#show-bucket" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                        <ul>
                                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                                <li><g:link class="list" action="index" id="${params.bucketName}"  ><g:message code="default.list.label" args="[entityName]" /></g:link></li>
                                <li><g:link class="create" action="create" ><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                        </ul>
                </div>

<table>
<thead><tr><th>id</th><th>Create Date</th><tr></thead>
<tbody>
<g:each in="${buckets}" status="i" var="bucket">
  <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
    <td><g:link action="list" controller="bucketObject" id="${bucket.name}">${bucket.name}</g:link>
    </td>
    <td>${bucket.creationDate}</td>
  </tr>
</g:each>
</tbody>
</table>

</body>
</html>
