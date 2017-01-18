//
//  ViewController.swift
//  GCDSamples
//
//  Created by Gabriel Theodoropoulos on 07/11/16.
//  Copyright © 2016 Appcoda. All rights reserved.
//


//GCD
//NSOperationQueue

//DispatchQueue - FIFO
//sincrona - asincrona
//sincrona (secuencial)
//asincrona (paralelo)


//FORMA ASINCRONA SOLO TIENE VALOR CUANDO VA EN UN HILO, AHI SE EJECUTAN PARALELAMENTE
//SI LO DECLARAS EN DIFERENTES HILOS SE EJECUTA YA DE POR SI PARALELAMENTE, POR LO TANTO, 
//VARIOS PROCESOS EN UN HILO DE MANERA ASYNCRNA .CONCURRENT SERÁ LO MISMO QUE 
//VARIOS PROCESOS EN VARIOS HILOS DE MANERA SYNCRONA


//Secuencial
//Concurrente
//sync(espera)
//async (no espera)

//EN CADA HILO VARIAS TAREAS

//Async - concurrente
    /*
    Hilo secundario ejecuta varios métodos simultáneamente
    Hilo principal se ejecuta simultaneamente
    */

//Aync - secuencial
    /*
    Hilo secundario ejecuta varios métodos EN ORDEN
    Hilo principal se ejecuta simultáneamente
    */

//Sync - concurrente
    /*
    Hilo secundario ejecuta varios métodos simultáneamente
    Hilo principal espera a que termine
    */

//Sync - secuencial
    /*
    Hilo secundario ejecuta métodos EN ORDEN
    Hilo principal espera a que termine
    */



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
        
         //simpleQueues()
        
       // queuesWithQoS()
        
        /*
         concurrentQueues()
         if let queue = inactiveQueue {
            queue.activate()
         }
         */
        //concurrentQueues()
        
          descargarImagen()
        
        // queueWithDelay()
        
        // fetchImage()
        
        // useWorkItem()
    }
    
    func simpleQueues(){
    
        let queue = DispatchQueue(label: "com.cice.queue")//Aconsejan utilizar el dominio inverso, String unico
        queue.sync {
            for i in 0 ..< 10 {
                print("🔴", i)
            }
        }
        for i in 100 ..< 110 {
            print("🔵", i)
        }
        
    
    }
    
    

    
    
    func queuesWithQoS() {
        let queue1 = DispatchQueue(label: "com.cice.queue1", qos: DispatchQoS.userInitiated)
        let queue2 = DispatchQueue(label: "com.cice.queue2", qos: DispatchQoS.utility)
        
        queue1.async {
            for i in 0 ..< 10 {
                print("🔴", i)
            }
        }
        queue2.async {
            for i in 100 ..< 110 {
                print("🔵", i)
            }
        }
        for i in 1000 ..< 1010 {
            print("⚫️", i)
        }
    }
    
    
    var inactiveQueue: DispatchQueue!
    
    func concurrentQueues() {
        
        let anotherQueue = DispatchQueue(label: "com.cice.anotherQueue", qos: .utility, attributes: .concurrent)
        
        anotherQueue.async {
            for i in 0 ..< 10 {
                print("🔴", i)
            }
        }
        anotherQueue.async {
            for i in 100 ..< 110 {
                print("🔵", i)
            }
        }
        anotherQueue.async {
            for i in 1000 ..< 1010 {
                print("⚫️", i)
            }
        }
        
        
    }
    
    func descargarImagen() {
         let queue = DispatchQueue(label: "com.cice.queue")
        queue.async {
            
        
        let urlImagen = URL(string: "https://codigoespagueti.com/wp-content/uploads/2016/02/CrashBandicoot.jpg")!
        URLSession(configuration: URLSessionConfiguration.default).dataTask(with: urlImagen){
            (imageData, response, error) in
            if let data = imageData {
                print("Imagen descargada")
                self.imageView.image = UIImage(data: data)
            }
        }.resume()
        }
    }
    
    func queueWithDelay() {
        
    }
    
    
    func fetchImage() {
        
    }
    
    
    func useWorkItem() {
        
    }
}

