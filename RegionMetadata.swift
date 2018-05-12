//
//	RegionMetadata.swift
//
//	Create by Prateek on 28/4/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class RegionMetadata : NSObject, NSCoding, Mappable{

	var labelLocation : LabelLocation?
	var name : String?


	class func newInstance(map: Map) -> Mappable?{
		return RegionMetadata()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		labelLocation <- map["label_location"]
		name <- map["name"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         labelLocation = aDecoder.decodeObject(forKey: "label_location") as? LabelLocation
         name = aDecoder.decodeObject(forKey: "name") as? String

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if labelLocation != nil{
			aCoder.encode(labelLocation, forKey: "label_location")
		}
		if name != nil{
			aCoder.encode(name, forKey: "name")
		}

	}

}