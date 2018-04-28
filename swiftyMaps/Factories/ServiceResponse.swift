//
//  ServiceResponse.swift
//  swiftyMaps
//
//  Created by Prateek on 28/4/18.
//  Copyright © 2018 Prateek. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
class ServiceResponse: NSObject {
    
    public var request: URLRequest!
    
    /// The server's response to the URL request.
    public var response: HTTPURLResponse?!
    
    /// The data returned by the server.
    public var data: Data!
    /// Returns the associated error value if the result if it is a failure, `nil` otherwise.
    public var isSucess : Bool!
    
    public var successValue : Any!
    
    public var serviceError : ServiceError!
    
    public let result: Result<Any>!
    
    /// The timeline of the complete lifecycle of the request.
    public let timeline: Timeline!
    var appDelegate: AppDelegate? = (UIApplication.shared.delegate as? AppDelegate)
    
    /// Returns the associated value of the result if it is a success, `nil` otherwise.
    //public var value: Value? { return result.value }
    
    /// Returns the associated error value if the result if it is a failure, `nil` otherwise.
    public var error: Error?
    
    
    var _metrics: AnyObject?
    
    init(response : DataResponse<Any>) {
        self.request  = response.request
        self.response = response.response
        self.data = response.data
        self.result = response.result
        self.timeline = response.timeline
        self.error = response.error
        //print("response.response?.statusCode is \(response.response?.statusCode)")
        if response.result.isSuccess {
            //print("response.response?.statusCode inside this is \(response.response?.statusCode)")
            if let statusCode =  response.response?.statusCode{
                switch statusCode {
                case 200:
                    print("resp 200")
                    //can do changes for the ErrorChecker
                case -1009,-1, -1001,-1005,500,-1004,-1003,320,9,404,54,-1200:
                    self.isSucess = false
                    serviceError = ServiceError(errorTitle:NSLocalizedString( "Network Connection Lost!", comment: ""), errorMessage: NSLocalizedString("Please try again later", comment: ""), errorAction: .showAlert)
                default:
                    print("Default if any case doesnt match")
//                    //can do changes for the ErrorChecker
                    
                }
                
            }
        }else{
            self.isSucess = false
            serviceError = ServiceError(errorTitle:NSLocalizedString( "Connection Lost!", comment: ""), errorMessage: NSLocalizedString("Please try again later", comment: ""), errorAction: .showAlert)
        }
    }
    
    
    
}
