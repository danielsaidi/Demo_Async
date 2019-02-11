//
//  DemoOperation.swift
//  Demo_Async
//
//  Created by Daniel Saidi on 2019-02-08.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation

class DemoOperation: Operation {
    
    init(name: String, vc: ViewController) {
        self.name = name
        self.vc = vc
    }
    
    public static func create(_ count: Int, vc: ViewController) -> [DemoOperation] {
        return (1...count).map {
            DemoOperation(name: "Operation \($0)", vc: vc)
        }
    }
    
    private var name: String
    private weak var vc: ViewController?
    
    func perform(completion: @escaping Completion) {
        vc?.print("Performing \(name)")
        DispatchQueue.global(qos: .background).async {
            usleep(UInt32.random(in: 800_000...1_200_000))
            DispatchQueue.main.async {
                self.vc?.print("Finished \(self.name)")
                completion(nil)
            }
        }
    }
}
