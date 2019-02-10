//
//  DemoItem.swift
//  Demo_Async
//
//  Created by Daniel Saidi on 2019-02-08.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation

struct DemoItem {
    
    static func create(_ count: Int) -> [DemoItem] {
        return (0..<count).map {  DemoItem(id: $0) }
    }
    
    let id: Int
}
