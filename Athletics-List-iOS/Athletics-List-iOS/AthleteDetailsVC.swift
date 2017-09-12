//
//  AthleteDetailsVC.swift
//  Athletics-List-iOS
//
//  Created by Mohamed Salah on 9/12/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit

class AthleteDetailsVC: UIViewController {
    //MARK:- IBOutlets
    @IBOutlet weak var imageViewAthlete: UIImageView!
    @IBOutlet weak var labelAthleteName: UILabel!
    @IBOutlet weak var textViewBrief: UITextView!
    
    
    //MARK:- Variables
    var stateCtrl: AthleteDetailsStateController!

    
    //MARK:- View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageViewAthlete.sd_setImage(with: URL(string: stateCtrl.athlete.image))
        labelAthleteName.text = stateCtrl.athlete.name
        textViewBrief.text = stateCtrl.athlete.brief
    }
    
}
