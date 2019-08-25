//
//  NewTaskViewController.swift
//  Check-It
//
//  Created by Wesley Brown on 7/29/19.
//  Copyright © 2019 Allegory. All rights reserved.
//

import Cocoa

class NewTaskViewController: NSViewController {
    
    @IBOutlet weak var titleTextField: NSTextField!
    @IBOutlet weak var descriptionTextField: NSTextField!
    
    var taskController: TaskListController
    
    init(for controller: TaskListController) {
        self.taskController = controller
        super.init(nibName: "NewTaskViewController", bundle: nil)
    }
    
    required init?(coder aCoder: NSCoder) {
        fatalError("[init?(coder)]: Has not been initialized.")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func createNewTask(_ sender: Any?) {
        let appDelegate = NSApplication.shared.delegate as! AppDelegate
        
        if titleTextField.stringValue != "" {
            let temp = NSEntityDescription.insertNewObject(forEntityName: "Task", into: appDelegate.persistentContainer.viewContext) as! Task
            temp.title = titleTextField.stringValue
            temp.taskDescription = descriptionTextField.stringValue
            
            taskController.add(task: temp)
            
            appDelegate.createTabView()
            appDelegate.saveTask()
        }
    }
    
}
