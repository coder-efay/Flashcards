//
//  ViewController.swift
//  Flashcards
//
//  Created by Cora Xing on 10/26/18.
//  Copyright © 2018 Cora Yichen Xing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var btnOptionOne: UIButton!
    @IBOutlet weak var btnOptionTwo: UIButton!
    @IBOutlet weak var btnOptionThree: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Change appearance of labels
        frontLabel.layer.cornerRadius = 30.0 // create rounded card
        frontLabel.clipsToBounds = true // clip front label inside
        backLabel.layer.cornerRadius = 30.0 // create rounded card
        backLabel.clipsToBounds = true // clip front label inside
        
        // Change appearance of cards
        card.layer.cornerRadius = 30.0 // create rounded card
        card.layer.shadowRadius = 15.0
        card.layer.shadowOpacity = 0.2
        
        // Change appearance of buttons
        
        // Button 1
        btnOptionOne.layer.cornerRadius = 15.0
        btnOptionOne.layer.borderWidth = 3
        btnOptionOne.layer.borderColor = #colorLiteral(red: 0.2790087163, green: 0.09912771732, blue: 0.324397862, alpha: 1)
        
        // Button 2
        btnOptionTwo.layer.cornerRadius = 15.0
        btnOptionTwo.layer.borderWidth = 3
        btnOptionTwo.layer.borderColor = #colorLiteral(red: 0.2790087163, green: 0.09912771732, blue: 0.324397862, alpha: 1)
        
        // Button 3
        btnOptionThree.layer.cornerRadius = 15.0
        btnOptionThree.layer.borderWidth = 3
        btnOptionThree.layer.borderColor = #colorLiteral(red: 0.2790087163, green: 0.09912771732, blue: 0.324397862, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        frontLabel.isHidden = !frontLabel.isHidden
        print("test")
    }
    
    @IBAction func didTapOptionOne(_ sender: Any) {
        btnOptionOne.isHidden = true
    }
    
    @IBAction func didTapOptionTwo(_ sender: Any) {
        frontLabel.isHidden = true
    }
    
    @IBAction func didTapOptionThree(_ sender: Any) {
        btnOptionThree.isHidden = true
    }
    
    @IBAction func didTapOutside(_ sender: Any) {
        // Resets flashcard settings
        frontLabel.isHidden = false
        btnOptionOne.isHidden = false
        btnOptionTwo.isHidden = false
        btnOptionThree.isHidden = false
        
    }
    
    func updateFlashcard(question: String, answer: String, extraAnswer1: String?, extraAnswer2: String?) {
        frontLabel.text = question
        backLabel.text = answer
        
        btnOptionOne.setTitle(extraAnswer1, for: .normal)
        btnOptionTwo.setTitle(answer, for: .normal)
        btnOptionThree.setTitle(extraAnswer2, for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // We know the destination of the segue is in the Navigation Controller
        let navigationController = segue.destination as! UINavigationController
        
        // We know the Navigation Controller only contains a Creation View Controller
        let creationController = navigationController.topViewController as! CreationViewController
        
        // We set the flashcardsController property to self
        creationController.flashcardsController = self
        
        // Set initial values if and only if segue's identifier is EditSegue
        if segue.identifier == "EditSegue" {
            creationController.initialQuestion = frontLabel.text
            creationController.initialAnswer = backLabel.text
            creationController.initialExtraAnswer1 = btnOptionOne.currentTitle
            creationController.initialExtraAnswer2 = btnOptionThree.currentTitle
        }
        
        
    }
}

