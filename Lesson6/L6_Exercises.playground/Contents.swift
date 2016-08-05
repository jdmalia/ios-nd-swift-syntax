//: ## Lesson 6 Exercises - Classes, Properties and Methods

import UIKit

//: __Problem 1__
//:
//: __1a.__
//: The compiler is complaining because the class Animal has no initializers. Write an init method for the Animal class and quiet this error. Include a mechanism to initialize the length of the Animal's tail using the Tail struct provided.
struct Tail {
    let lengthInCm: Double
}

class Animal {
    var species: String = ""
    let tail: Tail
    
    init(species: String, tailLengthInCm: Double) {
        self.species = species
        self.tail = Tail(lengthInCm: tailLengthInCm)
    }
}
//: __1b.__
//: Instantiate and initialize a few different Animals.

//: __Problem 2__
//:
//: Below are the beginnings of the Peach class.
class Peach {
    let variety: String
    static let varieties = ["Geogia", "Florida"]
    
    // Softness is rated on a scale from 1 to 5, with 5 being the softest
    var softness: Int
    
    init(variety: String, softness: Int) {
        self.variety = variety
        self.softness = softness
    }
    
    func ripen() -> String {
        if self.softness < 5 {
            self.softness += 1
        }
        if self.softness == 5 {
            return "I'm ripe!"
        } else {
            return "Nope, not ripe yet :/"
        }
    }
}

var myPeach = Peach(variety: "Georgia", softness: 1)
myPeach.ripen()
myPeach.ripen()
myPeach.ripen()
myPeach.ripen()
//: __2a.__
//: Add a type property to the Peach class called "varieties". It should hold an array of different types of peaches.
//:
//: __2b.__
//: Add an instance method called ripen() that increases the value of the stored property, softness, and returns a string indicating whether the peach is ripe.
//:
//: __2c.__
//: Create an instance of the Peach class and call the method ripen().

//: __Problem 3__
//:
//: __3a.__
//:Add the computed property, "cuddlability", to the class, FluffyDog. Cuddlability should be computed based on the values of the stored properties, fluffiness and droolFactor.
// var theFluffiestDog = UIImage(named:"fluffyDog")!
class FluffyDog {
    let name: String
    let fluffiness: Int
    let droolFactor: Int
    var cuddlability : Int {
        get {
            return self.fluffiness - self.droolFactor
        }
    }
    
    init(name: String, fluffiness: Int, droolFactor: Int) {
        self.name = name
        self.fluffiness = fluffiness
        self.droolFactor = droolFactor
    }
    
    func chase(wheeledVehicle: String)-> String {
        return "Where are you going, \(wheeledVehicle)? Wait for me! No, don't go! I will catch you!"
    }
}
//: __3b.__
//: Instantiate and initialize an instance of the class, FluffyDog. Use it to call the method, chase().
var pacci = FluffyDog(name: "Pacci", fluffiness: 9, droolFactor: 3)
pacci.cuddlability
pacci.chase("truck")
//: __Problem 4__
//:
//: __4a.__
//: Write an instance method, bark(), that returns a different string based on the value of the stored property, size.
enum Size: Int {
    case Small
    case Medium
    case Large
}

class ChattyDog {
    let name: String
    let breed: String
    let size: Size
    
    init(name: String, breed: String, size: Size) {
        self.name = name
        self.breed = breed
        self.size = size
    }
    
    func bark() -> String {
        switch size {
        case .Small:
            return "woof"
        case .Medium:
            return "Woof woof!"
        case .Large:
            return "WOOF WOOF WOOF!"
        }
    }
    
    static func speak(size: Size) -> String {
        switch size {
        case .Small:
            return "woof"
        case .Medium:
            return "Woof woof!"
        case .Large:
            return "WOOF WOOF WOOF!"
        }
    }
}
//: __4b.__
//: Create an instance of ChattyDog and use it to call the method, bark().
var barker = ChattyDog(name: "Ralph", breed: "Yorkshire Terrier", size: .Small)
barker.bark()
ChattyDog.speak(.Medium)
ChattyDog.speak(.Large)
//: __4c.__
//: Rewrite the method, bark(), as a type method and rename it speak(). Call your type method to test it out.

//: __Problem 5__
//:
//:__5a.__
//: Write an initialization method for the House class below.
enum Quality {
    case Poor, Fair, Good, Excellent
}

enum NaturalDisaster {
    case Earthquake
    case Wildfire
    case Hurricane
}

class House {
    var numberOfBedrooms: Int = 0
    let location: Quality
    var worthyOfAnOffer: Bool {
        get {
            switch location {
            case .Excellent, .Good:
                return true
            case .Fair, .Poor:
                return false
            }
        }
    }
 
    func willStayStanding(naturalDisaster:NaturalDisaster)-> Bool {
        switch naturalDisaster {
        case .Earthquake:
            return true
        case .Wildfire:
            return true
        case .Hurricane:
            return false
        }
    }
    
    init(numberOfBedrooms: Int, location: Quality) {
        self.numberOfBedrooms = numberOfBedrooms
        self.location = location
    }
}

//: __5b.__
//: Create an instance of the House class and use it to call the method, willStayStanding().  This method takes in a parameter of type NaturalDisaster and return a Bool indicating whether the house will stay standing in a given natural disaster.
var myHouse = House(numberOfBedrooms: 5, location: .Excellent)
var notAWinner = House(numberOfBedrooms: 1, location: .Poor)
myHouse.willStayStanding(.Earthquake)
//: __5c.__
//: Add a computed property called, "worthyOfAnOffer". This property should be a Bool, whose return value is dependent upon some combination of the stored properties, numberOfBedrooms and location.
myHouse.worthyOfAnOffer
notAWinner.worthyOfAnOffer





