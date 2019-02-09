//
//  StatisticsViewController.swift
//  Match the Members
//
//  Created by Sam Lee on 2/8/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {
    
    var longestStreakLabel : UILabel!
    var maxStreakScore : Int!
    var lastThreeResults : [String]!
    var lastThreeResultsLabel : UILabel!
    var backButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //var resultsList = MainViewController().listOfResults
        view.backgroundColor = UIColor(red:1.00, green:0.85, blue:0.24, alpha:1.0)
        
        backButton = UIButton(frame: CGRect(x: 50, y: 100, width: 40, height: 40))
        backButton.setImage(UIImage(named: "left-arrow"), for: .normal)
        backButton.contentMode = .scaleAspectFit
        backButton.addTarget(self, action: #selector(backClicked), for: .touchUpInside)
        view.addSubview(backButton)
        
        longestStreakLabel = UILabel(frame: CGRect(x: view.frame.width / 2 - 120, y: view.frame.height / 2 - 120 , width: 250, height: 50))
        longestStreakLabel.backgroundColor = UIColor(red:0.35, green:0.74, blue:0.98, alpha:1.0)
        longestStreakLabel.layer.cornerRadius = 25
        longestStreakLabel.textColor = .white
        longestStreakLabel.textAlignment = NSTextAlignment.center
        longestStreakLabel.text = "Longest Streak Score: \(maxStreakScore!)"
        view.addSubview(longestStreakLabel)
        
        
        
        lastThreeResultsLabel = UILabel(frame: CGRect(x: 0, y: view.frame.height / 2 - 60, width: view.frame.width, height: 200))
        lastThreeResultsLabel.textColor = .black
        lastThreeResultsLabel.backgroundColor = UIColor(red:1.00, green:0.85, blue:0.24, alpha:1.0)
        lastThreeResultsLabel.textAlignment = NSTextAlignment.center
        lastThreeResultsLabel.numberOfLines = 0
        
        var Results = "Your last 3 results: \n"
        for result in lastThreeResults {
            Results += "\n \(result)"
        }
        lastThreeResultsLabel.text = Results
        view.addSubview(lastThreeResultsLabel)
        
        print(lastThreeResults)
        print(Results)
//        
//        if (resultsList?.count)! <= 3 {
//            lastThreeResults.text = "\(resultsList)"
//            }
//        else {
//            lastThreeResults.text = "\(resultsList?.suffix(3))"
//        }
        }
    @objc func backClicked() {
        self.dismiss(animated: true, completion: nil)
        
        
    }

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


