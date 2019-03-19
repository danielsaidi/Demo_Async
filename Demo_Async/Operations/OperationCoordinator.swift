/*
 
 An operation coordinator can be used to coordinate how many
 operations are performed.
 
 */

import Foundation

public protocol OperationCoordinator {
    
    typealias MultiOperationCompletion = ([Error]) -> ()
    
    func perform(_ operations: [Operation], completion: @escaping MultiOperationCompletion)
}
