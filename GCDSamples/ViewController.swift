//
//  ViewController.swift
//  GCDSamples
//
//  Created by Gabriel Theodoropoulos on 07/11/16.
//  Copyright © 2016 Appcoda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // simpleQueues()
        
        // queuesWithQoS()
        
        /*
         concurrentQueues()
         if let queue = inactiveQueue {
            queue.activate()
         }
         */
        
        // queueWithDelay()
        
        // fetchImage()
        
        // useWorkItem()
    }
    
    
    
    func simpleQueues() {
        
    }
    
    
    func queuesWithQoS() {
        
    }
    
    
    var inactiveQueue: DispatchQueue!
    func concurrentQueues() {
        
    }
    
    
    func queueWithDelay() {
        
    }
    
    
    func fetchImage() {
        
    }
    
    
    func useWorkItem() {
        
    }
}
