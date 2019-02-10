//
//  ViewController.swift
//  Demo_Async
//
//  Created by Daniel Saidi on 2019-02-06.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.text = ""
            textView.layer.cornerRadius = 10
        }
    }
    
    @IBAction func performOperation(_ sender: Any) {
        textView.text = ""
//        performOperation_coordinator()
//        performOperation_items()
//        performOperation_batches()
    }
    
    func print(_ text: String) {
        textView.text += "\(text)\n"
    }
}
