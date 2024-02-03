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
    @IBOutlet var rangedLalbels: [UILabel]!
    @IBOutlet var rangedSlider: UISlider!
    
    // MARK: - Private Properties
    private var questionIndex = 0
    private let questions = Question.getQuestion()
    private var answerChosen: [Answer] = []
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        let answersCount = Float(currentAnswers.count - 1)
        rangedSlider.maximumValue = answersCount
        rangedSlider.minimumValue = answersCount/2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    }
    
    // MARK: - IB Actions
    @IBAction func singleQuestionButtonPressed(_ sender: UIButton) {
        guard let buttonIndex = singleButtons.firstIndex(of: sender) else {return}
         let currentAnswer = currentAnswers[buttonIndex]
        answerChosen.append(currentAnswer)
        nextQuestion()
    }
    
    @IBAction func multipleQuestionButtonPressed() {
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers){
            if multipleSwitch.isOn{
                answerChosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedQuestionButtonPressed() {
        let index = lrintf(rangedSlider.value)
        answerChosen.append(currentAnswers[index])
        nextQuestion()
    }
    
}

// MARK: - Private Methods
private extension QuestionsViewController {
    func updateUI() {
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        // Set Navigation title
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        // Get current question
        let currentQuestion = questions[questionIndex]
        
        // Set current question for question
        questionLabel.text = currentQuestion.title
        
        // Calculate progress
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        questionProgressView.setProgress(totalProgress, animated: true)
        
        showCurrentAnswers( for: currentQuestion.type)
    }
    
    
    /// Choice of answewrs category
    ///
    /// Displaying answers to a question according to a category
    ///
    /// - Parameter type: Specifies the category of response
    func showCurrentAnswers(for type: ResponseType) {
        switch type {
            case .single: showSingleStackView(with: currentAnswers)
            case .multiple: showMultipleStackView(with: currentAnswers)
            case .ranged: showRangesdStackView(with: currentAnswers)
        }
    }
    
    func showSingleStackView (with answers: [Answer]) {
        singleStackView.isHidden.toggle()
        
        for (button, answer) in zip(singleButtons,answers){
            button.setTitle(answer.title, for: .normal)
        }
    }
    func showMultipleStackView(with answers: [Answer]){
        multipleStackView.isHidden.toggle()

        for (label, answer) in zip(multipleLabels,answers){
            label.text = answer.title
        }
    }
    func showRangesdStackView (with answers: [Answer]) {
        rangedStackView.isHidden.toggle()
        
        rangedLalbels.first?.text = answers.first?.title
        rangedLalbels.last?.text = answers.last?.title
    }
    
    func nextQuestion (){
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
            return
        }
     
        performSegue(withIdentifier: "ShowResult", sender: nil)
    }
}
