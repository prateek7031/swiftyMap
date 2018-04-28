//
//  ServiceError.swift
//  swiftyMaps
//
//  Created by Prateek on 28/4/18.
//  Copyright © 2018 Prateek. All rights reserved.
//

import Foundation
import ObjectMapper

enum ErrorAction: Int {
    case showAlert = 1, logout, dismiss
}
class ServiceError : NSObject, NSCoding, Mappable{
    
    var code : Int?
    var message : String?
    var messageDetail : String?
    //var errorAction : ErrorAction!
    
    
    class func newInstance(map: Map) -> Mappable?{
        return ServiceError()
    }
    required init?(map: Map){}
    private override init(){}
    convenience init(errorTitle:String,errorMessage:String,errorAction:ErrorAction) {
        self.init()
        self.message = errorTitle
        self.messageDetail = errorMessage
        //self.errorAction = errorAction
    }
    func mapping(map: Map)
    {
        code <- map["code"]
        message <- map["message"]
        messageDetail <- map["message_detail"]
        handleError()
    }
    
    /**
     * NSCoding required initializer.
     * Fills the data from the passed decoder
     */
    @objc required init(coder aDecoder: NSCoder)
    {
        code = aDecoder.decodeObject(forKey: "code") as? Int
        message = aDecoder.decodeObject(forKey: "message") as? String
        messageDetail = aDecoder.decodeObject(forKey: "message_detail") as? String
        //messageDet = aDecoder.decodeObject(forKey: "message_detail") as? MessageDetail
        
    }
    
    /**
     * NSCoding required method.
     * Encodes mode properties into the decoder
     */
    @objc func encode(with aCoder: NSCoder)
    {
        if code != nil{
            aCoder.encode(code, forKey: "code")
        }
        if message != nil{
            aCoder.encode(message, forKey: "message")
        }
        if messageDetail != nil{
            aCoder.encode(messageDetail, forKey: "message_detail")
        }
        
    }
    /**
     * Adding conditions to show data required method.
     * Encodes mode properties into the decoder
     */
    func handleError(){
        //print("handle error method called \(String(describing: code))")
        if let respondeCode = code {
            //handle on the basis of codee
        }
        
    }
    
}

