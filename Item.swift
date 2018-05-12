//
//	Item.swift
//
//	Create by Prateek on 28/4/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Item : NSObject, NSCoding, Mappable{

	var readings : Reading?
	var timestamp : String?
	var updateTimestamp : String?


	class func newInstance(map: Map) -> Mappable?{
		return Item()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		readings <- map["readings"]
		timestamp <- map["timestamp"]
		updateTimestamp <- map["update_timestamp"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         readings = aDecoder.decodeObject(forKey: "readings") as? Reading
         timestamp = aDecoder.decodeObject(forKey: "timestamp") as? String
         updateTimestamp = aDecoder.decodeObject(forKey: "update_timestamp") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if readings != nil{
			aCoder.encode(readings, forKey: "readings")
		}
		if timestamp != nil{
			aCoder.encode(timestamp, forKey: "timestamp")
		}
		if updateTimestamp != nil{
			aCoder.encode(updateTimestamp, forKey: "update_timestamp")
		}

	}

}