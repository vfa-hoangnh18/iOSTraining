//
//  CountingOperation.swift
//  Demo
//
//  Created by Nguyen Hoang on 11/14/19.
//  Copyright © 2019 VFA. All rights reserved.
//

import Foundation
import UIKit

class CountingOperation : Operation{
    var startingCount: Int = 0
    var endingCount: Int = 0
    init(startCount: Int, endCount: Int){
        startingCount = startCount
        endingCount = endCount
    }
    convenience override init(){ self.init(startCount: 0, endCount: 3)
    }
    override func main() {
        var isTaskFinished = false
        while isTaskFinished == false && self.isFinished == false{
            for counter in startingCount..<endingCount{
                print("Count = \(counter)")
                print("Current thread = \(Thread.current)")
                print("Main thread = \(Thread.main)")
                print("---------------------------------")
            }
            isTaskFinished = true
        }
    }
}
