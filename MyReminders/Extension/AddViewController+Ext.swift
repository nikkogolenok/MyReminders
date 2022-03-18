//
//  AddViewController+Ext.swift
//  MyReminders
//
//  Created by Никита Коголенок on 18.03.22.
//

import UIKit
extension AddViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
