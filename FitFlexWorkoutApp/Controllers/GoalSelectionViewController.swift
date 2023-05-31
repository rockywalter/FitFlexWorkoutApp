//
//  GoalSelectionViewController.swift
//  FitFlexWorkoutApp
//
//  Created by Vishwa Dhananjaya on 2023-05-20.
//

import UIKit

var glGoal : String!
var glFitnessLevel  : String!
var glbmi  : String!

class GoalSelectionViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate {
    
    var userName: String!
    var height : String!
    var weight : String!
    var age :String!
    var gender : Int!
    let bmiImage = UIImageView()
    let stackView = UIStackView()
    let bmiLabel = UILabel()
    let goalTextField = UITextField()
    let goalPickerView = UIPickerView()
    let goalOptions = ["Weight loss", "Muscle building", "Fitness maintenance"]
    var selectedOption : String!
    let finishButton = UIButton()
    let fitnessSelect = UISegmentedControl()
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupBMIImage()
        configureStack()
        setupfinishButton()
        
        print(userName!)
        print(height!)
        print(weight!)
        print(age!)
        print(gender!)
    

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
      
       
        if let calculatedBMI = calculateBMI() {
            let formattedBMI = String(format: "%.2f", calculatedBMI)
            
            let bmiCategory = getCategory(forBMI: calculatedBMI)
            var categoryText = ""
            
                switch bmiCategory {
                case .underweight:
                    categoryText = "Underweight"
                case .normalWeight:
                    categoryText = "Normal Weight"
                case .overweight:
                    categoryText = "Overweight"
                case .obese:
                    categoryText = "Obese"
                }
                
                let category = categoryText
            
            bmiLabel.text = "BMI : \(formattedBMI) | \(category)"
        } else {
            // Handle invalid input or calculation error
            bmiLabel.text = "Invalid input"
        }
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
        goalTextField.backgroundColor = UIColor.secondarySystemBackground
        goalTextField.layer.borderWidth = 0.2
        goalTextField.borderStyle = .roundedRect
        goalTextField.layer.borderColor = UIColor.black.cgColor
        
        
        let fitnessLabel = UILabel()
        fitnessLabel.text = "Select Your Fitness Level"
        fitnessLabel.textColor = UIColor.black
        fitnessLabel.textAlignment = .left
        
        
        fitnessSelect.backgroundColor = UIColor.secondarySystemBackground
        fitnessSelect.insertSegment(withTitle: "Beginner", at: 0, animated: true)
        fitnessSelect.insertSegment(withTitle: "Intermediate", at: 1, animated: true)
        fitnessSelect.insertSegment(withTitle: "Advanced", at: 1, animated: true)
        fitnessSelect.layer.borderWidth = 0.2
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
        selectedOption = goalOptions[row]
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
        assignUserInputs()
        let nextScreen = HomeViewController()
        navigationController?.pushViewController(nextScreen, animated: true)
        }
    
     
    func assignUserInputs()
    {
        glGoal = selectedOption;
        glbmi = bmiLabel.text
       
        let selectedIndex = fitnessSelect.selectedSegmentIndex
        
        switch selectedIndex {
        case 0:
           
           glFitnessLevel = "Beginner"
           
        case 1:
          
            glFitnessLevel = "Advanced"
           
        case 2:
          
            glFitnessLevel = "Intermediate"
           
        default:
            break
        }
       

    }
    
    
        func calculateBMI() -> Double?{
            guard let heightValue = Double(height),
                     let weightValue = Double(weight),
                  let _ = Int(age) else {
                   return nil
               }
            
            let heightInMeters = heightValue / 100 // Convert height from centimeters to meters
                let bmi = weightValue / (heightInMeters * heightInMeters)
                
                // Adjust BMI calculation based on gender
                if gender == 0 { // Male
                    return bmi * 1.0
                } else if gender == 1 { // Female
                    return bmi * 0.9
                }
            
                
                return nil
        }

    func getCategory(forBMI bmi: Double) -> BMIStatus {
        if bmi < 18.5 {
            return .underweight
        } else if bmi < 25 {
            return .normalWeight
        } else if bmi < 30 {
            return .overweight
        } else {
            return .obese
        }
    }

    


}


enum BMIStatus {
    case underweight
    case normalWeight
    case overweight
    case obese
}
