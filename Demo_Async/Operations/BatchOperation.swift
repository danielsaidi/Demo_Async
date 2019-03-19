/*
 
 A batch operation can be performed on batches of items of a
 certain type.
 
 When implementing this protocol, specify `OperationItemType`
 by creating a typealias in your implementation.
 
 */

import Foundation

public protocol BatchOperation: OperationItemTypeProvider {
    
    typealias BatchCompletion = (Error?) -> ()
    
    func perform(onBatch batch: [OperationItemType], completion: @escaping BatchCompletion)
}
