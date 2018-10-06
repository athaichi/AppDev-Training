import UIKit

class Dog: NSObject {
    struct DogCellInfo {
        let name : String!
        let image : UIImage!
        let age : Int!
        let type : String!
    }
    
    static var NumberOfDogs : Int = 0
    static var DogsArr = [DogCellInfo] ()
    
    class func AddDog(name : String! ,image : UIImage ,age : Int! ,type : String!) -> Void {
        DogsArr.append(DogCellInfo(name: name, image: image, age: age, type: type))
        NumberOfDogs += 1
    }
}

