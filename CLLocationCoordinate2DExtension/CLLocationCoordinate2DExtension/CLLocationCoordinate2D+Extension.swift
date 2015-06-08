//
//  CLLocationCoordinate2D+Extension.swift
//  BarMista
//
//  Created by Taras on 5/27/15.
//  Copyright (c) 2015 e-Kreative. All rights reserved.
//

import Foundation
import UIKit
import MapKit

extension CLLocationCoordinate2D{
    func isEqual(coordinate:CLLocationCoordinate2D) -> Bool{
        
        let c1LatDouble = (String(format: "%.20f", self.latitude) as NSString).doubleValue
        let c1LongDouble = (String(format: "%.20f", self.longitude) as NSString).doubleValue
        let c2LatDouble = (String(format: "%.20f", coordinate.latitude) as NSString).doubleValue
        let c2LongDouble = (String(format: "%.20f", coordinate.longitude) as NSString).doubleValue
        
        let c1Lat = NSString(format: "%f", abs(c1LatDouble))
        let c1Long = NSString(format: "%f", abs(c1LongDouble))
        let c2Lat = NSString(format: "%f", abs(c2LatDouble))
        let c2Long = NSString(format: "%f", abs(c2LongDouble))
        
        let c1LatLenght = c1Lat.length - (c1Lat.rangeOfString(".").location + 1)
        let c1LongLenght = c1Long.length - (c1Long.rangeOfString(".").location + 1)
        let c2LatLenght = c2Lat.length - (c2Lat.rangeOfString(".").location + 1)
        let c2LongLenght = c2Long.length - (c2Long.rangeOfString(".").location + 1)

        let c1MinLenght = c1LatLenght >  c1LongLenght ? c1LongLenght : c1LatLenght
        let c2MinLenght = c2LatLenght >  c2LongLenght ? c2LongLenght : c2LatLenght
        var cMinLenght = c1MinLenght >  c2MinLenght ? c2MinLenght : c1MinLenght
        
        cMinLenght -= 2
        
        return round(c1Lat.doubleValue * pow(10.0, Double(cMinLenght))) == round(c2Lat.doubleValue * pow(10.0, Double(cMinLenght))) &&
            round(c1Long.doubleValue * pow(10.0, Double(cMinLenght))) == round(c2Long.doubleValue * pow(10.0, Double(cMinLenght)))
    }
    
    func text() -> String{
        return String("\(self.latitude) \(self.longitude)")
    }
}


