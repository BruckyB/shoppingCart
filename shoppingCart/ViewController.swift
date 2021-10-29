//
//  ViewController.swift
//  shoppingCart
//
//  Created by JOHN BRUCKER on 10/21/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var label: UILabel!
    var array : [String] = []
    var price : [Double] = []
    var alert = UIAlertController(title: "NOOOOOOO", message: "Same thing noooooo", preferredStyle: .alert)
    
    
    //var timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)

    //var runCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        if let items = UserDefaults.standard.data(forKey: "theCart") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([String].self, from: items){
                array = decoded
            }
        }
        if let items2 = UserDefaults.standard.data(forKey: "thePrice") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Double].self, from: items2){
                price = decoded
            }
        }
        alert.addAction(UIAlertAction(title: "bet", style: .default, handler: nil))

        //this is ALL wrong luv mason <3
        
    }
    @IBAction func button(_ sender: Any) {
        if textField1.text == "" || textField2.text == ""{
            label.text = "Put something in idiot"
        } else if array.contains(textField1.text!){
            present(alert, animated: true, completion: nil)
        }else{
            array.append(textField1.text!)
            price.append(Double(textField2.text!)!)
            //fireTimer()
            label.text = "Added \(textField1.text!)"
            
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(array){
                UserDefaults.standard.set(encoded, forKey: "theCart")
            }
            if let encoded = try? encoder.encode(price){
                UserDefaults.standard.set(encoded, forKey: "thePrice")
            }
            
            
            
            
            
            
        }
    }
    
    @IBAction func cart(_ sender: Any) {
        performSegue(withIdentifier: "segue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! ViewController2
        nvc.array = array
        nvc.price = price
    }
    
    @IBAction func unwind(_ seg: UIStoryboardSegue) {
    }
    /*
    @objc func fireTimer() {
        label.text = "Added"
        runCount += 1

        if runCount == 2 {
            label.text = ""
            timer.invalidate()
            runCount = 0
        }
    }
     */
}

