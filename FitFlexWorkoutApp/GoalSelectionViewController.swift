//
//  GoalSelectionViewController.swift
//  FitFlexWorkoutApp
//
//  Created by Vishwa Dhananjaya on 2023-05-20.
//

import UIKit

class GoalSelectionViewController: UIViewController {
    
    let bmiImage = UIImageView()
    let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupBMIImage()
        configureStack()

        // Do any additional setup after loading the view.
    }
    
    
    func setupBMIImage()
    {
        view.addSubview(bmiImage)
        bmiImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bmiImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 1),
            bmiImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            bmiImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
             bmiImage.heightAnchor.constraint(equalToConstant: 200),
//            bmiImage.widthAnchor.constraint(equalToConstant: 200)
                    ])
        
        bmiImage.image = UIImage(named: "bmi")
    }
    
    func configureStack()
    {
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        addObjectToStackView()
        
        
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: bmiImage.bottomAnchor, constant: 1),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60),
         //   stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70),
 
         
                    ])
        
    }
    
    func addObjectToStackView ()
    {
        let bmiLabel = UILabel()
        bmiLabel.text = "Your BMI is 27"
        bmiLabel.font = UIFont.boldSystemFont(ofSize: 20)
        bmiLabel.textColor = UIColor.black
        bmiLabel.textAlignment = .center
        
        stackView.addArrangedSubview(bmiLabel)
        
    }



}
