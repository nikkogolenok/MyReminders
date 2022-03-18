//
//  ViewController.swift
//  MyReminders
//
//  Created by Никита Коголенок on 18.03.22.
//

import UIKit
import UserNotifications

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
    
    // MARK: - Actions
    @IBAction func didTapTestAction(_ sender: UIBarButtonItem) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound],
                                                                completionHandler: { success, error in
            if success {
                scheduleTest()
            }
            else if error != nil {
                print("Error ocurred")
            }
        })
        
        func scheduleTest() {
            let content = UNMutableNotificationContent()
            content.title = "Hello World"
            content.sound = .default
            content.body = "My long body. My long body. My long body."
            
            let targetDate = Date().addingTimeInterval(10)
            let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: targetDate),
                                                        repeats: false)
            let request = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
                if error != nil {
                    print("Something went wrong!")
                }
            })
        }
    }
    
    @IBAction func didTapAddAction(_ sender: UIBarButtonItem) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "Add") as? AddViewController else { return }
        vc.title = "New Reminder"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = { title, body, date in
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
                let newReminder = MyReminder(title: title, date: date, identifier: "id_\(title)")
                self.myReminders.append(newReminder)
                self.tableView.reloadData()
                
                let content = UNMutableNotificationContent()
                content.title = title
                content.sound = .default
                content.body = body
                
                let targetDate = date
                let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: targetDate),
                                                            repeats: false)
                let request = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
                    if error != nil {
                        print("Something went wrong!")
                    }
                })
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}
