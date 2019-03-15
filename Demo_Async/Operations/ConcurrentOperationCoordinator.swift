//
//  ConcurrentOperationCoordinator_old.swift
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

public class ConcurrentOperationCoordinator: OperationCoordinator, ConcurrentItemOperation {
    
    public init() {}
    
    public typealias CollectionType = Operation
    
    public func perform(_ operations: [Operation], completion: @escaping Completion) {
        perform(on: operations, completion: completion)
    }
    
    public func perform(onItem item: Operation, completion: @escaping ItemCompletion) {
        item.perform(completion: completion)
    }
}
