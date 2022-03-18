//
//  ViewController.swift
//  MyReminders
//
//  Created by Никита Коголенок on 18.03.22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variable
    var myReminders = [MyReminder]()
    
    // MARK: - Outlet
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDelegate()
    }
    
    // MARK: - Methds
    func createDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}
