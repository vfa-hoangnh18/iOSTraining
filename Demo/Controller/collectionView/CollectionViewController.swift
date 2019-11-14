//
//  CollectionViewController.swift
//  Demo
//
//  Created by Nguyen Hoang on 11/6/19.
//  Copyright © 2019 VFA. All rights reserved.
//

import UIKit

class CollectionViewController: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    @IBOutlet var collectionView: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let screen = storyboard?.instantiateViewController(identifier: "PhoneBookDetail") as! PhoneBookDetailController
        screen.name = phoneBookArray[indexPath.section][indexPath.row]
        screen.avatarString = avatarArray[indexPath.section][indexPath.row]
        navigationController?.pushViewController(screen, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 200)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return phoneBookArray[section].count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return phoneBookArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewCell", for: indexPath) as! CollectionViewCell
        //cell.backgroundColor = UIColor.red
        cell.lblName?.text = phoneBookArray[indexPath.section][indexPath.row]
        cell.imgAvatar?.image = UIImage(named: avatarArray[indexPath.section][indexPath.row])
        return cell
    }
    
    
    var phoneBookArray : [[String]]!
    let phoneBookHeader = ["A" ,"C" ,"D","E","F","G","Z"]
    let number = ["1","2","3"]
    var avatarArray : [[String]]!
    
    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
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
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControl.Event.valueChanged)
        collectionView.addSubview(refreshControl) // not required when using UITableViewController
    }
    @objc func refresh(sender:AnyObject) {
       let timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (timer) in
        self.refreshControl.endRefreshing()
       }
    }
    
}
