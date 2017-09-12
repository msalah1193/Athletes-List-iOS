//
//	Athlete.swift
//
//	Create by Mohamed Salah on 12/9/2017
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import SwiftyJSON

class Athlete{
    
    var brief : String!
    var image : String!
    var name : String!
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        brief = json["brief"].stringValue
        image = json["image"].stringValue
        name = json["name"].stringValue
    }
    
    /**
     * Instantiate array of instances using the passed json values to set the properties values
     */
    static func initFromArray(json: JSON!)-> [Athlete] {
        if json.isEmpty{
            return []
        }
        
        var athletes = [Athlete]()
        let athletesArray = json["athletes"].arrayValue
        for athletesJson in athletesArray{
            let value = Athlete(fromJson: athletesJson)
            athletes.append(value)
        }
        
        return athletes
    }
}
