//
//  RegionDataClass.swift
//  swiftyMaps
//
//  Created by Prateek on 28/4/18.
//  Copyright © 2018 Prateek. All rights reserved.
//

import Foundation
import ObjectMapper

class MapPSIData {
    let lat : Double
    let lng : Double
    let name : String
    let psi : Reading?
    
    init(name : String, lat: Double, lng: Double, psi: Reading) {
        self.name = name
        self.lat = lat
        self.lng = lng
        self.psi = psi
    }
}
