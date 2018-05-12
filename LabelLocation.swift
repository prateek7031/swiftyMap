//
//	LabelLocation.swift
//
//	Create by Prateek on 28/4/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class LabelLocation : NSObject, NSCoding, Mappable{

	var latitude : Double?
	var longitude : Double?


	class func newInstance(map: Map) -> Mappable?{
		return LabelLocation()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		latitude <- map["latitude"]
		longitude <- map["longitude"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         latitude = aDecoder.decodeObject(forKey: "latitude") as? Double
         longitude = aDecoder.decodeObject(forKey: "longitude") as? Double

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if latitude != nil{
			aCoder.encode(latitude, forKey: "latitude")
		}
		if longitude != nil{
			aCoder.encode(longitude, forKey: "longitude")
		}

	}

}
