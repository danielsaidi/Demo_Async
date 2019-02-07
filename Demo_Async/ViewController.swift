//
//  ViewController.swift
//  Demo_Async
//
//  Created by Daniel Saidi on 2019-02-06.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.text = ""
            textView.layer.cornerRadius = 10
        }
    }
    
    
//    func getOperations(_ count: Int) -> [DemoOperation] {
//        return (0..<count).map { _ in
//            DemoOperation(vc: self)
//        }
//    }
    
    
    @IBAction func performOperation(_ sender: Any) {
//        performOperation_coordinators()
//        performOperation_items()
//        performOperation_batches()
//        performOperation_improvedCoordinators()
    }
    
//    func performOperation_coordinators() {
//        let operations = getOperations(5)
//        let coordinator = ConcurrentOperationCoordinator() // SerialOperationCoordinator()
//        coordinator.perform(operations) { [weak self] errors in
//            let errors = errors.compactMap { $0 }
//            self?.textView.text += "Finished with \(errors.count) errors"
//        }
//    }
    
//    func performOperation_items() {
//        let operations = getOperations(5)
//        let operation = DemoItemOperation()
//        operation.perform(on: operations) { [weak self] errors in
//            let errors = errors.compactMap { $0 }
//            self?.textView.text += "Finished with \(errors.count) errors"
//        }
//    }
    
//    func performOperation_batches() {
//        let operations = getOperations(5)
//        let operation = DemoBatchOperation()
//        operation.perform(on: operations) { [weak self] errors in
//            let errors = errors.compactMap { $0 }
//            self?.textView.text += "Finished with \(errors.count) errors"
//        }
//    }
    
//    func performOperation_improvedCoordinators() {
//        let operations = getOperations(5)
//        let coordinator = ImprovedConcurrentOperationCoordinator() // ImprovedSerialOperationCoordinator()
//        coordinator.perform(operations) { [weak self] errors in
//            let errors = errors.compactMap { $0 }
//            self?.textView.text += "Finished with \(errors.count) errors"
//        }
//    }
}


//class DemoOperation: Operation {
//
//    init(vc: ViewController) {
//        self.vc = vc
//    }
//
//    weak var vc: ViewController?
//
//    func perform(completion: @escaping Completion) {
//        vc?.textView.text += "Doing\n"
//        DispatchQueue.global(qos: .background).async {
//            sleep(1)
//            DispatchQueue.main.async {
//                completion(nil)
//            }
//        }
//    }
//}


//class DemoItemOperation: ConcurrentItemOperation /*SerialItemOperation*/ {
//
//    typealias CollectionType = DemoOperation
//
//    func perform(onItem item: DemoOperation, completion: @escaping ItemCompletion) {
//        item.perform { (error) in
//            completion(error)
//        }
//    }
//}


//class DemoBatchOperation: ConcurrentBatchOperation /*SerialBatchOperation*/ {
//
//    var batchSize: Int = 2
//    typealias CollectionType = DemoOperation
//
//    func perform(onBatch batch: [DemoOperation], completion: @escaping BatchCompletion) {
//        batch[0].perform { (error) in
//            completion(error)
//        }
//    }
//}
