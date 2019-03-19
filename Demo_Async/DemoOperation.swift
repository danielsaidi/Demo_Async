//
//  DemoOperation.swift
//  Demo_Async
//
//  Created by Daniel Saidi on 2019-02-08.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation

class DemoOperation: Operation {
    
    init(name: String, printer: Printer) {
        self.name = name
        self.printer = printer
    }
    
    private var name: String
    private weak var printer: Printer?
    
    func perform(completion: @escaping OperationCompletion) {
        printer?.print("Performing \(name)")
        DispatchQueue.global(qos: .background).async {
            usleep(UInt32.random(in: 800_000...1_200_000))
            DispatchQueue.main.async {
                self.printer?.print("Finished \(self.name)")
                completion(nil)
            }
        }
    }
}
