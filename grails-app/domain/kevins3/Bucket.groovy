package kevins3

class Bucket {
	String id
	String owner
	static hasMany = [bucketObjects:BucketObject]
    static mapping = {
        id generator:'assigned', column:'name', type:'string'
    }
    static constraints = {
    }
}
