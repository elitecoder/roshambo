//
//  StartPlayViewController.swift
//  Roshambo
//
//  Created by Mukul Sharma on 10/5/16.
//  Copyright © 2016 Mukul Sharma. All rights reserved.
//

import UIKit

class StartPlayViewController: UIViewController {

	var userMove:String!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

	@IBAction func playRock(_ sender: AnyObject) {
		let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
		vc.userMove = "Rock"
		present(vc, animated: true, completion: nil)
	}
	
	@IBAction func playPaper(_ sender: AnyObject) {
		userMove = "Paper"
		
		performSegue(withIdentifier: "resultSegue", sender: sender)
	}
	
	@IBAction func playScissors(_ sender: AnyObject) {
		userMove = "Scissors"
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if (segue.identifier == "resultSegue") {
			let vc = segue.destination as! ResultViewController
			
			let button:UIButton! = sender as! UIButton
			vc.userMove = ResultViewController.moves[button.tag]!
		}
	}
}
