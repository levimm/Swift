//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/* Test for switch fallthrough and break */
var name = "Amy"
switch name {
case let x where x.hasPrefix("A"):
    print("\(name) will be invited first")
    fallthrough
case "Macros", "Amy":
    print("\(name) is an honor guest")
    // fallthrough
default:
    print("\(name) is someone else")
}

//
let showsByGenre = ["comedy": "Modern Family"]

/* Test for strong reference cycle */
class SteeringWheel {
    //weak var car: Car?
    var car: Car?
}
class Car {
    var steeringWheel: SteeringWheel
    init(steeringWheel: SteeringWheel) {
        self.steeringWheel = steeringWheel
        self.steeringWheel.car = self
    }
    func toString() -> String {
        return "A car"
    }
}

var steer = SteeringWheel()
if (true) {
    var car = Car(steeringWheel: steer)
}
print(steer.car)
