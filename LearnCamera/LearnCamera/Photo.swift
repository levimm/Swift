//
//  Photo.swift
//  LearnCamera
//
//  Created by Ma Levi on 8/14/16.
//  Copyright © 2016 Levi. All rights reserved.
//

import Foundation
import UIKit

struct Photo {
    let image: UIImage
    let label: String
    
    init(image: UIImage, label: String) {
        self.image = image
        self.label = label
    }
    
    init?(filePath: NSURL) {
        if let image = UIImage(contentsOfFile: filePath.relativePath!) {
            let label = filePath.URLByDeletingPathExtension?.lastPathComponent ?? ""
            self.init(image: image, label: label)
        } else {
            return nil
        }
    }
    
    enum Error: String, ErrorType {
        case CouldntGetImageData = "Couldn't get data from image"
        case CouldntWriteImageData = "Couldn't write image data"
    }
    
    func saveToDirectory(directory: NSURL) throws {
        let timeStamp = "\(NSDate().timeIntervalSince1970)"
        let fullDirectory = directory.URLByAppendingPathComponent(timeStamp)
        try NSFileManager.defaultManager().createDirectoryAtURL(fullDirectory, withIntermediateDirectories: true, attributes: nil)
        let fileName = "\(self.label).jpg"
        let filePath = fullDirectory.URLByAppendingPathComponent(fileName)
        
        if let data = UIImageJPEGRepresentation(self.image, 1) {
            if !data.writeToURL(filePath, atomically: true) {
                throw Error.CouldntWriteImageData
            }
        } else {
            throw Error.CouldntGetImageData
        }
    }
}
