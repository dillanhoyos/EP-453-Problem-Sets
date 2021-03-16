


class Weather {
    
    var high: Float
    let low: Float
    var prec: Float
    var wind: Float
    

    
    static var dif = "The weather difference between the two days is: "
    
 
   
  
    
    init(low: Float, high: Float, prec: Float, wind: Float){
        self.low = low
        self.high = high
        self.prec = prec
        self.wind = wind
        
          
    }
    
    convenience init(yesterday: String){
        self.init(low: 60, high: 80, prec: 20, wind: 10)
    }
 
    var today = Weather(low: 64, high: 76, prec: 10, wind: 11)
   
    
    
    
    
   
}
    




   
    
    


