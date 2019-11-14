//
//  PhoneBookViewController.swift
//  Demo
//
//  Created by Nguyen Hoang on 11/5/19.
//  Copyright © 2019 VFA. All rights reserved.
//

import UIKit

class PhoneBookViewController: BaseViewController, UITableViewDataSource,
    UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let screen = storyboard?.instantiateViewController(identifier: "PhoneBookDetail") as! PhoneBookDetailController
        screen.name = phoneBookArray[indexPath.section][indexPath.row]
        screen.avatarString = avatarArray[indexPath.section][indexPath.row]
        navigationController?.pushViewController(screen, animated: true)
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return phoneBookHeader[section]
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return phoneBookArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phoneBookArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : PhoneBookTableViewCell = tableView.dequeueReusableCell(withIdentifier: "NewCell") as! PhoneBookTableViewCell
        //let cell = tableView.dequeueReusableCell(withIdentifier: "NewCell")
        cell.lblName1?.text = phoneBookArray[indexPath.section][indexPath.row]
        cell.imgAvatar?.image = UIImage(named: avatarArray[indexPath.section][indexPath.row])
        return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var phoneBookArray : [[String]]!
    let phoneBookHeader = ["A" ,"C" ,"D","E","F","G","Z"]
    let number = ["1","2","3"]
    var avatarArray : [[String]]!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        phoneBookArray = []
        avatarArray = []
        for (char) in phoneBookHeader{
            var names : [String] = []
            var avatars : [String] = []
            for (num) in number{
                names.append(char + num)
                avatars.append("00" + num)
            }
            phoneBookArray.append(names)
            avatarArray.append(avatars)
        }
    }
}
