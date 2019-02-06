//
//  ConcurrentItemOperationTests.swift
//  Demo_AsyncTests
//
//  Created by Daniel Saidi on 2019-01-23.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import Demo_Async

class ConcurrentItemOperationTests: QuickSpec {
    
    override func spec() {
        
        var obj: TestClass!
        
        beforeEach {
            obj = TestClass()
        }
        
        describe("when performing operation") {
            
            it("completes once for empty sequence") {
                var counter = 0
                obj.perform(on: []) { _ in counter += 1 }
                expect(counter).to(equal(1))
            }
            
            it("completes once for non-empty sequence") {
                var counter = 0
                obj.perform(on: [1, 2, 3, 4, 5]) { _ in counter += 1 }
                expect(counter).to(equal(1))
            }
            
            it("performs operation on each item") {
                obj.perform(on: [1, 2, 3, 4, 5]) { _ in }
                expect(obj.result).to(equal([2, 4, 6, 8, 10]))
            }
            
            it("performs operation in parallell and is unaffected by halt") {
                obj.performCompletion = false
                obj.perform(on: [1, 2, 3, 4, 5]) { _ in }
                expect(obj.result).to(equal([2, 4, 6, 8, 10]))
            }
            
            it("completes with resulting errors") {
                let error = NSError(domain: "foo", code: 1, userInfo: nil )
                obj.error = error
                var errors = [Error?]()
                obj.perform(on: [1, 2, 3, 4, 5]) { res in errors = res }
                expect(errors[0]).to(beNil())
                expect(errors[1]).to(be(error))
                expect(errors[2]).to(beNil())
                expect(errors[3]).to(be(error))
                expect(errors[4]).to(beNil())
            }
        }
    }
}

private class TestClass: ConcurrentItemOperation {
    
    typealias CollectionType = Int
    
    var error: Error?
    var performCompletion = true
    private(set) var result = [Int]()
    private var addon = 1
    
    func perform(onItem item: Int, completion: @escaping ItemCompletion) {
        result.append(item + addon)
        addon += 1
        guard performCompletion else { return }
        completion(item % 2 == 0 ? error : nil)
    }
}
