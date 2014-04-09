<%@ page import="kevins3.BucketObject" %>



<div class="fieldcontain ${hasErrors(bean: bucketObjectInstance, field: 'bucket', 'error')} required">
	<label for="bucket">
		<g:message code="bucketObject.bucket.label" default="Bucket" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="bucket" name="bucket.id" from="${kevins3.Bucket.list()}" optionKey="id" required="" value="${bucketObjectInstance?.bucket?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bucketObjectInstance, field: 'contentLength', 'error')} required">
	<label for="contentLength">
		<g:message code="bucketObject.contentLength.label" default="Content Length" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="contentLength" type="number" value="${bucketObjectInstance.contentLength}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: bucketObjectInstance, field: 'contentType', 'error')} ">
	<label for="contentType">
		<g:message code="bucketObject.contentType.label" default="Content Type" />
		
	</label>
	<g:textField name="contentType" value="${bucketObjectInstance?.contentType}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bucketObjectInstance, field: 'lastModified', 'error')} required">
	<label for="lastModified">
		<g:message code="bucketObject.lastModified.label" default="Last Modified" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="lastModified" precision="day"  value="${bucketObjectInstance?.lastModified}"  />

</div>

