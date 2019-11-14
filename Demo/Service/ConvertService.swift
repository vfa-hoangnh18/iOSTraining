//
//  ConvertService.swift
//  Demo
//
//  Created by Nguyen Hoang on 11/11/19.
//  Copyright © 2019 VFA. All rights reserved.
//

import UIKit

class ConvertService: UIActivity {
    override class var activityCategory: UIActivity.Category {
        return .action
    }
    
    override var activityType: UIActivity.ActivityType? {
        guard let bundleId = Bundle.main.bundleIdentifier else {return nil}
        return UIActivity.ActivityType(rawValue: bundleId + "\(self.classForCoder)")
    }
    
    override var activityTitle: String? {
        return "Custom Title"
    }

    override var activityImage: UIImage? {
        return UIImage.init(named: "001")
    }

    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return true
    }
    
    override func prepare(withActivityItems activityItems: [Any]) {
        guard let sharedStrings = activityItems as? [String] else { return }
        let a = 1
    }

    override func perform() {
        activityDidFinish(true)
    }
    
}
