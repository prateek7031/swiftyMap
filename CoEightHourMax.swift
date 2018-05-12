//
//	CoEightHourMax.swift
//
//	Create by Prateek on 28/4/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class CoEightHourMax : NSObject, NSCoding, Mappable{

	var central : Int?
	var east : Int?
	var national : Int?
	var north : Int?
	var south : Int?
	var west : Int?


	class func newInstance(map: Map) -> Mappable?{
		return CoEightHourMax()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		central <- map["central"]
		east <- map["east"]
		national <- map["national"]
		north <- map["north"]
		south <- map["south"]
		west <- map["west"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         central = aDecoder.decodeObject(forKey: "central") as? Int
         east = aDecoder.decodeObject(forKey: "east") as? Int
         national = aDecoder.decodeObject(forKey: "national") as? Int
         north = aDecoder.decodeObject(forKey: "north") as? Int
         south = aDecoder.decodeObject(forKey: "south") as? Int
         west = aDecoder.decodeObject(forKey: "west") as? Int

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if central != nil{
			aCoder.encode(central, forKey: "central")
		}
		if east != nil{
			aCoder.encode(east, forKey: "east")
		}
		if national != nil{
			aCoder.encode(national, forKey: "national")
		}
		if north != nil{
			aCoder.encode(north, forKey: "north")
		}
		if south != nil{
			aCoder.encode(south, forKey: "south")
		}
		if west != nil{
			aCoder.encode(west, forKey: "west")
		}

	}

}