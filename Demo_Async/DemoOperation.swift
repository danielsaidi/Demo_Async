//
//  DemoOperation.swift
//  Demo_Async
//
//  Created by Daniel Saidi on 2019-02-08.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

class DemoOperation: Operation {
    
    init(id: Int? = nil, vc: ViewController) {
        self.id = id
        self.vc = vc
    }
    
    public static func create(_ count: Int, for vc: ViewController) -> [DemoOperation] {
        return (0..<count).map { DemoOperation(id: $0, vc: vc) }
    }
    
    
    private var id: Int?
    private weak var vc: ViewController?

    
    func perform(completion: @escaping Completion) {
        printStart()
        DispatchQueue.global(qos: .background).async {
            sleep(1)
            DispatchQueue.main.async {
                completion(nil)
            }
        }
    }
    
    private func printStart() {
        var idSuffix = ""
        if let id = id { idSuffix = "\(id)" }
        vc?.textView.text += "Performing operation \(idSuffix)\n"
    }
}
