//
//  HappinessViewController.swift
//  Happiness
//
//  Created by Ma Levi on 12/28/15.
//  Copyright © 2015 Levi. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController, faceViewDataSource
{
    var happiness: Int = 0
    {
        didSet
        {
            happiness = min(max(happiness, 0), 100)
            print("happiness = \(happiness)")
            updateUI()
        }
    }
    private struct Constants
    {
        static let HappinessGestureScale: CGFloat = 4
    }
    @IBAction func changeHappiness(gesture: UIPanGestureRecognizer)
    {
        switch gesture.state
        {
        case .Ended: fallthrough
        case .Changed:
            let translation = gesture.translationInView(faceView)
            let happinessChange = -Int(translation.y / Constants.HappinessGestureScale)
            if happinessChange != 0
            {
                happiness += happinessChange
                gesture.setTranslation(CGPointZero, inView: faceView)
            }
        default: break
        }
    }
    
    @IBOutlet weak var faceView: FaceView!
    {
        didSet
        {
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:")) // colon means has arguments
//            set up the gesture in the story board
//            faceView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: "changeHappiness"))
        }
    }
    
    func updateUI()
    {
        faceView?.setNeedsDisplay()
        title = "\(happiness)"
    }
    
    func smilnessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness - 50) / 50
    }
}
