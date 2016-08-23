//
//  main.swift
//  TestProject
//
//  Created by Ma Levi on 8/2/16.
//  Copyright © 2016 Levi. All rights reserved.
//

import Foundation

print("Hello, World!")

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

//class Manufacturer {
//    var cars: [Car] = []
//}
//
//class SteeringWheel {
//    var manufacturer: Manufacturer?
//}
//
//class Car {
//    var steeringWheel: SteeringWheel?
//    
//}

enum Workout {
    case ForTime(second: Int)
    case ForReps(movements: [(name: String, reps:Int)])
}
var reps: [(name: String, reps:Int)]

func InsertionSort(inout array: [Int]) -> [Int]
{
    array[0] = 3
    print(array)
    return [0]
}

var testArr = [0, 2, 8, 1, 4, 6]

InsertionSort(&testArr)
print(testArr)






