//
//  Demo4ViewController.swift
//  Demo
//
//  Created by Nguyen Hoang on 11/11/19.
//  Copyright © 2019 VFA. All rights reserved.
//

import UIKit
import WebKit
class Demo4ViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://www.google.com")
        let myRequest = URLRequest(url: url!)
        webView.load(myRequest)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
