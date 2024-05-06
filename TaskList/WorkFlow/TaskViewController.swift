//
//  TaskViewController.swift
//  TaskList
//
//  Created by Chinar on 05/9/23.
//

import UIKit

class TaskViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var task: String?
    var currentPosition: Int!
    var taskDeleted: (() -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        label.text = task
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    
    @objc private func deleteTask() {
        let count = UserDefaults.standard.integer(forKey: "count")
        
        for i in (currentPosition + 1)..<count {
            let nextTask = UserDefaults.standard.string(forKey: "task_\(i)")
            UserDefaults.standard.set(nextTask, forKey: "task_\(i-1)")
        }
        UserDefaults.standard.set(count - 1, forKey: "count")
        taskDeleted?()
        navigationController?.popViewController(animated: true)
        
    }
    
}
