import UIKit

var instrumentName = "Guitar"
var instrumentClass = "String"

instrumentName = "Classical " + instrumentName

var frequency = 440.0


var div = frequency/440.0

var midi = 69 + 12*log2(div)

var isPlaying = true

print(instrumentName,"is a", instrumentClass, "instrument and is currently Playing MIDI note", midi,":", isPlaying)


 
