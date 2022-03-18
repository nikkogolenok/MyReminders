//
//  AddViewController.swift
//  MyReminders
//
//  Created by Никита Коголенок on 18.03.22.
//

import UIKit

class AddViewController: UIViewController {
    
    // MARK: - Variable
    public var completion: ((String, String, Date) -> Void)?
    
    // MARK: - Outlet
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Action
    @IBAction func didTapSaveButton(_ sender: UIButton) {
        if let titleText = titleTextField.text, titleText.isEmpty,
           let bodyText = bodyTextField.text, bodyText.isEmpty {
            
            let targetDate = datePicker.date
        }
    }
}
