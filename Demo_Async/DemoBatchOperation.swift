//
//  DemoBatchOperation.swift
//  Demo_Async
//
//  Created by Daniel Saidi on 2019-02-10.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

class DemoBatchOperation: DemoOperation, SerialCollectionBatchOperation {
    
    init(printer: Printer) {
        super.init(name: "Batch Operation", printer: printer)
    }
    
    var batchSize: Int = 2
    typealias OperationItemType = DemoItem
    
    func perform(onBatch batch: [DemoItem], completion: @escaping BatchCompletion) {
        perform { (error) in
            completion(error)
        }
    }
}
