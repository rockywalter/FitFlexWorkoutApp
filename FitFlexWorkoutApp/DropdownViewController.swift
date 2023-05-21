import UIKit


class DropdownViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    let dropdownTextField = UITextField()
    let pickerView = UIPickerView()
    let dropdownOptions = ["Option 1", "Option 2", "Option 3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        dropdownTextField.inputView = pickerView
        dropdownTextField.placeholder = "Select an option"
        dropdownTextField.backgroundColor = UIColor.systemGray2
        dropdownTextField.layer.borderWidth = 0.5
        dropdownTextField.borderStyle = .roundedRect
        dropdownTextField.layer.borderColor = UIColor.black.cgColor
        
        view.addSubview(dropdownTextField)
        
        dropdownTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dropdownTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            dropdownTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        
                    ])
        
        // Set any additional properties or constraints for the dropdown text field
        
        // ...
    }
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // Number of components in the picker view
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dropdownOptions.count // Number of rows in the picker view
    }
    
    // MARK: - UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dropdownOptions[row] // Return the data for each row
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedOption = dropdownOptions[row]
        dropdownTextField.text = selectedOption
        dropdownTextField.resignFirstResponder() // Dismiss the picker view
    }
}
