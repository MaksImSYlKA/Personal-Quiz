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
    private let questions = Question.getQuestion()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

