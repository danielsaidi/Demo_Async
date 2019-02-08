//
//  ViewController_3_batches.swift
//  Demo_Async
//
//  Created by Daniel Saidi on 2019-02-08.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

extension ViewController {
    
    func performOperation_batches() {
        let items = DemoSyncItem.create(5)
        let operation = DemoBatchOperation(vc: self)
        operation.perform(on: items) { [weak self] errors in
            let errors = errors.compactMap { $0 }
            self?.textView.text += "Finished with \(errors.count) errors"
        }
    }
}


private class DemoBatchOperation: DemoOperation, ConcurrentBatchOperation /*SerialBatchOperation*/ {
    
    var batchSize: Int = 2
    typealias CollectionType = DemoSyncItem
    
    func perform(onBatch batch: [DemoSyncItem], completion: @escaping BatchCompletion) {
        // Sync in some way, here just perform the same as before
        perform { (error) in
            completion(error)
        }
    }
}
