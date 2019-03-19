/*
 
 An item operation can be performed on individual items of a
 certain type.
 
 When implementing this protocol, specify `OperationItemType`
 by creating a typealias in your implementation.
 
 */

import Foundation

public protocol ItemOperation: OperationItemTypeProvider {
    
    typealias ItemCompletion = (Error?) -> ()
    
    func perform(onItem item: OperationItemType, completion: @escaping ItemCompletion)
}
