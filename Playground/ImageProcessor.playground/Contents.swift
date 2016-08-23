//: Playground - noun: a place where people can play

import UIKit

let image = UIImage(named: "sample")!

// Process the image!
var myRGBA = RGBAImage(image: image)!

let x = 10
let y = 20

let index = y * myRGBA.width + x
var pixel = myRGBA.pixels[index]

pixel.red = 0
pixel.green = 0
pixel.blue = 0
//pixel.value

myRGBA.pixels[index] = pixel
let newImage = myRGBA.toUIImage()

// compute average
//var totalRed = 0
//var totalGreen = 0
//var totalBlue = 0
//
//for y in 0..<myRGBA.height {
//    for x in 0..<myRGBA.width {
//        let index = y * myRGBA.width + x
//        var pixel = myRGBA.pixels[index]
//        totalRed += Int(pixel.red)
//        totalGreen += Int(pixel.green)
//        totalBlue += Int(pixel.blue)
//    }
//}
//
//let count = myRGBA.height * myRGBA.width
//let avgRed = totalRed / count
//let avgGreen = totalGreen / count
//let avgBlue = totalBlue / count

let avgRed = 118
let avgGreen = 98
let avgBlue = 83

for y in 0..<myRGBA.height {
    for x in 0..<myRGBA.width {
        var index = y * myRGBA.width + x
        var pixel = myRGBA.pixels[index]
        let redDiff = Int(pixel.red) - avgRed
        if redDiff > 0 {
            pixel.red = UInt8(max(0, min(255, avgRed + 5 * redDiff)))
            myRGBA.pixels[index] = pixel
        }
    }
}

let newUIImage2 = myRGBA.toUIImage()




