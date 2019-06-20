//
//  ViewController.swift
//  IMC
//
//  Created by Anderson Souza on 16/03/19.
//  Copyright © 2019 Anderson Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var WeightTF: UITextField!
    @IBOutlet weak var ResultLB: UILabel!
    @IBOutlet weak var HeightTF: UITextField!
    @IBOutlet weak var ResultIV: UIImageView!
    var imc: Double = 0
    
    @IBOutlet weak var ResultVI: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    @IBAction func calculate(_ sender: Any) {
        if let  weight = Double(WeightTF.text!), let height = Double(HeightTF.text! ){
            imc = weight / pow(height,2)
        }
        showResults()
    }
    
    func showResults() {
        var result: String = ""
        var image: String = ""
        
        switch imc {
            case 0..<16:
                result = "Magreza"
                image = "abaixo"
            case 16..<18.5:
                result = "Abaixo do Peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso Ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobrepeso"
                image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        
        ResultLB.text = "\(Int(imc)): \(result)"
        ResultIV.image = UIImage(named: image)
        ResultVI.isHidden = false
        view.endEditing(true)
        
    }
    

}

