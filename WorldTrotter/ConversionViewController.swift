//
//  ViewController.swift
//  WorldTrotter
//
//  Created by LangHui He on 8/30/21.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet { updateCelsiusLabel() }
    }
    var celsiusValue:Measurement<UnitTemperature>? {
        if let f = fahrenheitValue {
            return f.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // print("Current text: \(String(describing: textField.text))")
        // print("Replacement text: \(string)")
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")

        if existingTextHasDecimalSeparator != nil ,
            replacementTextHasDecimalSeparator != nil {
            return false
        }
        
        return true
    }
    
    @IBAction func fahrenheitFieldEditingChanged(_ sender: UITextField) {
        /*
        if let text = textField.text, !text.isEmpty {
            celsiusLabel.text = text
        } else {
            celsiusLabel.text = "???"
        }
        */
        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
        
        updateCelsiusLabel()
    }
    
    func updateCelsiusLabel() {
        let numberFormatter: NumberFormatter = {
            let nf = NumberFormatter()
                nf.numberStyle = .decimal
                nf.minimumFractionDigits = 0
                nf.maximumFractionDigits = 1
            return nf
        }()

        if let celsiusValue = celsiusValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }

    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ConversionViewController loaded its view.")
        /*
        let firstFrame = CGRect(x : 160, y: 240, width: 100, height: 150)
        let firstView = UIView(frame: firstFrame)
        firstView.backgroundColor = UIColor.blue
        view.addSubview(firstView)
        
        let secondFrame = CGRect(x: 20, y: 30, width: 50, height: 50)
        let secondView = UIView(frame: secondFrame)
        secondView.backgroundColor = UIColor.green
        // view.addSubview(secondView)
        firstView.addSubview(secondView)
        */
        
        updateCelsiusLabel()
    }
}
