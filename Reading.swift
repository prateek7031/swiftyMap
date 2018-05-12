//
//	Reading.swift
//
//	Create by Prateek on 28/4/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation 
import ObjectMapper


class Reading : NSObject, NSCoding, Mappable{

	var coEightHourMax : CoEightHourMax?
	var coSubIndex : CoEightHourMax?
	var no2OneHourMax : CoEightHourMax?
	var o3EightHourMax : CoEightHourMax?
	var o3SubIndex : CoEightHourMax?
	var pm10SubIndex : CoEightHourMax?
	var pm10TwentyFourHourly : CoEightHourMax?
	var pm25SubIndex : CoEightHourMax?
	var pm25TwentyFourHourly : CoEightHourMax?
	var psiThreeHourly : CoEightHourMax?
	var psiTwentyFourHourly : CoEightHourMax?
	var so2SubIndex : CoEightHourMax?
	var so2TwentyFourHourly : CoEightHourMax?


	class func newInstance(map: Map) -> Mappable?{
		return Reading()
	}
	required init?(map: Map){}
	private override init(){}

	func mapping(map: Map)
	{
		coEightHourMax <- map["co_eight_hour_max"]
		coSubIndex <- map["co_sub_index"]
		no2OneHourMax <- map["no2_one_hour_max"]
		o3EightHourMax <- map["o3_eight_hour_max"]
		o3SubIndex <- map["o3_sub_index"]
		pm10SubIndex <- map["pm10_sub_index"]
		pm10TwentyFourHourly <- map["pm10_twenty_four_hourly"]
		pm25SubIndex <- map["pm25_sub_index"]
		pm25TwentyFourHourly <- map["pm25_twenty_four_hourly"]
		psiThreeHourly <- map["psi_three_hourly"]
		psiTwentyFourHourly <- map["psi_twenty_four_hourly"]
		so2SubIndex <- map["so2_sub_index"]
		so2TwentyFourHourly <- map["so2_twenty_four_hourly"]
		
	}

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
	{
         coEightHourMax = aDecoder.decodeObject(forKey: "co_eight_hour_max") as? CoEightHourMax
         coSubIndex = aDecoder.decodeObject(forKey: "co_sub_index") as? CoEightHourMax
         no2OneHourMax = aDecoder.decodeObject(forKey: "no2_one_hour_max") as? CoEightHourMax
         o3EightHourMax = aDecoder.decodeObject(forKey: "o3_eight_hour_max") as? CoEightHourMax
         o3SubIndex = aDecoder.decodeObject(forKey: "o3_sub_index") as? CoEightHourMax
         pm10SubIndex = aDecoder.decodeObject(forKey: "pm10_sub_index") as? CoEightHourMax
         pm10TwentyFourHourly = aDecoder.decodeObject(forKey: "pm10_twenty_four_hourly") as? CoEightHourMax
         pm25SubIndex = aDecoder.decodeObject(forKey: "pm25_sub_index") as? CoEightHourMax
         pm25TwentyFourHourly = aDecoder.decodeObject(forKey: "pm25_twenty_four_hourly") as? CoEightHourMax
         psiThreeHourly = aDecoder.decodeObject(forKey: "psi_three_hourly") as? CoEightHourMax
         psiTwentyFourHourly = aDecoder.decodeObject(forKey: "psi_twenty_four_hourly") as? CoEightHourMax
         so2SubIndex = aDecoder.decodeObject(forKey: "so2_sub_index") as? CoEightHourMax
         so2TwentyFourHourly = aDecoder.decodeObject(forKey: "so2_twenty_four_hourly") as? CoEightHourMax

	}

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    @objc func encode(with aCoder: NSCoder)
	{
		if coEightHourMax != nil{
			aCoder.encode(coEightHourMax, forKey: "co_eight_hour_max")
		}
		if coSubIndex != nil{
			aCoder.encode(coSubIndex, forKey: "co_sub_index")
		}
		if no2OneHourMax != nil{
			aCoder.encode(no2OneHourMax, forKey: "no2_one_hour_max")
		}
		if o3EightHourMax != nil{
			aCoder.encode(o3EightHourMax, forKey: "o3_eight_hour_max")
		}
		if o3SubIndex != nil{
			aCoder.encode(o3SubIndex, forKey: "o3_sub_index")
		}
		if pm10SubIndex != nil{
			aCoder.encode(pm10SubIndex, forKey: "pm10_sub_index")
		}
		if pm10TwentyFourHourly != nil{
			aCoder.encode(pm10TwentyFourHourly, forKey: "pm10_twenty_four_hourly")
		}
		if pm25SubIndex != nil{
			aCoder.encode(pm25SubIndex, forKey: "pm25_sub_index")
		}
		if pm25TwentyFourHourly != nil{
			aCoder.encode(pm25TwentyFourHourly, forKey: "pm25_twenty_four_hourly")
		}
		if psiThreeHourly != nil{
			aCoder.encode(psiThreeHourly, forKey: "psi_three_hourly")
		}
		if psiTwentyFourHourly != nil{
			aCoder.encode(psiTwentyFourHourly, forKey: "psi_twenty_four_hourly")
		}
		if so2SubIndex != nil{
			aCoder.encode(so2SubIndex, forKey: "so2_sub_index")
		}
		if so2TwentyFourHourly != nil{
			aCoder.encode(so2TwentyFourHourly, forKey: "so2_twenty_four_hourly")
		}

	}

}