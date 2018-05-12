//
//	ApiInfo.swift
//
//	Create by Prateek on 28/4/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class ApiInfo : NSObject, NSCoding, Mappable{

	var status : String?


	class func newInstance(map: Map) -> Mappable?{
		return ApiInfo()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		status <- map["status"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         status = aDecoder.decodeObject(forKey: "status") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if status != nil{
			aCoder.encode(status, forKey: "status")
		}

	}

}