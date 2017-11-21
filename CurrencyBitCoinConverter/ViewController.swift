//
//  ViewController.swift
//  CurrencyBitCoinConverter
//
//  Created by Practica on 1/11/17.
//  Copyright © 2017 UTADEO. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var currencyPickerView: UIPickerView!
    
    private let modelo = model()
    
    var finalURL : String?
    var currentRow : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPickerView.delegate = self
        currencyPickerView.dataSource = self
       
    }
    
    //MARK: - Picker Delegate Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return modelo.numElements()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return modelo.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(modelo.currencyArray[row])
        finalURL = modelo.baseURL + modelo.currencyArray[row]
        getBitcoinData(url: finalURL!)
        currentRow = modelo.signos[row]
        
        
    }

    //MARK: - Networking
    
    func getBitcoinData(url: String)
    {
        Alamofire.request(url, method: .get).responseJSON { (response) in
            if response.result.isSuccess
            {
                let bitcoinJSON : JSON = JSON(response.result.value!)
                self.updateBitcoinData(json: bitcoinJSON)
            }
            else
            {
                print("Error: \(response.result.error)")
                self.labelPrice.text = "ERROR"
            }
        }
    }
    
    func updateBitcoinData(json: JSON)
        
    {
        if let bitcoinResult = json["ask"].double {
            let zeros = NumberFormatter()
            zeros.numberStyle = .decimal
            let currentNumber = zeros.string(from: NSNumber(value: bitcoinResult))
            labelPrice.text = currentRow!+currentNumber!
        }
        else
        {
            labelPrice.text = "Servicio no Disponible en este momento "
        }
    }
       
    
    
    
    
}

