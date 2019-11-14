//
//  Demo2ViewController.swift
//  Demo
//
//  Created by Nguyen Hoang on 11/11/19.
//  Copyright © 2019 VFA. All rights reserved.
//

import UIKit

class Demo2ViewController: BaseViewController {

    @IBOutlet weak var label110: UILabel!
    
    @IBOutlet weak var label111: UILabel!
    
    @IBOutlet weak var label113: UILabel!
    
    @IBOutlet weak var label116: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //label 1.10
        let tapLabel110 = UITapGestureRecognizer(target: self, action: #selector(tapLabel110Function))
        label110.isUserInteractionEnabled = true
        label110.addGestureRecognizer(tapLabel110)
        //label 1.11
        let tapLabel111 = UITapGestureRecognizer(target: self, action: #selector(tapLabel111Function))
        label111.isUserInteractionEnabled = true
        label111.addGestureRecognizer(tapLabel111)
        //label 1.13
        let tapLabel113 = UITapGestureRecognizer(target: self, action: #selector(tapLabel113Function))
        label113.isUserInteractionEnabled = true
        label113.addGestureRecognizer(tapLabel113)
        //label 1.16
        let tapLabel116 = UITapGestureRecognizer(target: self, action: #selector(tapLabel116Function))
        label116.isUserInteractionEnabled = true
        label116.addGestureRecognizer(tapLabel116)
        
        //show
        let image = UIImage(named: "menu")
        navigationItem.titleView = UIImageView(image: image)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "RightButton", style: UIBarButtonItem.Style.plain, target: self, action: #selector(tapRightButton))
    }
    @IBAction func tapRightButton(){
        showToast(message: "Clicked")
    }
    
    @IBAction func tapLabel110Function(sender: UITapGestureRecognizer) {
       let items = ["This app is my favorite"]
       let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
       present(ac, animated: true)
    }
    @IBAction func tapLabel111Function(sender: UITapGestureRecognizer) {
       let items = ["This app is my favorite"]
       let ac = UIActivityViewController(activityItems: items, applicationActivities: [ConvertService()])
       present(ac, animated: true)
    }
    @IBAction func tapLabel113Function(sender: UITapGestureRecognizer) {
        var viewController = navigationController?.viewControllers
        viewController?.removeLast()
        
        navigationController?.setViewControllers(viewController!, animated: true)
        //let a = 1
    }
    @IBAction func tapLabel116Function(sender: UITapGestureRecognizer) {
        let screen = storyboard?.instantiateViewController(identifier: "StoryboardTabBar") as! TabBarViewController
        navigationController?.pushViewController(screen, animated: true)
    }
    

}
