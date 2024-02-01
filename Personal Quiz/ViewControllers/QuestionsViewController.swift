//
//  ViewController.swift
//  Personal Quiz
//
//  Created by Максим Сылка on 19.01.2024.
//

import UIKit

final class QuestionsViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var questionProgressView: UIProgressView!
    
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButtons: [UIButton]!
    
    @IBOutlet var multipleStackView: UIStackView!
    
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabels: UIStackView!
    @IBOutlet var rangedSlider: UISlider!
    
    
    private let questions = Question.getQuestion()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func singlequestionButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func multipleQuestionButtonPressed() {
    }
    @IBAction func rangedQuestionButtonPressed() {
    }
    
}

