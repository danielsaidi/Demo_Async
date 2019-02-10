//
//  DemoItemOperation.swift
//  Demo_Async
//
//  Created by Daniel Saidi on 2019-02-10.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation

class DemoItemOperation: DemoOperation, ConcurrentItemOperation /*SerialItemOperation*/ {
    
    typealias CollectionType = DemoItem
    
    func perform(onItem item: DemoItem, completion: @escaping ItemCompletion) {
        // Sync in some way, here just perform the same as before
        perform { (error) in
            completion(error)
        }
    }
}
