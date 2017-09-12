//
//  AthletesListVC.swift
//  Athletics-List-iOS
//
//  Created by Mohamed Salah on 9/12/17.
//  Copyright © 2017 Mohamed Salah. All rights reserved.
//

import UIKit
import SDWebImage

class AthletesListVC: UIViewController {
    //MARK:- IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Variables
    var stateCtrl: AthletesListStateController!
    var tableDS: TableDataSource<AthleteTableViewCell, Athlete>!
    var tableDelegate: TableDelegate!
    
    //MARK:- Segues
    let DETAILS_SEQUE = "fromHomeToDetails"
    
    //MARK:- View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stateCtrl = AthletesListStateController()
        
        //get athletes data
        showAlert()
        stateCtrl.getAthletes { (error: String?) in
            self.hideAlert()
            guard let errorMsg = error else {
                self.configureTableView()
                return
            }
            
            self.showErrorAlert(message: errorMsg)
        }
    }
    
    //MARK:- Configuratiuon
    func configureTableView() {
        tableDS = TableDataSource(cellID: AthleteTableViewCell.CELL_ID, data: stateCtrl.athletes) {
            cell, model in
            
            cell.imageViewAthlete.sd_setImage(with: URL(string: model.image))
            cell.labelAthleteName.text = model.name
        }
        
        tableDelegate = TableDelegate(listDelegate: self)
        
        tableView.dataSource = tableDS
        tableView.delegate = tableDelegate
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //pass selected athlete object to details page
        if segue.identifier == DETAILS_SEQUE {
            let index = sender as! Int
            let detailsVC = segue.destination as! AthleteDetailsVC
            detailsVC.stateCtrl = AthleteDetailsStateController(athlete: stateCtrl.athletes[index])
        }
    }
}

//MARK:- List Views Delegate Methods
extension AthletesListVC: ListViewsDelegate{
    func didSelectItemAt(index: Int) {
        self.performSegue(withIdentifier: DETAILS_SEQUE, sender: index)
    }
}
