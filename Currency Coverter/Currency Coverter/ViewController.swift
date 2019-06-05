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
       cadButton.isSelected = true
    }
    
    enum CurrencyType {
        case cad
        case peso
    }
    
    var currencyType: CurrencyType = .cad
    
    @IBAction func convertButtonPressed(_ sender: Any) {
        guard let currency = fromCurrencyTextField.text,
            let dollarAmount = Double(currency) else {
                return
        }
        toCurrencyTextField.text = String( convert(dollars: dollarAmount , to: currencyType))
    }
        
    @IBAction func pesoButtonPressed(_ sender: Any) {
        toggleCurrency()
    }
    
    @IBAction func cadButtonPressed(_ sender: Any) {
        toggleCurrency()
    }
    
    func toggleCurrency() {
        // change label based on currency selected
        // toggle button when clicked
        // select the correct currency
        
        cadButton.isSelected.toggle()
        pesoButton.isSelected.toggle()
        
        if cadButton.isSelected {
            currencyType = .cad
            toCurrencyLabel.text = "Currency (CAD)"
        } else {
            currencyType = .peso
            toCurrencyLabel.text = "Currency (Peso)"
        }
    }
    
    
    func convert (dollars: Double, to unit: CurrencyType) -> Double {
        
        if unit == CurrencyType.cad {
           return dollars * (1.35)
        } else if unit == CurrencyType.peso {
            return dollars * (19.78)
        }
        return 0.0
    }
}

