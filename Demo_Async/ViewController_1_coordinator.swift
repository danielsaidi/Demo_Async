//
//  ViewController_1_operations.swift
//  Demo_Async
//
//  Created by Daniel Saidi on 2019-02-08.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

extension ViewController {
    
    func performOperation_coordinator() {
        let operations = DemoOperation.create(5, vc: self)
        let coordinator = ConcurrentOperationCoordinator() // SerialOperationCoordinator()
        coordinator.perform(operations) { [weak self] errors in
            let errors = errors.compactMap { $0 }
            self?.textView.text += "Finished with \(errors.count) errors"
        }
    }
}
