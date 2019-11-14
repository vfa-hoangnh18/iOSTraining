//
//  Date.swift
//  Demo
//
//  Created by Nguyen Hoang on 11/11/19.
//  Copyright © 2019 VFA. All rights reserved.
//

import Foundation
extension Date {
  func asString(style: DateFormatter.Style) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = style
    return dateFormatter.string(from: self)
  }
}
