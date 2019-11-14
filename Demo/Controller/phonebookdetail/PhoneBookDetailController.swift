//
//  PhoneBookDetailController.swift
//  Demo
//
//  Created by Nguyen Hoang on 11/6/19.
//  Copyright © 2019 VFA. All rights reserved.
//

import UIKit

class PhoneBookDetailController: BaseViewController {

    var name : String!
    var avatarString : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        imgAvatar.image = UIImage(named: avatarString)
        lblName.text = name
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblName: UILabel!

    /*
     
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
