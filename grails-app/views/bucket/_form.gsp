<%@ page import="kevins3.Bucket" %>



<div class="fieldcontain ${hasErrors(bean: bucketInstance, field: 'bucketObjects', 'error')} ">
	<label for="bucketObjects">
		<g:message code="bucket.bucketObjects.label" default="Bucket Objects" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${bucketInstance?.bucketObjects?}" var="b">
    <li><g:link controller="bucketObject" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="bucketObject" action="create" params="['bucket.id': bucketInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'bucketObject.label', default: 'BucketObject')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: bucketInstance, field: 'owner', 'error')} ">
	<label for="owner">
		<g:message code="bucket.owner.label" default="Owner" />
		
	</label>
	<g:textField name="owner" value="${bucketInstance?.owner}"/>

</div>

