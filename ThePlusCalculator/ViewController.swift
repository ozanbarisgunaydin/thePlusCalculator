//
//  ViewController.swift
//  ThePlusCalculator
//
//  Created by Ozan Barış Günaydın on 6.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calculatorWorkings: UILabel!
    @IBOutlet weak var calculatorResults: UILabel!
    
    var workings: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

     clearAll()
    }
    func clearAll() {
        workings = ""
        calculatorWorkings.text = ""
        calculatorResults.text = ""
    }
    
    @IBAction func allClearTap(_ sender: Any) {
        clearAll()
    }
    @IBAction func backTop(_ sender: Any) {
        if (!workings.isEmpty) {
            workings.removeLast()
            calculatorWorkings.text = workings
        }
    }
    
    func addToWorkigns(value: String){
        workings = workings + value
        calculatorWorkings.text = workings
    }
    
    @IBAction func commaTap(_ sender: Any) {
        addToWorkigns(value: ".")
    }
    @IBAction func plusTap(_ sender: Any) {
        addToWorkigns(value: "+")
    }
    @IBAction func divideTap(_ sender: Any) {
        addToWorkigns(value: "/")
    }
    @IBAction func multiplyTao(_ sender: Any) {
        addToWorkigns(value: "*")
    }
    @IBAction func minusTap(_ sender: Any) {
        addToWorkigns(value: "-")
    }
    @IBAction func equalTap(_ sender: Any) {
        
        if validInput() == true {
            let expression = NSExpression(format: workings)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResults(result: result)
            calculatorResults.text = resultString
        } else {
            let alert = UIAlertController (title: "Geçersiz Giriş!", message: "Geçersiz bir giriş yaptınız lütfen matematiksel bir giriş sağlanyınız.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam.", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validInput () -> Bool {
        
        var count = 0
        var funcCharIndexes = [Int]()
        var previous: Int = -1
        
        for char in workings {
            if specialCharacter(char: char) {
                funcCharIndexes.append(count)
                print(1)
            } else {
                count += 1
                print(2)
            }
            for index in funcCharIndexes {
                if index == 0 {
                    print(3)
                    return false
                } else if (index - workings.count) >=  -1 {
                    print(4)
                    return false
                } else if previous != -1 {
                    if index - previous >= 1 {
                        print(5)
                        return false
                    } else {
                        print(6)
                        return true
                    }
                } else {
                    print(7)
                    previous = index
                }
            }
        }
        print(8)
        return true
    }
    
    func specialCharacter(char: Character) -> Bool {
        if char == "*"{
            return true
        } else if char == "/" {
            return true
        } else if char == "+" {
            return true
        } else if char == "-" {
            return true
        }else if char == "(" {
            return true
        }else if char == ")" {
            return true
        }else if char == "." {
            return true
        }else {
            return false
        }
    }
    
    func formatResults(result: Double) -> String {
        if (result.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format: "%.0f", result)
        } else {
            return String(format: "%.2f", result)
        }
    }
    
    @IBAction func rightParenthesisTap(_ sender: Any) {
        addToWorkigns(value: ")")
    }
    @IBAction func leftParenthesisTap(_ sender: Any) {
        addToWorkigns(value: "(")
    }
    @IBAction func zeroTap(_ sender: Any) {
        addToWorkigns(value: "0")
    }
    @IBAction func oneTap(_ sender: Any) {
        addToWorkigns(value: "1")
    }
    @IBAction func twoTap(_ sender: Any) {
        addToWorkigns(value: "2")
    }
    @IBAction func threeTap(_ sender: Any) {
        addToWorkigns(value: "3")
    }
    @IBAction func fourTap(_ sender: Any) {
        addToWorkigns(value: "4")
    }
    @IBAction func fiveTap(_ sender: Any) {
        addToWorkigns(value: "5")
    }
    @IBAction func sixTap(_ sender: Any) {
        addToWorkigns(value: "6")
    }
    @IBAction func sevenTap(_ sender: Any) {
        addToWorkigns(value: "7")
    }
    @IBAction func eightTap(_ sender: Any) {
        addToWorkigns(value: "8")
    }
    @IBAction func nineTap(_ sender: Any) {
        addToWorkigns(value: "9")
    }
    
    
    
    
    
}

