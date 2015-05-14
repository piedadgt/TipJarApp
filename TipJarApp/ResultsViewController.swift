//
//  ResultsViewController.swift
//  TipJarApp
//
//  Created by Piedad Garnica on 5/8/15.
//  Copyright (c) 2015 Piedad Garnica. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalOutputLabel: UILabel!
    
    @IBOutlet weak var perPersonOutputLabel: UILabel!
    
    @IBOutlet weak var tipPercentageOutputLabel: UILabel!
    
    @IBOutlet weak var tipJarImageView: UIImageView!
    
    @IBAction func swipeDownGestureRecognizer(sender: UISwipeGestureRecognizer) {
        
        self.shakingJar()
        
        self.increaseTotal()
        
    }
    

    @IBAction func swipeUpGestureRecognizer(sender: UISwipeGestureRecognizer) {
        
        self.shakingJar()
        
        self.decreaseTotal()
        
    }
    
    
    var totalOutput: Double!
    
    var perPersonOutput: Double!
    
    var tipPercentage: Double!
    
    var numberOfPeople: Double!
    
    var subTotal: Double!
    
    var newPerPersonOutput: Double!
    
    var tax: Double!
    
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        totalOutputLabel.text = String(format: "$%.2f", totalOutput ?? 0)
        
        perPersonOutputLabel.text = String(format: "$%.2f", perPersonOutput ?? 0)
        
        tipPercentageOutputLabel.text = String(format: "%.2f", ((tipPercentage - 1) * 100) ?? 0)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Animation that makes the jar "Shake"
    
    func shakingJar() {
        
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation")
        
        animation.values = [0, 0.2, -0.2, 0.1, -0.1, 0]
        
        animation.keyTimes = [0, 0.2, 0.4, 0.6, 0.8, 0.9, 1]
        
        animation.duration = 1.0
        
        tipJarImageView.layer.addAnimation(animation, forKey: "trasform.rotation")

    }
    
    //Increases the total per person by $1 and recalculates the total and tip percentage
    
    func increaseTotal () {
        
        newPerPersonOutput = perPersonOutput + 1
        
        totalOutput = newPerPersonOutput * Double(numberOfPeople)
        
        tipPercentage = ((totalOutput - subTotal - (subTotal * (tax - 1))) / subTotal) + 1
        
        
        println("Results: increaseTotal: perPersonOutput \(perPersonOutput)")
        
        println("Results: increaseTotal: newPerPersonOutput \(newPerPersonOutput)")
        
        println("Results: increaseTotal: totalOutput \(totalOutput)")
        
        println("Results: increaseTotal: subTotal \(subTotal)")
        
        println("Results: increaseTotal: tax \(tax)")
        
        println("Results: increaseTotal: tipPercentage \(tipPercentage)")

        
        totalOutputLabel.text = String(format: "$%.2f", totalOutput)
        
        perPersonOutputLabel.text = String(format: "$%.2f", newPerPersonOutput)
        
        tipPercentageOutputLabel.text = String(format: "%.2f", (tipPercentage - 1) * 100)
        
        
        perPersonOutput = newPerPersonOutput
        
    }
    
    //Decreases the total per person by $1 and recalculates the total and tip percentage
    
    func decreaseTotal() {
        
        newPerPersonOutput = perPersonOutput - 1
        
        totalOutput = newPerPersonOutput * Double(numberOfPeople)
        
        tipPercentage = ((totalOutput - subTotal - (subTotal * (tax - 1))) / subTotal) + 1
        
        
        println("Results: increaseTotal: perPersonOutput \(perPersonOutput)")
        
        println("Results: increaseTotal: newPerPersonOutput \(newPerPersonOutput)")
        
        println("Results: increaseTotal: totalOutput \(totalOutput)")
        
        println("Results: increaseTotal: subTotal \(subTotal)")
        
        println("Results: increaseTotal: tax \(tax)")
        
        println("Results: increaseTotal: tipPercentage \(tipPercentage)")
        
        
        totalOutputLabel.text = String(format: "$%.2f", totalOutput)
        
        perPersonOutputLabel.text = String(format: "$%.2f", newPerPersonOutput)
        
        tipPercentageOutputLabel.text = String(format: "%.2f", (tipPercentage - 1) * 100)
        
        
        perPersonOutput = newPerPersonOutput


        
    }

}
