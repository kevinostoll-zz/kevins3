<html>
<body>
<g:if test="${flash.message}">
<div class="message">${flash.message}</div>
</g:if>
<form action="save" method="post">
    <h1>Create Amazon S3 Bucket</h1>
    Name:
	<input type="text" name="bucketName"/><br/>
	<input type="submit" value="Create"/>
</form>
</body>
</html>
