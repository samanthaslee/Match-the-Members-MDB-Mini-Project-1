//
//  MainViewController.swift
//  Match the Members
//
//  Created by Sam Lee on 2/7/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    var memberImageView : UIImageView!
    var memberImageName : String!
    var correctMemberName : String!
    var listofmembers : [String]!
    var correctButton : UIButton!
    var randomName1 : String!
    var randomName2 : String!
    var randomName3 : String!
    var randomName0 : String!
    var randomName0Button: UIButton!
    var randomName1Button : UIButton!
    var randomName2Button : UIButton!
    var randomName3Button : UIButton!
    
    var colorTimer : Timer!
    var timer : UILabel!
    var timerfunc : Timer!
    var timerCount = 5

    
    var scoreLabel : UILabel!
    var score = 0
    
    var statisticsButton : UIButton!

    var currentStreak = 0
    var bestStreak = 0
    var listOfResults : [String]!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        timerfunc = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MainViewController.timerCountDown), userInfo: nil, repeats: true)
        timerCount = 5
        generalFunction()
        

    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        timerCount = 5
        listOfResults = []
        
        statisticsButton = UIButton(frame: CGRect(x: 330, y: 100, width: 40, height: 40))
        statisticsButton.setImage(UIImage(named: "pausebutton"), for: .normal)
        statisticsButton.contentMode = .scaleAspectFit
        statisticsButton.addTarget(self, action: #selector(statisticsClicked), for: .touchUpInside)
        view.addSubview(statisticsButton)
        
        timer = UILabel(frame: CGRect(x: view.frame.width / 2 - 50, y: 175, width: 100, height: 100))
        timer.textColor = UIColor(red:1.00, green:0.85, blue:0.24, alpha:1.0)
        timer.textAlignment = NSTextAlignment.center
        timer.backgroundColor = .white
        timer.font = UIFont.systemFont(ofSize: 100)
        view.addSubview(timer)
        
        scoreLabel = UILabel(frame: CGRect(x: view.frame.width / 2 - 50, y: 275, width: 100, height: 50))
        scoreLabel.backgroundColor = .white
        scoreLabel.textColor = UIColor(red:0.35, green:0.74, blue:0.98, alpha:1.0)
        scoreLabel.textAlignment = NSTextAlignment.center
        scoreLabel.font = UIFont.boldSystemFont(ofSize : 16.0)
        scoreLabel.font = UIFont.systemFont(ofSize: 25)
        view.addSubview(scoreLabel)
        
        memberImageView = UIImageView(frame: CGRect(x: view.frame.width / 2 - 100, y: 350, width: 200, height: 200))
        memberImageView.contentMode = .scaleAspectFit
        view.addSubview(memberImageView)
        
        randomName0Button = UIButton(frame: CGRect(x: memberImageView.frame.minX, y: memberImageView.frame.maxY + 40, width: 200, height: 50))
        randomName0Button.backgroundColor = UIColor(red:0.35, green:0.74, blue:0.98, alpha:1.0)
        randomName0Button.titleLabel?.numberOfLines = 0
        randomName0Button.titleLabel?.lineBreakMode = .byWordWrapping
        randomName0Button.layer.cornerRadius = 10
        randomName0Button.addTarget(self, action: #selector(colorChanger(sender:)), for: .touchUpInside)
        view.addSubview(randomName0Button)
        
        randomName1Button = UIButton(frame: CGRect(x: memberImageView.frame.minX, y: randomName0Button.frame.maxY + 10, width: 200, height: 50))
        randomName1Button.backgroundColor = UIColor(red:0.35, green:0.74, blue:0.98, alpha:1.0)
        randomName1Button.titleLabel?.numberOfLines = 0
        randomName1Button.titleLabel?.lineBreakMode = .byWordWrapping
        randomName1Button.layer.cornerRadius = 10
        randomName1Button.addTarget(self, action: #selector(colorChanger(sender:)), for: .touchUpInside)
        view.addSubview(randomName1Button)
        
        randomName2Button = UIButton(frame: CGRect(x: memberImageView.frame.minX, y: randomName1Button.frame.maxY + 10, width: 200, height: 50))
        randomName2Button.backgroundColor = UIColor(red:0.35, green:0.74, blue:0.98, alpha:1.0)
        randomName2Button.titleLabel?.numberOfLines = 0
        randomName2Button.titleLabel?.lineBreakMode = .byWordWrapping
        randomName2Button.layer.cornerRadius = 10
        randomName2Button.addTarget(self, action: #selector(colorChanger(sender:)), for: .touchUpInside)
        view.addSubview(randomName2Button)
        
        randomName3Button = UIButton(frame: CGRect(x: memberImageView.frame.minX, y: randomName2Button.frame.maxY + 10, width: 200, height: 50))
        randomName3Button.backgroundColor = UIColor(red:0.35, green:0.74, blue:0.98, alpha:1.0)
        randomName3Button.titleLabel?.numberOfLines = 0
        randomName3Button.titleLabel?.lineBreakMode = .byWordWrapping
        randomName3Button.layer.cornerRadius = 10
        randomName3Button.addTarget(self, action: #selector(colorChanger(sender:)), for: .touchUpInside)
        view.addSubview(randomName3Button)
        
        
        // Do any additional setup after loading the view.
        
    }
    
    
    @objc func generalFunction() {
        
        scoreLabel.text = "Score: \(score)"
        
    
        
        listofmembers = []
        //listOfResults = []
        var copyofnames = Constants.names
        
        while listofmembers.count < 4 {
            var randomName = copyofnames.randomElement()!
            var randomNameIndex = copyofnames.firstIndex(of: randomName)!
            listofmembers.append(randomName)
            copyofnames.remove(at: randomNameIndex)
        }
        
        var correctrandom = listofmembers.randomElement()!
        
        print("correctrandomindex \(correctrandom)")
        print("correctRandom \(correctrandom)")
        print("list of members \(listofmembers)")
        
        if timerCount > 0 {
            randomName0 = listofmembers.randomElement()!
            var randomName0Index = listofmembers.firstIndex(of: randomName0)!
            randomName0Button.setTitle(randomName0, for: .normal)
            listofmembers.remove(at: randomName0Index)
            
            randomName1 = listofmembers.randomElement()!
            var randomName1Index = listofmembers.firstIndex(of: randomName1)!
            randomName1Button.setTitle(randomName1, for: .normal)
            listofmembers.remove(at: randomName1Index)
            
            randomName2 = listofmembers.randomElement()!
            var randomName2Index = listofmembers.firstIndex(of: randomName2)!
            randomName2Button.setTitle(randomName2, for: .normal)
            listofmembers.remove(at: randomName2Index)
            
            randomName3 = listofmembers.randomElement()!
            var randomName3Index = listofmembers.firstIndex(of: randomName3)!
            randomName3Button.setTitle(randomName3, for: .normal)
            listofmembers.remove(at: randomName3Index)
            
            if (correctrandom == randomName0) {
                correctButton = randomName0Button
            }
            if (correctrandom == randomName1) {
                correctButton = randomName1Button
            }
            if (correctrandom == randomName2) {
                correctButton = randomName2Button
            }
            if (correctrandom == randomName3) {
                correctButton = randomName3Button
            }
        }

        
        print("correctButtonTitle \(correctButton.titleLabel!.text)")
        
        memberImageView.image = Constants.getImageFor(name: correctrandom)

        
    }
        
        @objc func colorChanger(sender: UIButton) {
            
            colorTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(colorReset), userInfo: nil, repeats: false)
            
            
            if sender == correctButton {
                sender.backgroundColor = UIColor(red:0.72, green:1.00, blue:0.24, alpha:1.0)
                score += 1
                currentStreak += 1
                if currentStreak > bestStreak {
                    bestStreak = currentStreak
                }
                listOfResults.append("You gave the correct answer.")
            }
            else {
                sender.backgroundColor = UIColor(red:1.00, green:0.43, blue:0.24, alpha:1.0)
                if currentStreak > bestStreak {
                    bestStreak = currentStreak
                }
                currentStreak = 0
                listOfResults.append("You gave the incorrect answer.")

            }
        
        }
    @objc func colorReset() {
        randomName0Button.backgroundColor = UIColor(red:0.35, green:0.74, blue:0.98, alpha:1.0)
        randomName1Button.backgroundColor = UIColor(red:0.35, green:0.74, blue:0.98, alpha:1.0)
        randomName2Button.backgroundColor = UIColor(red:0.35, green:0.74, blue:0.98, alpha:1.0)
        randomName3Button.backgroundColor = UIColor(red:0.35, green:0.74, blue:0.98, alpha:1.0)
        timerCount = 5
        generalFunction()
    }
    
    @objc func timerCountDown() {
        timer.text = String(timerCount)
        
        timerCount -= 1
        if timerCount == -1 {
            timerCount = 5
            listOfResults.append("The timer beat you to it.")
            generalFunction()
        }
    }
    
    @objc func statisticsClicked() {
        timerfunc.invalidate()
        performSegue(withIdentifier: "toStatistics", sender: self)
        
    }
        
        
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        (segue.destination as! StatisticsViewController).maxStreakScore = bestStreak
        //segue.destination as! StatisticsViewController).lastThreeResults = Array(listOfResults.suffix
        (segue.destination as! StatisticsViewController).lastThreeResults = Array(listOfResults.suffix((3)).reversed())
    }
    
    

}
