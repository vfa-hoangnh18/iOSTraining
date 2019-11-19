//
//  CustomAnnotation.swift
//  Demo
//
//  Created by Nguyen Hoang on 11/15/19.
//  Copyright © 2019 VFA. All rights reserved.
//

import Foundation
import MapKit
class CustomAnnotation : NSObject,MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var image : UIImage
    
    init(title: String, subtitle: String, coord : CLLocationCoordinate2D,image : UIImage){
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coord
        self.image = image
        super.init()
    }
    
}
