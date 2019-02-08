//
//  SerialOperationCoordinator_old.swift
//  Demo_Async
//
//  Created by Daniel Saidi on 2019-01-29.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This class implements `OperationCoordinator` as well as the
 `SerialItemOperation` protocol.
 
 This coordinator performs a set of operations in serial. It
 can be used either directly or as an internal tool in other
 classes, e.g. data syncers, to hide the "operation" concept
 from their external apis.
 
 */

class SerialOperationCoordinator_old: OperationCoordinator {
    
    func perform(_ operations: [Operation], completion: @escaping Completion) {
        performOperation(at: 0, in: operations, errors: [], completion: completion)
    }
    
    private func performOperation(at index: Int, in operations: [Operation], errors: [Error?], completion: @escaping Completion) {
        guard operations.count > index else { return completion(errors) }
        let operation = operations[index]
        operation.perform { (error) in
            let errors = errors + [error]
            self.performOperation(at: index + 1, in: operations, errors: errors, completion: completion)
        }
    }
}
