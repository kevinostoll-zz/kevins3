package kevins3

import com.amazonaws.auth.*
import com.amazonaws.services.s3.AmazonS3
import com.amazonaws.services.s3.AmazonS3Client
import com.amazonaws.services.s3.model.GetObjectRequest
import com.amazonaws.services.s3.model.ObjectMetadata
import com.amazonaws.services.s3.model.ListObjectsRequest

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;


class BucketObjectController {
  private static AmazonS3 s3;
  private static String accessKey = "AKIAIMILBQ7FAKVPU7WQ";
  private static String secretKey = "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"
  private static BasicAWSCredentials awsCreds = null;


  def beforeInterceptor = {
      awsCreds =  new BasicAWSCredentials( accessKey, secretKey ) 
    if (!s3) {
      s3 = new AmazonS3Client( awsCreds )
    }
  }

  def index = { redirect(action: "show" ) }

  def list = {
    params.max = Math.min(params.max ? params.int('max') : 5, 100)
    def bucketObjects
    if (flash.bucketObjects && params.page == 'next') {
      bucketObjects = s3.listNextBatchOfObjects(flash.bucketObjects)
      flash.page += 1
    } else {
      def lstObjReq = new ListObjectsRequest()
      lstObjReq.setBucketName(params.id)
      lstObjReq.setMaxKeys(params.max)
      bucketObjects = s3.listObjects(lstObjReq)
      flash.page = bucketObjects?.isTruncated()?1:0
    }
    if (bucketObjects?.isTruncated() ) {
      flash.bucketObjects = bucketObjects 
    } else {
      flash.bucketObjects = null
    }
    def bucketObjectsSummaries = bucketObjects?.objectSummaries
    def metadataList = []
    bucketObjectsSummaries.each {bos ->
      metadataList << 
           s3.getObjectMetadata(bucketObjects.bucketName, bos.key).metadata
    }
    [bucketName:params.id, 
     bucketObjectsSummaries:bucketObjectsSummaries, 
     metadataList:metadataList]
  }

  def create = {
    def now = new Date()+1
    def policy = 
     """{"expiration": "${now.format('yyyy-MM-dd')}T${now.format( 'hh:mm:ss')}Z", "conditions":
      [ 
       {"bucket": "$params.id"}, 
       ["starts-with", "\$key", ""],
       {"acl": "private"},
       {"success_action_redirect": "${g.resource(dir: '/',
        absolute:'true')}bucketObject/list/${params.id}"},
       ["starts-with", "\$Content-Type", ""],
       ["content-length-range", 0, 1048576]
     ]
    }""".replaceAll("\n","").replaceAll("\r","")
     .getBytes("UTF-8").encodeBase64().toString()
    Mac hmac = Mac.getInstance("HmacSHA1")
    hmac.init(new SecretKeySpec(awsCreds.getAWSSecretKey()
                .getBytes("UTF-8"), "HmacSHA1"));
    String signature = hmac.doFinal(policy.getBytes("UTF-8"))
                              .encodeBase64().toString()
    [policy:policy, signature:signature, params:params,
     awsAccessKeyId:awsCreds.AWSAccessKeyId]
  }

  def save = {
//    if (!s3.doesBucketExist(params.bucketName)) {
//	s3.putObject(new PutObjectRequest( params.bucketName, timeFormat.format(new Date()), new File( params.file ) )
//      flash.message = "bucket ${params.bucketName} created"
//
//    } else {
//      flash.message = "bucket ${params.bucketName} already exists"
//    }
//    redirect(action: "list")
  }


  def show = {
    params.max = params.max ? params.int('max') : 10000
    params.offset = params.offset ? params.int('offset'):0
    
    ObjectMetadata meta = s3.getObjectMetadata(params.bucketName, params.key)
    GetObjectRequest getObjReq = new GetObjectRequest(params.bucketName, params.key)
    getObjReq.withRange(params.offset, params.max+params.offset)

    [text:s3.getObject(getObjReq).objectContent.text,meta:meta.metadata, params:params]
  }
  def download = {  
    response.contentType = "application/octet-stream"
    response.outputStream <<
         s3.getObject(params.bucketName, params.key).objectContent
  }
  def edit = {render "edit not implemented"  }
  def update = {render "update not implented" }
  def delete = {
    s3.deleteObject(params.bucketName, params.key)
    flash.message = "bucket: $params.bucketName key: $params.key deleted."
    redirect(action: "list", id:params.bucketName)
  }
}
