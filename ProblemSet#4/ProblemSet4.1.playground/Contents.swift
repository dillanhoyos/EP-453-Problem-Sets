import UIKit

var num = 89

var width = 5

var mid = num - width

var nm = 0




while num > 0{
    
    print("*", terminator:"")
    
   nm += 1
    if nm == width{
        print("\n")
        nm -= width
    }
   
  num -= 1
    
}


