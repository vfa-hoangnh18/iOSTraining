//
//  Demo13ViewController.swift
//  Demo
//
//  Created by Nguyen Hoang on 11/13/19.
//  Copyright © 2019 VFA. All rights reserved.
//

import UIKit

class Demo13ViewController: UIViewController {
    
    func doSomeThing1(){
        print("doSomeThing1 called")
    }
    func doSomeThing2(){
        print("doSomeThing2 called")
    }
    func printRange(from: Int, to: Int){
        for counter in from..<(to+1){
            print("\nCounter = \(counter) - Thread = \(Thread.current)")
        }
    }
    
    @IBAction func onClickedBtn713(_ sender: Any) {
        let operationQueue = OperationQueue()
        let operation1 = CountingOperation(startCount: 1,endCount: 20)
        let operation2 = CountingOperation(startCount: 21,endCount: 40)
        operation1.addDependency(operation2)
        operationQueue.addOperation(operation1)
        operationQueue.addOperation(operation2)
    }
    @IBAction func onClickedBtn712(_ sender: Any) {
        //7.12. Running Tasks Asynchronously with Operations
        let operationQueue = OperationQueue()
        let operation1 = CountingOperation(startCount: 1,endCount: 20)
        let operation2 = CountingOperation(startCount: 21,endCount: 40)
        
        operationQueue.addOperation(operation1)
        operationQueue.addOperation(operation2)
    }
    
    
    @IBAction func onClickedBtn711(_ sender: Any) {
        //7.11. Running Tasks Synchronously with Operations
        let operationQueue = OperationQueue()
        let operation1 = CountingOperation(startCount: 1,endCount: 20)
        let operation2 = CountingOperation(startCount: 21,endCount: 40)
        
        operationQueue.addOperation(operation1)
        operationQueue.addOperation(operation2)
    }
    
    @IBAction func onClickedBtn710(_ sender: Any) {
        let concurrentQueue = DispatchQueue(label: "com.swift5.customConcurrentQueue", attributes: .concurrent)
        concurrentQueue.async {
            print("async task")
        }
        
        let serialQueue = DispatchQueue(label: "com.swift5.customSerialQueu")
        serialQueue.sync {
            print("sync task")
        }
        
    }
    @IBAction func onClickedBtn79(_ sender: Any) {
        let group = DispatchGroup.init()
        group.enter()
        doSomeThing1()
        group.enter()
        doSomeThing2()
        group.leave()
        group.leave()
        
        group.notify(queue: .main) {
            print("complete")
        }
    }
    @IBAction func onClickedBtn78(_ sender: Any) {
        /*
         DispatchQueue.once(token: "com.mydomain.uniqueName") {
         printFrom1To1000()
         }*/
        
    }
    @IBAction func onClickedBtn77(_ sender: Any) {
        //Performing Task after delay
        DispatchQueue.global().asyncAfter(deadline: .now() + 5.0, execute: {
            self.printRange(from: 1, to: 20)
        })
    }
    @IBAction func onClickedBtn76(_ sender: Any) {
        //Executing Non-UI Related Task ASync
        DispatchQueue.global().async {
            self.printRange(from: 1, to: 20)
        }
        DispatchQueue.global().async {
            self.printRange(from: 1, to: 20)
        }
    }
    @IBAction func onClickedBtn75(_ sender: Any) {
        //Executing Non-UI Related Task Sync
        DispatchQueue.global().sync {
            self.printRange(from: 1, to: 20)
        }
        DispatchQueue.global().sync {
            self.printRange(from: 1, to: 20)
        }
    }
    @IBAction func onClickedBtn74(_ sender: Any) {
        //Performing UI-Related Tasks with GCD
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "GCD", message: "GCD is amazing!",preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK",style: .default,handler: nil))
            self.present(alertController, animated: true,completion: nil)
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
