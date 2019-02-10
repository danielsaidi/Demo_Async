//
//  DemoBatchOperation.swift
//  Demo_Async
//
//  Created by Daniel Saidi on 2019-02-10.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

class DemoBatchOperation: DemoOperation, ConcurrentBatchOperation /*SerialBatchOperation*/ {
    
    init(vc: ViewController) {
        super.init(name: "Batch Operation", vc: vc)
    }
    
    var batchSize: Int = 2
    typealias CollectionType = DemoItem
    
    func perform(onBatch batch: [DemoItem], completion: @escaping BatchCompletion) {
        perform { (error) in
            completion(error)
        }
    }
}
