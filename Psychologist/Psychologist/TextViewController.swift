//
//  TextViewController.swift
//  Psychologist
//
//  Created by Ma Levi on 2/14/16.
//  Copyright © 2016 Levi. All rights reserved.
//

import UIKit

class TextViewController: UIViewController
{
    
    @IBOutlet weak var textView: UITextView!
    {
        didSet
        {
            textView.text = text
        }
    }
    
    var text: String = ""
    {
        didSet
        {
            textView?.text = text
        }
    }
    
    override var preferredContentSize:CGSize
    {
        get
        {
            if textView != nil && presentedViewController != nil
            {
                return textView.sizeThatFits(presentedViewController!.view.bounds.size)
            }
            else
            {
                return super.preferredContentSize
            }
        }
        set { super.preferredContentSize = newValue }
    }
}
