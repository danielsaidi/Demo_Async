import Demo_Async

class MockOperationCoordinator: OperationCoordinator {
    
    var performErrors = [Error]()
    var performInvokeCount = 0
    var performInvokeOperations = [[Operation]]()
    var performInvokeCompletions = [MultiOperationCompletion]()
    
    func perform(_ operations: [Operation], completion: @escaping MultiOperationCompletion) {
        performInvokeCount += 1
        performInvokeOperations.append(operations)
        performInvokeCompletions.append(completion)
        completion(performErrors)
    }
}
