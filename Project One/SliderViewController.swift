//
//  SliderViewController.swift
//  Project One
//
//  Created by LangHui on 9/15/21.
//

import UIKit
class SliderViewController: UIViewController {
    
    @IBOutlet var number1: UILabel!
    @IBOutlet var number2: UILabel!
    
    @IBOutlet var equal: UILabel!
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        number1.text = "$\(currentValue)"
        calculation()
    }
    
    
    @IBAction func secondSliderValueChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        number2.text = "$\(currentValue)"
        calculation()
    }
    
    @IBOutlet var x: UISlider!
    @IBOutlet var y: UISlider!
    
    func calculation() {
        let a = Int(x.value)
        let b = Int(y.value)
        let currentValue = a * b
        equal.text = "$\(currentValue)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SliderViewController loaded its view.")
    }
}
