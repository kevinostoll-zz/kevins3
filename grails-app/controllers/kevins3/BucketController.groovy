package kevins3


import com.amazonaws.auth.*
import com.amazonaws.services.s3.AmazonS3
import com.amazonaws.services.s3.AmazonS3Client

class BucketController {

  private static AmazonS3 s3;  
  private static String accessKey = "AKIAIMILBQ7FAKVPU7WQ";
  private static String secretKey = "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"
  

  def beforeInterceptor = {
    if (!s3) {
      s3 = new AmazonS3Client( new BasicAWSCredentials( accessKey, secretKey ) )
    }
  }

  def index = { redirect(action: "show" ) }  


  def list = {
	try {
	 [buckets:s3.listBuckets()] 
	} catch ( Exception e) { flash.message = e }
  }


  def create = { } // show GSP
  def save = {
    if (!s3.doesBucketExist(params.bucketName)) {
      s3.createBucket(params.bucketName);
      flash.message = "bucket ${params.bucketName} created"
    } else {
      flash.message = "bucket ${params.bucketName} already exists"
    }
    redirect(action: "list")
  }
  def show = { 
    redirect(controller:'bucketController', action: "list") 
  }
  def edit = {render "edit implemented"  }
  def update = {render "update not implemented" }
  def delete = {
    try {
    	s3.deleteBucket(params.bucketName)
        flash.message = "Bucket ${params.bucketName} deleted"
    } catch (Exception e) {flash.message = e }
    redirect(action: "list")
  }
}
