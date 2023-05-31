//
//  ProfileViewController.swift
//  FitFlexWorkoutApp
//
//  Created by Vishwa Dhananjaya on 2023-05-23.
//

import UIKit

class ProfileViewController: UIViewController {

    
    let backgroundImageView = UIImageView()
    let logo = UIImageView()
    let  stackView = UIStackView()
    let label = UILabel()
    let nextButton = UIButton()
    let textField1 = UITextField()
    let textField2 = UITextField()
    let textField3 = UITextField()
    let textField4 = UITextField()
    let genderSelect = UISegmentedControl()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupLogo()
        configureStackView()
       // setupLabel()
        // Do any additional setup after loading the view.
    }
    

    func setupLogo()
    {
        view.addSubview(logo)
        logo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 1),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logo.heightAnchor.constraint(equalToConstant: 180),
            logo.widthAnchor.constraint(equalToConstant: 180)
                    ])
        
        logo.image = UIImage(named: "profile")
        
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
         
        textField1.text = "Height : \(glheight!)"
        textField1.backgroundColor = UIColor.secondarySystemBackground
        textField1.layer.borderWidth = 0.2
        textField1.borderStyle = .roundedRect
        textField1.layer.borderColor = UIColor.black.cgColor
        textField1.isUserInteractionEnabled = false

       
        textField2.text = "Weight : \(glweight!)"
        textField2.backgroundColor = UIColor.secondarySystemBackground
        textField2.borderStyle = .roundedRect
        textField2.layer.borderWidth = 0.2
        textField2.layer.borderColor = UIColor.black.cgColor
        textField2.isUserInteractionEnabled = false

       
        textField3.text = "Age : \(glage!)"
        textField3.backgroundColor = UIColor.secondarySystemBackground
        textField3.borderStyle = .roundedRect
        textField3.layer.borderWidth = 0.2
        textField3.layer.borderColor = UIColor.black.cgColor
        textField3.isUserInteractionEnabled = false

       
        textField4.text = glbmi!
        textField4.backgroundColor = UIColor.secondarySystemBackground
        textField4.borderStyle = .roundedRect
        textField4.layer.borderWidth = 0.2
        textField4.layer.borderColor = UIColor.black.cgColor
        textField4.isUserInteractionEnabled = false

        

         
        label.text = "Hi \(glName!)"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = UIColor.black
        label.textAlignment = .center

        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(textField1)
        stackView.addArrangedSubview(textField2)
        stackView.addArrangedSubview(textField3)
        stackView.addArrangedSubview(textField4)
       
      //  stackView.addArrangedSubview(nextButton)
        

    }
    
  
  
    

}
