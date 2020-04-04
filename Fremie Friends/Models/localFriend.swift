import Foundation

struct localFriend {
    var localName: String
    var localBirthday: String
    var feedingInterval: String?
    var localType: String
}


enum localType {
    case kombucha
    case sourdough
    case kimchi
    case kefir
}
