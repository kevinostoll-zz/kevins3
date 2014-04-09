package kevins3



class BucketObject {
	String id
	Date	lastModified
	String contentType
	int	contentLength
	static belongsTo = [bucket:Bucket]
    static mapping = {
        id generator:'assigned', column:'key', type:'string'
    }
    static constraints = {
    }
}
