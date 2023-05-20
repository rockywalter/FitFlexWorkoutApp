//
//  ViewController.swift
//  workoutApp
//
//  Created by Vishwa Dhananjaya on 2023-05-16.
//

import UIKit

class UserDetailsViewController: UIViewController {
    

    
    let backgroundImageView = UIImageView()
    let logo = UIImageView()
    let  stackView = UIStackView()
    let label = UILabel()
    let nextButton = UIButton()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupLogo()
        configureStackView()
        setupNextButton()
       // setupLabel()
        // Do any additional setup after loading the view.
    }
    
//    func setBackground()
//    {
//        view.addSubview(backgroundImageView)
//        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
//        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//
//
//        backgroundImageView.image = UIImage(named: "background")
//    }
//
    func setupLogo()
    {
        view.addSubview(logo)
        logo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 1),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logo.heightAnchor.constraint(equalToConstant: 200),
            logo.widthAnchor.constraint(equalToConstant: 200)
                    ])
        
        logo.image = UIImage(named: "logo")
        
    }
    
    func configureStackView()
    {
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 30
        addObjectToStackView()
        
        
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 1),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60),
         //   stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70),
 
         
                    ])
        
    }

    func addObjectToStackView()
    {
         let textField1 = UITextField()
         textField1.placeholder = "Name"
        textField1.backgroundColor = UIColor.systemGray2
        textField1.layer.borderWidth = 0.5
        textField1.borderStyle = .roundedRect
        textField1.layer.borderColor = UIColor.black.cgColor

        let textField2 = UITextField()
        textField2.placeholder = "Hight"
        textField2.backgroundColor = UIColor.systemGray2
        textField2.borderStyle = .roundedRect
        textField2.layer.borderWidth = 0.5
        textField2.layer.borderColor = UIColor.black.cgColor

        let textField3 = UITextField()
        textField3.placeholder = "Weight"
        textField3.backgroundColor = UIColor.systemGray2
        textField3.borderStyle = .roundedRect
        textField3.layer.borderWidth = 0.5
        textField3.layer.borderColor = UIColor.black.cgColor

        let textField4 = UITextField()
        textField4.placeholder = "Age"
        textField4.backgroundColor = UIColor.systemGray2
        textField4.borderStyle = .roundedRect
        textField4.layer.borderWidth = 0.5
        textField4.layer.borderColor = UIColor.black.cgColor

        let genderSelect = UISegmentedControl()
        genderSelect.backgroundColor = UIColor.systemGray2
        genderSelect.insertSegment(withTitle: "Male", at: 0, animated: true)
        genderSelect.insertSegment(withTitle: "Female", at: 1, animated: true)
        genderSelect.layer.borderWidth = 0.5
        genderSelect.layer.borderColor = UIColor.black.cgColor
         
        label.text = "Let's Get Started!"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = UIColor.black
        label.textAlignment = .center

        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(textField1)
        stackView.addArrangedSubview(textField2)
        stackView.addArrangedSubview(textField3)
        stackView.addArrangedSubview(textField4)
        stackView.addArrangedSubview(genderSelect)
        stackView.addArrangedSubview(nextButton)
        

    }
    
    func setupNextButton()
    {
        view.addSubview(nextButton)
        nextButton.frame = CGRect(x: 50, y: 100, width: 200, height: 40)
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(UIColor.white, for: .normal)
        nextButton.backgroundColor = UIColor.blue
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        nextButton.layer.cornerRadius = 8
        nextButton.clipsToBounds = true
        nextButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 25),
            nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60),
            nextButton.heightAnchor.constraint(equalToConstant: 40)
         //   stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70),
 
         
                    ])
        
    }
    
    @objc func buttonTapped() {
            let nextScreen = GoalSelectionViewController()
        navigationController?.pushViewController(nextScreen, animated: true)
        }
    
    func setupLabel()
    {
        
        
    }


    
}
