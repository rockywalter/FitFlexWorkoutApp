//
//  GoalSelectionViewController.swift
//  FitFlexWorkoutApp
//
//  Created by Vishwa Dhananjaya on 2023-05-20.
//

import UIKit

class GoalSelectionViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate {
    
    let bmiImage = UIImageView()
    let stackView = UIStackView()
    
    let goalTextField = UITextField()
    let goalPickerView = UIPickerView()
    let goalOptions = ["Weight Loss", "Muscle Building", "Fitness Maintenance"]
    
    let finishButton = UIButton()
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupBMIImage()
        configureStack()
        setupfinishButton()
    

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
       // stackView.distribution = .fillEqually
      //  stackView.spacing = 10
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
        
        let goalLabel = UILabel()
        goalLabel.text = "Select Your Goal"
        goalLabel.textColor = UIColor.black
        goalLabel.textAlignment = .left
        
        goalPickerView.dataSource = self
        goalPickerView.delegate = self
        goalTextField.inputView = goalPickerView
        goalTextField.placeholder = "Select an option"
        goalTextField.backgroundColor = UIColor.systemGray2
        goalTextField.layer.borderWidth = 0.5
        goalTextField.borderStyle = .roundedRect
        goalTextField.layer.borderColor = UIColor.black.cgColor
        
        
        let fitnessLabel = UILabel()
        fitnessLabel.text = "Select Your Fitness Level"
        fitnessLabel.textColor = UIColor.black
        fitnessLabel.textAlignment = .left
        
        let fitnessSelect = UISegmentedControl()
        fitnessSelect.backgroundColor = UIColor.systemGray2
        fitnessSelect.insertSegment(withTitle: "Beginner", at: 0, animated: true)
        fitnessSelect.insertSegment(withTitle: "Intermediate", at: 1, animated: true)
        fitnessSelect.insertSegment(withTitle: "Advances", at: 1, animated: true)
        fitnessSelect.layer.borderWidth = 0.5
        fitnessSelect.layer.borderColor = UIColor.black.cgColor
        
        let spacer1 = UIView()
        spacer1.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let spacer2 = UIView()
        spacer2.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
       //view.addSubview(dropdownButton)
        
        
        stackView.addArrangedSubview(bmiLabel)
        stackView.addArrangedSubview(spacer1)
        stackView.addArrangedSubview(goalLabel)
        stackView.addArrangedSubview(goalTextField)
        stackView.addArrangedSubview(spacer2)
        stackView.addArrangedSubview(fitnessLabel)
        stackView.addArrangedSubview(fitnessSelect)

        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // Number of components in the picker view
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return goalOptions.count // Number of rows in the picker view
    }
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return goalOptions[row] // Return the data for each row
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedOption = goalOptions[row]
        goalTextField.text = selectedOption
        goalTextField.resignFirstResponder() // Dismiss the picker view
    }
    
    func setupfinishButton()
    {
        view.addSubview(finishButton)
        finishButton.frame = CGRect(x: 50, y: 100, width: 200, height: 40)
        finishButton.setTitle("Finish", for: .normal)
        finishButton.setTitleColor(UIColor.white, for: .normal)
        finishButton.backgroundColor = UIColor.blue
        finishButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        finishButton.layer.cornerRadius = 8
        finishButton.clipsToBounds = true
        finishButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        finishButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            finishButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40),
            finishButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            finishButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60),
            finishButton.heightAnchor.constraint(equalToConstant: 40)
         //   stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70),
 
         
                    ])
        
    }
    
    @objc func buttonTapped() {
            let nextScreen = DayPlanViewController()
        navigationController?.pushViewController(nextScreen, animated: true)
        }
    


}
