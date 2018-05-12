//
//	RootClass.swift
//
//	Create by Prateek on 28/4/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class RootClass : NSObject, NSCoding, Mappable{

	var apiInfo : ApiInfo?
	var items : [Item]?
	var regionMetadata : [RegionMetadata]?


	class func newInstance(map: Map) -> Mappable?{
		return RootClass()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		apiInfo <- map["api_info"]
		items <- map["items"]
		regionMetadata <- map["region_metadata"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         apiInfo = aDecoder.decodeObject(forKey: "api_info") as? ApiInfo
         items = aDecoder.decodeObject(forKey: "items") as? [Item]
         regionMetadata = aDecoder.decodeObject(forKey: "region_metadata") as? [RegionMetadata]

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if apiInfo != nil{
			aCoder.encode(apiInfo, forKey: "api_info")
		}
		if items != nil{
			aCoder.encode(items, forKey: "items")
		}
		if regionMetadata != nil{
			aCoder.encode(regionMetadata, forKey: "region_metadata")
		}

	}

}