//
//  UserServices.swift
//  swiftyMaps
//
//  Created by Prateek on 28/4/18.
//  Copyright © 2018 Prateek. All rights reserved.
//

import Foundation
import Alamofire

class UserServices: NSObject {
    
    class func  getPSIAPI(completion : @escaping (_ response: ServiceResponse) -> ()) -> Void {
        var stringURL = "https://api.data.gov.sg/v1/environment/psi"
        //Log.debug(stringURL)
        ServiceFactory.getMethod(url: stringURL, completion: completion)
        
    }
}

