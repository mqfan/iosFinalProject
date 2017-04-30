//
//  ViewController.swift
//  Numbers Game
//
//  Created by Michael Fan on 4/6/17.
//  Copyright © 2017 Michael Fan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var game = gameModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        shuffle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var num1: UIButton!
    
    @IBOutlet weak var num2: UIButton!
    
    @IBOutlet weak var num3: UIButton!
    
    @IBOutlet weak var num4: UIButton!
    
    @IBAction func numButton1(_ sender: UIButton) {
        
        game.justChosen = (num1.titleLabel?.text)!
        if (game.updateGame()) {
            userInput.text = userInput.text! + game.justChosen
        }
        
    }
    
    @IBAction func numButton2(_ sender: UIButton) {
        game.justChosen = (num2.titleLabel?.text)!
        if (game.updateGame()) {
            userInput.text = userInput.text! + game.justChosen
        }
    }
    
    @IBAction func numButton3(_ sender: UIButton) {
        game.justChosen = (num3.titleLabel?.text)!
        if (game.updateGame()) {
            userInput.text = userInput.text! + game.justChosen
        }
    }
    
    @IBAction func numButton4(_ sender: UIButton) {
        game.justChosen = (num4.titleLabel?.text)!
        if (game.updateGame()) {
            userInput.text = userInput.text! + game.justChosen
        }
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        game.justChosen = "+"
        if (game.updateGame()) {
            userInput.text = userInput.text! + game.justChosen
        }
    }
    
    @IBAction func subtractButton(_ sender: UIButton) {
        game.justChosen = "-"
        if (game.updateGame()) {
            userInput.text = userInput.text! + game.justChosen
        }
    }
    
    @IBAction func multiplyButton(_ sender: UIButton) {
        game.justChosen = "x"
        if (game.updateGame()) {
            userInput.text = userInput.text! + game.justChosen
        }
    }
    
    @IBAction func divideButton(_ sender: UIButton) {
        game.justChosen = "/"
        if (game.updateGame()) {
            userInput.text = userInput.text! + game.justChosen
        }
    }
    
    @IBAction func clearUserInput(_ sender: UIButton) {
        userInput.text = ""
        game.clearInput()
    }
    
    
    @IBOutlet weak var userInput: UILabel!
    
    
    
    @IBAction func checkUserInput(_ sender: UIButton) {
        game.setUserInput(s: userInput.text!)
        if game.checkGame() {
            print("won")
        }
    }
    
    
    @IBAction func shuffleNumbers(_ sender: UIButton) {
        game.initGame()
        shuffle()
    }
    
    func shuffle() {
        game.initGame()
        userInput.text = ""
        num1.setTitle(String(game.numButton1), for: .normal)
        num2.setTitle(String(game.numButton2), for: .normal)
        num3.setTitle(String(game.numButton3), for: .normal)
        num4.setTitle(String(game.numButton4), for: .normal)
    }

}

