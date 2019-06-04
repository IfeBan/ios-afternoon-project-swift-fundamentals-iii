//
//  ViewController.swift
//  Currency Coverter
//
//  Created by Lambda_School_Loaner_101 on 6/3/19.
//  Copyright © 2019 Ife Banire. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    
    @IBOutlet weak var pesoButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    enum CurrencyType {
        case cad
        case peso
    }
    var currencyType: CurrencyType = .cad
    
    
    @IBAction func convertButtonPressed(_ sender: Any) {
        toCurrencyTextField.text = String(convert(dollars: convertFunc(currency: fromCurrencyTextField.text), to: currencyType))
    }
        
    @IBAction func pesoButtonPressed(_ sender: Any) {
        toCurrencyTextField.text = "Currency (Peso)"
        pesoButton.isSelected.toggle()
    }
    
    
    @IBAction func cadButtonPressed(_ sender: Any) {
        toCurrencyTextField.text = "Currency (CAD)"
        cadButton.isSelected.toggle()
    }
    
    func convertFunc(currency: String?) -> Double {
        guard let currencyText = currency else {
            return 0.0
            
        }
        return Double(currencyText)!
    }
    
    func convert (dollars: Double, to unit: CurrencyType) -> Double {
        guard let currency = fromCurrencyTextField.text else {
            return 1.0
        }
        if unit == CurrencyType.cad {
           return Double(currency)! * (1.35)
        } else if unit == CurrencyType.peso {
            return Double(currency)! * (19.78)
        }
        return 0.0
    }
}

