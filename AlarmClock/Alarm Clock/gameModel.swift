//
//  gameModel.swift
//  NumbersGame
//
//  Created by Michael Fan on 4/6/17.
//  Copyright © 2017 Michael Fan. All rights reserved.
//

import Foundation

class gameModel {
    var numButton1 = 0
    var numButton2 = 0
    var numButton3 = 0
    var numButton4 = 0
    var numParams = 0
    
    var num1 = 0
    var num2 = 0
    var num3 = 0
    var num4 = 0
    var op1 = "+"
    var op2 = "+"
    var op3 = "+"
    var userInput : String = ""
    var justChosen = ""
    
    func initGame() {
        let low : UInt32 = 1
        numButton1 = Int(arc4random_uniform(13) + low);
        numButton2 = Int(arc4random_uniform(13) + low);
        numButton3 = Int(arc4random_uniform(13) + low);
        numButton4 = Int(arc4random_uniform(13) + low);
        userInput = ""
        justChosen = ""
        numParams = 0
    }
    
    func clearInput() {
        userInput = ""
        numParams = 0
    }
    
    func setUserInput(s: String) {
        userInput = s
    }
    
    func updateGame() -> Bool {
        if (numParams > 6) {
            return false
        }
        
        if (numParams % 2 == 1) {
            if (justChosen != "+" && justChosen != "-" && justChosen != "x" && justChosen != "/") {
                return false
            }
            
        } else {
            let num = Int(justChosen)
            if (num == nil) {
                return false
            }
        }
        
        userInput += justChosen
        numParams += 1
        
        let length = numParams
        if (length == 1) {
            num1 = Int(justChosen)!
        } else if (length == 2) {
            op1 = justChosen
        } else if (length == 3) {
            num2 = Int(justChosen)!
        } else if (length == 4) {
            op2 = justChosen
        } else if (length == 5) {
            num3 = Int(justChosen)!
        } else if (length == 6) {
            op3 = justChosen
        } else if (length == 7) {
            num4 = Int(justChosen)!
        }
        
        return true
    }
    
    func checkGame() -> Bool {
//        if (numParams != 7) {
//            return false
//        }
        
        var string = "\(num1)"
        if (op1 == "+") {
            string += "+\(num2)"
        } else if (op1 == "-") {
            string += "-\(num2)"
        } else if (op1 == "x") {
            string += "*\(num2)"
        } else {
            string += "/\(num2)"
        }
        
        if (op2 == "+") {
            string += "+\(num3)"
        } else if (op2 == "-") {
            string += "-\(num3)"
        } else if (op2 == "x") {
            string += "*\(num3)"
        } else {
            string += "/\(num3)"
        }
        
        if (op3 == "+") {
            string += "+\(num4)"
        } else if (op1 == "-") {
            string += "-\(num4)"
        } else if (op1 == "x") {
            string += "*\(num4)"
        } else {
            string += "/\(num4)"
        }
        

        let exp: NSExpression = NSExpression(format: string)
        let result: Double = exp.expressionValue(with: nil, context: nil) as! Double
        if (result == 24) {
            return true
        }
        return false
        
    }
}
