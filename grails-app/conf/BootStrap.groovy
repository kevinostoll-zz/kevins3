import kevins3.*

class BootStrap {
  def init = { servletContext ->


    def bucketObject1 = new BucketObject( lastModified:new Date(), contentType:'text/plain',contentLength:12)
    bucketObject1.id = 'key1'
    bucketObject1.save()

    def bucketObject2 = new BucketObject(lastModified:new Date(), contentType:'text/plain',contentLength:12) 
    bucketObject2.id = 'key2'
    bucketObject2.save()
    
    def bucket = new Bucket(id:'one', owner:'me')
    bucket.id = 'one'
    bucket.save()

    bucket.addToBucketObjects(bucketObject1)
    bucket.addToBucketObjects(bucketObject2)

    bucket = new Bucket(id:'one', owner:'me')
    bucket.id = 'two'
    bucket.save()

  }
  def destroy = {}
} 
