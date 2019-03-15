//
//  DemoItemOperation.swift
//  Demo_Async
//
//  Created by Daniel Saidi on 2019-02-10.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation

class DemoItemOperation: DemoOperation, SerialItemOperation {
    
    init(printer: Printer) {
        super.init(name: "Item Operation", printer: printer)
    }
    
    typealias CollectionType = DemoItem
    
    func perform(onItem item: DemoItem, completion: @escaping ItemCompletion) {
        perform { (error) in
            completion(error)
        }
    }
}
