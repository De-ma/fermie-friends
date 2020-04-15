import Foundation

struct localFriend {
    var localName: String
    var localBirthday: String
    var feedingInterval: String?
    var localType: String
}


enum localType {
    case kombucha
    case sourdough(Feeding)
    case kimchi
    case kefir
}

struct Feeding {
    var time: TimeZone
    var hour: Int
//    var
}
