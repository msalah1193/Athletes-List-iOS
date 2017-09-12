//
//  AthletesListStateController.swift
//  Athletics-List-iOS
//
//  Created by Mohamed Salah on 9/12/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AthletesListStateController {
    //MARK: - Variables
    var athletes: [Athlete] = []
    
    //MARK:- API CALLS
    func getAthletes(completion: @escaping (_ error: String?)->()) {
        let urlString = "\(AppURL.server_ip.rawValue)\(AppURL.athletes.rawValue)"
      
        Alamofire.request(urlString, method: .get)
            .responseData { response in
                
                guard response.result.isSuccess else {
                    completion(ErrorMessages.connectionError.rawValue)
                    return
                }
                
                self.athletes = Athlete.initFromArray(json: JSON(data: response.data!))
                completion(nil)
        }
    }
}
