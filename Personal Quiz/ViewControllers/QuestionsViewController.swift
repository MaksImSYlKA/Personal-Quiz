//
//  ViewController.swift
//  Personal Quiz
//
//  Created by Максим Сылка on 19.01.2024.
//

import UIKit

final class QuestionsViewController: UIViewController {

    private let questions = Question.getQuestion()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

