//
//  DemoSyncItem.swift
//  Demo_Async
//
//  Created by Daniel Saidi on 2019-02-08.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

struct DemoSyncItem {
    
    static func create(_ count: Int) -> [DemoSyncItem] {
        return (0..<count).map {  DemoSyncItem(id: $0) }
    }
    
    let id: Int
}
