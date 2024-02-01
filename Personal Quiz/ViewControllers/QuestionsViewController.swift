//
//  ViewController.swift
//  Personal Quiz
//
//  Created by Максим Сылка on 19.01.2024.
//

import UIKit

final class QuestionsViewController: UIViewController {
    // MARK: - IB Outlets
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
    
    // MARK: - Private Properties
    private var questionIndex = 0
    private let questions = Question.getQuestion()
    private var answers: [Answer] {
        questions[questionIndex].answers
    }
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    // MARK: - IB Actions
    @IBAction func singlequestionButtonPressed(_ sender: UIButton) {
    }
    
    @IBAction func multipleQuestionButtonPressed() {
    }
    @IBAction func rangedQuestionButtonPressed() {
    }
    
}

// MARK: - Private Methods
private extension QuestionsViewController {
    func updateUI() {
        for stackView in [singleStackView, multipleStackView, rangedStackView]{
            stackView?.isHidden = true
        }
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        let currentQuestion = questions[questionIndex]
        
        questionLabel.text = currentQuestion.title
        
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        questionProgressView.setProgress(
            totalProgress,
            animated: true
        )
        
        showCurrentQuestionAnswers( for: currentQuestion.type)
    }
    
    
    /// Choice of answewrs category
    ///
    /// Displaying answers to a question according to a category
    ///
    /// - Parameter type: Specifies the category of response
    func showCurrentQuestionAnswers(for type: ResponseType) {
        switch type {
            case .single: showSingleStackView(with: answers)
            case .multiple: break
            case .ranged: break
        }
    }
    
    func showSingleStackView (with answers: [Answer]) {
        singleStackView.isHidden.toggle()
        
        for (button, answer) in zip(singleButtons,answers){
            
        }
    }
}
