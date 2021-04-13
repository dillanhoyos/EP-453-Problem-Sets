//COllections:
//Array, Dictionary, Set, Tuple

//Array:Initialization

var arr: Array<String> = []
var arr2 = Array<String>()
var arr3 = [Double]()
var arr4: [Int] = []

//Type inference
var genres = ["Reggae", "Rock", "Pop"]

//Properties of Array
genres.count //how many elements in the array?
genres.isEmpty

//Accessing values in the array
var genre = genres[0]
//let -> Constant, it means we cant change it

for genre in genres {
    print(genre)
}

for (index, genre) in genres.enumerated(){
    print("\(index) -> \(genre)")
}
genres[1] = "EDM"
print(genres)
genres.append("Country")
print(genres)
genres += ["Jazz", "Classical"]
print(genres)



// Insert and removinng elements
genres.insert("Hip Hop", at: 2)
print(genres)
genres.remove(at: 1)
print(genres)

genres.contains("Classical")

var artists: [[String]] = [
    ["Orange Goblinn", "DeadBoys Girlfriend"],
    ["Bungaro", "Dead Boys Girlfriend"],
    ["Orange Goblin", "Dead Boys Girlfriend"]
]

var artist = artists [0][1]

//------Dictionary
//Related arra. In array we access eacj element usinng their indecies.
// In dictionary, we acces each element using"Key"
    
//Declare dictionary
//<Key, Value>
var dict: Dictionary<String, Int> = [:]
var dict2 = Dictionary<Int, String>()
var dict3 = [String:String]()
var dict4: [String: String] = [:]

//Type inference
var album = ["Bjarne Nerem" : "This Is Always", "Cozy Cole":"Soft","Cleo Laine":"Little Boat"]

album.count
album.isEmpty

//Key and values
var keys = album.keys
var values = album.values
print(keys, values)

var a = album["Bjarne Nerem"]
print(a)

for (key, value) in album{
    print(key,":", value)
}



