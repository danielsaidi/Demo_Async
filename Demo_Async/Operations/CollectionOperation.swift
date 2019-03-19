/*
 
 A collection operation can be performed on item collections
 of a certain type.
 
 When implementing this protocol, specify `OperationItemType`
 by creating a typealias in your implementation.
 
 */

import Foundation

public protocol CollectionOperation: OperationItemTypeProvider {
    
    typealias CollectionCompletion = ([Error]) -> ()
    
    func perform(onCollection collection: [OperationItemType], completion: @escaping CollectionCompletion)
}
