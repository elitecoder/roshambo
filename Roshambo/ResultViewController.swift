//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Mukul Sharma on 10/5/16.
//  Copyright © 2016 Mukul Sharma. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

	static let moves: [Int:String] = [
		0: "Rock",
		1: "Paper",
		2: "Scissors"
	]

	@IBOutlet weak var imageView: UIImageView!
	
	@IBOutlet weak var resultLabel: UILabel!
	
	var paperCoversRock = "Paper covers Rock!"
	var rockCrushesScissors = "Rock crushes Scissors!"
	var scissorsCutPaper = "Scissors cut Paper!"
	var youWin = "You win."
	var youLose = "You lose."
	
	var result: String = ""
	var opponentMove: String = ""
	var image: UIImage!
	var userMove: String = ""
	
	func generateRandomOpponentMove() {
		opponentMove = ResultViewController.moves[Int(arc4random_uniform(3))]!
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		generateRandomOpponentMove()
		
		if (userMove == opponentMove) {
			result = "Its a tie! Try again!"
			image = #imageLiteral(resourceName: "itsATie")
		}
		else {
			getResult(user: userMove, opponent: opponentMove)
		}
		
		print(result)
		
		imageView.image = image
		resultLabel.text = result
    }
	
	@IBAction func playAgain(_ sender: AnyObject) {
		dismiss(animated: true, completion: nil)
	}
	
	func getResult(user:String, opponent:String) {
		if (user == "Rock") { // Rock
			if (opponent == "Paper") { // Paper
				result = paperCoversRock + " " + youLose
				image = #imageLiteral(resourceName: "PaperCoversRock")
			}
			else { // opponent == Scissors
				result = rockCrushesScissors + " " + youWin
				image = #imageLiteral(resourceName: "RockCrushesScissors")
			}
		}
		else if (user == "Paper") { // Paper
			if (opponent == "Rock") { // Rock
				result = paperCoversRock + " " + youWin
				image = #imageLiteral(resourceName: "PaperCoversRock")
			}
			else { // opponent == Scissors
				result = scissorsCutPaper + " " + youLose
				image = #imageLiteral(resourceName: "ScissorsCutPaper")
			}
		}
		else { // user == Scissors
			if (opponent == "Rock") { // Rock
				result = rockCrushesScissors + " " + youLose
				image = #imageLiteral(resourceName: "RockCrushesScissors")
			}
			else { // opponent == Paper
				result = scissorsCutPaper + " " + youWin
				image = #imageLiteral(resourceName: "ScissorsCutPaper")
			}
		}
	}
}
