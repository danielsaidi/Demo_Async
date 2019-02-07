//
//  ConcurrentOperationCoordinator.swift
//  Demo_Async
//
//  Created by Daniel Saidi on 2019-01-29.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This class implements `OperationCoordinator` as well as the
 `ConcurrentItemOperation` protocol.
 
 This coordinator performs operations concurrently. It could
 be used either directly or as an internal tool in any other
 classes, e.g. data syncers, to hide the "operation" concept
 from their external apis.
 
 */

class ConcurrentOperationCoordinator: OperationCoordinator {
    
    func perform(_ operations: [Operation], completion: @escaping Completion) {
        guard operations.count > 0 else { return completion([]) }
        var errors = [Error?]()
        operations.forEach {
            $0.perform { error in
                errors.append(error)
                let isComplete = errors.count == operations.count
                guard isComplete else { return }
                completion(errors)
            }
        }
    }
}
