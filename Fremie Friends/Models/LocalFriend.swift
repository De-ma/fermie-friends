import Foundation

struct LocalFriend {
    var localName: String
    var localBirthday: String
    var feedingInterval: String?
    var localType: String
}

enum LocalType {
    case kombucha
    case sourdough(Feeding)
    case kimchi
    case kefir
    
    //func whatImageShouldIhave() -> UIImage? {
      //
   // }
}

struct Feeding {
    var time: TimeZone
    var hour: Int
}
