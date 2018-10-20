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
    
    class func loadCats(completion : @escaping (Array<Dictionary<String,String>>) -> Void) -> Void {
        let url = URL(string: "http://chenziwe.com/cats")
        let session = URLSession (configuration: .default)
        var request = URLRequest (url: url!)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) { (data, response, error) in
            if (error != nil) {
                print("Failed to load dogs :(")
                return
            }
            print("Got cats (should be dogs but aren't)!")
            let result = try? JSONSerialization.jsonObject(with: data!, options: []) as! Array<Dictionary<String,String>>
            
            completion(result!)
        }
        task.resume()
    }
}

