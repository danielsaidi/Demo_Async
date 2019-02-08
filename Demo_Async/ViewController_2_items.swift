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
        let items = DemoSyncItem.create(5)
        let operation = DemoItemOperation(vc: self)
        operation.perform(on: items) { [weak self] errors in
            let errors = errors.compactMap { $0 }
            self?.textView.text += "Finished with \(errors.count) errors"
        }
    }
}


private class DemoItemOperation: DemoOperation, ConcurrentItemOperation /*SerialItemOperation*/ {
    
    typealias CollectionType = DemoSyncItem
    
    func perform(onItem item: DemoSyncItem, completion: @escaping ItemCompletion) {
        // Sync in some way, here just perform the same as before
        perform { (error) in
            completion(error)
        }
    }
}
