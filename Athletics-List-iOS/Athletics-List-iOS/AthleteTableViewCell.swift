//
//  AthleteTableViewCell.swift
//  Athletics-List-iOS
//
//  Created by Mohamed Salah on 9/12/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class AthleteTableViewCell: UITableViewCell {
    //MARK:- IBOutlets
    @IBOutlet weak var imageViewAthlete: UIImageView!
    @IBOutlet weak var labelAthleteName: UILabel!
    
    //MARK:- Variables
    static let CELL_ID: String = "athleteCell"
}
