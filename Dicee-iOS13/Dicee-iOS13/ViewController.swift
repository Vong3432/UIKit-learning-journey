//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    private let dices = [
        "DiceOne", "DiceTwo", "DiceThree",
        "DiceFour", "DiceFive", "DiceSix"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeDiceImage(for: diceImageView1, with: "DiceOne")
        changeDiceImage(for: diceImageView2, with: "DiceTwo")
    }
    
    func getRandomDice() -> String {
        return dices.randomElement()!
    }
    
    @IBAction func onRollBtnPressed(_ sender: UIButton) {
        let newDice1 = getRandomDice()
        let newDice2 = getRandomDice()
        
        changeDiceImage(
            for: diceImageView1,
            with: newDice1
        )
        changeDiceImage(
            for: diceImageView2,
            with: newDice2
        )
    }
    
    private func changeDiceImage(
        for imageView: UIImageView,
        with name: String
    ) {
        imageView.image = UIImage(named: name)
    }
}
