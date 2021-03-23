
enum Genre{
    case Reggae
    case Rock
    case Pop
    
}

enum Genre2{
    case Classical, HipHop, Jazz
}

var genre = Genre.Pop
print(genre, genre.hashValue)

enum Key: String {
    case Cmaj = "C Major"
    case Cmin = "C minor"
}

var key = Key.Cmaj
print(key)

//Enum Associated values
enum PlayState{
    case Playing
    case Stopped(restart: Int)
    case Unknown(debug: String)
    
}

var currentState = PlayState.Stopped(restart: 0)
var debugState = PlayState.Unknown(debug: "we don't know")

switch currentState{
case .Playing:
    print("Playing")
case .Stopped (let restart):
    print("Stopped playing. Start from meassure\(restart)")

case .Unknown(let debug):
    print("Not quite sure what's going on: \(debug)")
}
//Protocol -> template of properties and functionalities
// that can be conformed to y either a class or struct
// When calss or struct implements a protocol, they are followinng the rules set by the protocol

//Define protocol
protocol Playable{
  //  at least needs on getter (read-only
    var name : String{get}
    var type: String {get set} //getter annd setterr
    func createPlayable() -> String
}
//Extend the Protocol
extension Playable{
    func createPlayable() -> String {
        return"\(name):\(type)"
    }
}
//create struct with protocol
struct Instrument: Playable{
    var name: String
    
    var type: String
    
    func createPlayable() -> String {//override
        return"\(name) is a type of\(type)"
        
    }
}
let instrument = Instrument(name: "Guitar", type: "String")

print(instrument.createPlayable())

