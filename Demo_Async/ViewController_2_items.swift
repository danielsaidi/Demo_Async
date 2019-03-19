//
//  ViewController_2_items.swift
//  Demo_Async
//
//  Created by Daniel Saidi on 2019-02-08.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

extension ViewController {
    
    func performOperation_items() {
        let items = createItems(5)
        let operation = DemoItemOperation(printer: self)
        operation.perform(onCollection: items) { [weak self] errors in
            let errors = errors.compactMap { $0 }
            self?.textView.text += "Finished with \(errors.count) errors"
        }
    }
}
