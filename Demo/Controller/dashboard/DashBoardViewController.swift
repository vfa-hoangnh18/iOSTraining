//
//  ViewController.swift
//  Demo
//
//  Created by Nguyen Hoang on 11/4/19.
//  Copyright © 2019 VFA. All rights reserved.
//

import UIKit

class DashBoardViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource{
    let section = ["1. Implementing Controllers and Views",
                   "2. Creating Dynamic and Interactive User Interfaces",
                   "3. Auto Layout and the Visual Format Language",
                   "4. Constructing and Using Table Views",
                   "5. Building Complex Layouts with Collection Views",
                   "6. Storyboards",
                   "7. Concurrency"]
    let content = [["Demo 1", "Demo 2","Demo 3","Demo 4","Demo 5"],
                   ["Demo 6"],
                   ["Demo 7"],
                   ["Demo 8", "Demo 9"],
                   ["Demo 10", "Demo 11"],
    ["Demo 12"],
    ["Demo 13"]]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let row = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellDashboard")
        cell?.textLabel?.text = content[section][row]
        return cell!
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.section[section]
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var screen : UIViewController!
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                screen = storyboard?.instantiateViewController(identifier: "StoryboardDemo1") as! Demo1ViewController
                break
            case 1:
                screen = storyboard?.instantiateViewController(identifier: "StoryboardDemo2") as! Demo2ViewController
                break
            case 2:
            screen = storyboard?.instantiateViewController(identifier: "StoryboardDemo3") as! Demo3ViewController
            break
                case 3:
                screen = storyboard?.instantiateViewController(identifier: "StoryboardDemo4") as! Demo4ViewController
                break
            default:
                screen = storyboard?.instantiateViewController(identifier: "StoryboardDemo1") as! Demo1ViewController
            }
        case 6:
            screen = storyboard?.instantiateViewController(identifier: "StoryboardDemo13") as! Demo13ViewController
            break
        default:
            screen = storyboard?.instantiateViewController(identifier: "StoryboardDemo1") as! Demo1ViewController
        }
        navigationController?.pushViewController(screen, animated: true)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return section.count
    }
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

