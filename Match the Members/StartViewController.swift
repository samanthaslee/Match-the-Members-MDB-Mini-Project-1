//
//  ViewController.swift
//  Match the Members
//
//  Created by Sam Lee on 2/6/19.
//  Copyright © 2019 Sam Lee. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    var startButton : UIButton!
    var mdblogoImageView : UIImageView!
    var startLabel : UILabel!
    var directionsLabel : UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startButton = UIButton(frame: CGRect(x: view.frame.width / 2 - 100, y: view.frame.height / 2 + 20, width: 200, height: 75))
        startButton.setTitle("Start", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.backgroundColor = UIColor(red:1.00, green:0.85, blue:0.24, alpha:1.0)
        startButton.layer.cornerRadius = 20
        startButton.layer.borderWidth = 5
        startButton.layer.borderColor = UIColor.white.cgColor
        startButton.addTarget(self, action: #selector(startClicked), for: .touchUpInside)
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        startButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        view.addSubview(startButton)
        
        view.backgroundColor = UIColor(red:0.35, green:0.74, blue:0.98, alpha:1.0)
        
        
        mdblogoImageView = UIImageView(frame: CGRect(x: view.frame.width / 2 - 100, y: view.frame.height / 2 - 230 , width: 200, height: 200))
        mdblogoImageView.image = UIImage(named: "mdblogo")
        mdblogoImageView.contentMode = .scaleAspectFit
        view.addSubview(mdblogoImageView)
        
        
        startLabel = UILabel(frame: CGRect(x: view.frame.width / 2 - 125, y: view.frame.height / 2 - 60
            , width: 250, height: 50))
        startLabel.backgroundColor = UIColor(red:0.35, green:0.74, blue:0.98, alpha:1.0)
        startLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        startLabel.textColor = .white
        startLabel.textAlignment = NSTextAlignment.center
        startLabel.text = "MATCH THE MEMBERS"
        view.addSubview(startLabel)
        
        directionsLabel = UILabel(frame: CGRect(x: view.frame.width / 2 - 125, y: view.frame.height / 2 + 130
            , width: 250, height: 50))
        directionsLabel.backgroundColor = UIColor(red:0.35, green:0.74, blue:0.98, alpha:1.0)
        directionsLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        directionsLabel.textColor = .white
        directionsLabel.textAlignment = NSTextAlignment.center
        directionsLabel.numberOfLines = 0
        directionsLabel.text = "Rule: You will have 5 seconds \n to match each person!"
        view.addSubview(directionsLabel)

    }
    @objc func startClicked() {
        performSegue(withIdentifier: "toMain", sender: self)
    }


}

