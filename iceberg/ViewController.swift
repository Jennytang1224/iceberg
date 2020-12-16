//
//  ViewController.swift
//  iceberg
//
//  Created by Jenny Tang on 12/14/20.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    

    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    

    @IBOutlet weak var amountPerPersonLabel: UILabel!

    @IBOutlet weak var sliderValueLabel: UILabel!
    
    @IBOutlet weak var numberOfSplitsSlider: UISlider!
    
    var total : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    @IBAction func calcTip(_ sender: Any) {
        // get the bill amount
        let bill = Double(billField.text!) ?? 0
    
        // calc the tip and total1
        let tipPercentages = [0.15,0.18,0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        total = bill + tip
        
        // update the tip and total label
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "%.2f", total)
    }

    @IBAction func slideNumOfPeople(_ sender: Any) {
        let numberOfPeople = Double(round(numberOfSplitsSlider.value))
        sliderValueLabel.text = String(numberOfPeople)

        total = Double(totalLabel.text!) ?? 0
        //print(total1)
        
        // calculate amount per person
        let amountPerPerson = (total/numberOfPeople)
        // update amount per person
        amountPerPersonLabel.text = String(format: "%.2f", amountPerPerson)
    }
    
    
}

