//
//  ForecastViewController.swift
//  Trivia
//
//  Created by Jessica Cheng on 6/24/25.
//

import UIKit

struct Question {
    let text: String
    let answers: [String]
    let correctIndex: Int
}

class ForecastViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answerButton1: UIButton!
    
    @IBOutlet weak var answerButton2: UIButton!
    
    @IBOutlet weak var answerButton3: UIButton!
    
    @IBOutlet weak var answerButton4: UIButton!
    
    let questions: [Question] = [
        Question(text: "What is the world’s largest retailer?",
                 answers: ["Costco", "Whole Foods", "Walmart", "Target"],
                 correctIndex: 2),
        Question(text: "Which of the following best describes Newton's First Law of Motion?",
                 answers: ["An object will remain at rest or move at a constant velocity unless acted upon by an external force", "Force equals mass times acceleration", "For every action, there is an equal and opposite reaction", "The gravitational force between two objects is proportional to the product of their masses and inversely proportional to the square of the distance between them"],
                 correctIndex: 0),
        Question(text: "Who wrote '1984'?",
                 answers: ["George Orwell", "Hemingway", "Shakespeare", "Twain"],
                 correctIndex: 0)
    ]

    var currentQuestionIndex = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayQuestion()
    }
    
    func displayQuestion() {
        let currentQuestion = questions[currentQuestionIndex]
        let displayText = "Question \(currentQuestionIndex + 1)/3\n\(currentQuestion.text)"
            questionLabel.text = displayText

        answerButton1.setTitle(currentQuestion.answers[0], for: .normal)
        answerButton2.setTitle(currentQuestion.answers[1], for: .normal)
        answerButton3.setTitle(currentQuestion.answers[2], for: .normal)
        answerButton4.setTitle(currentQuestion.answers[3], for: .normal)

        // Ensure buttons are visible in case of restart
        answerButton1.isHidden = false
        answerButton2.isHidden = false
        answerButton3.isHidden = false
        answerButton4.isHidden = false
    }

    
    @IBAction func answerTapped(_ sender: UIButton) {
            var selectedIndex = -1
            if sender == answerButton1 {
                selectedIndex = 0
            } else if sender == answerButton2 {
                selectedIndex = 1
            } else if sender == answerButton3 {
                selectedIndex = 2
            } else if sender == answerButton4 {
                selectedIndex = 3
            }

            checkAnswer(index: selectedIndex)
        }

        // MARK: - Answer Logic
        func checkAnswer(index: Int) {
            if index == questions[currentQuestionIndex].correctIndex {
                score += 1
            }

            currentQuestionIndex += 1

            if currentQuestionIndex < questions.count {
                displayQuestion()
            } else {
                questionLabel.text = "You got \(score)/\(questions.count) correct!"
                answerButton1.isHidden = true
                answerButton2.isHidden = true
                answerButton3.isHidden = true
                answerButton4.isHidden = true
            }
        }
}
