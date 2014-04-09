
<%@ page import="kevins3.BucketObject" %>
<!DOCTYPE html>
<html>
        <head>
                <meta name="layout" content="main">
                <g:set var="entityName" value="${message(code: 'bucketObject.label', default: 'BucketObject')}" />
                <title><g:message code="default.show.label" args="[entityName]" /></title>
<script>
	function setS3BucketObjectKey() {
		document.getElementById('key').value = 
		         document.getElementById('file').value;
		return true;
	}
</script>
        </head>
        <body>
                <a href="#show-bucketObject" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation">
                        <ul>
                                <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
                        </ul>
                </div>

<form action="https://${params.id}.s3.amazonaws.com"  
      method="post" enctype="multipart/form-data"
	  onsubmit="setS3BucketObjectKey();" >
  <input type="hidden" name="key" id="key"/>
  <input type="hidden" name="AWSAccessKeyId" 
                        value="${awsAccessKeyId}"/>
  <input type="hidden" name="acl" value="private"/> 
  <input type="hidden" name="success_action_redirect" 
      value="${(g.resource(dir: '/',absolute:'true')+'bucketObject/list/'+params.id)}"/>
  <input type="hidden" name="policy" value="${policy}"/>
  <input type="hidden" name="signature" value="${signature}"/>
  <input type="hidden" name="Content-Type" value="text/plain"/>
  <h1>Amazon S3 Bucket: ${params.id}</h1>
  Select file to upload:
  <input type="file" name="file" id="file"/><br/>
  <input type="submit" value="Upload"/>
</form>
</body>
</html>
