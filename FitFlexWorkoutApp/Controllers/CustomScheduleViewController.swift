//
//  CustomScheduleViewController.swift
//  FitFlexWorkoutApp
//
//  Created by Vishwa Dhananjaya on 2023-05-23.
//

import UIKit

var selectedEXList = [Exercises]()

class CustomScheduleViewController: UIViewController , UITableViewDataSource ,UITableViewDelegate {
    
    let finishButton = UIButton()
    let addButton = UIButton()
    
    var exercisesList = [Exercises]()
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Custom Schedule"
        setupAddButton()
        view.backgroundColor = UIColor.white
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ExerciseCustomeCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 120
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70),
 
                    ])
        
        setupDeleteButton()
        
        let anonymousFunction = { (fetchedExercisesList : [Exercises]) in
            DispatchQueue.main.async {
                self.exercisesList = fetchedExercisesList
                self.tableView.reloadData()
            }
    
        }
        
        ExerciseAPI.shared.fetchFilterdExercises(fitnessLevel: glFitnessLevel, goal: glGoal,onCompletion: anonymousFunction)
        
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedEXList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExerciseCustomeCell
        if !selectedEXList.isEmpty {
            let exercise = selectedEXList[indexPath.row]
            cell.exImage.image = UIImage(named: "exercise.png")
            cell.exName.text = exercise.exerciseName
            cell.exDuration.text = exercise.duration
            cell.exGoal.text = exercise.goal
        }
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //    tableView.deselectRow(at: indexPath, animated: true)
       // showDesAlert(title: "Exercise Details", message: "\(exercisesList[indexPath.row].description)")
        print("cell of \(exercisesList[indexPath.row].exerciseName) is clicked")
    }
    
    func setupDeleteButton()
    {
        view.addSubview(finishButton)
        finishButton.frame = CGRect(x: 50, y: 100, width: 200, height: 40)
        finishButton.setTitle("Delete", for: .normal)
        finishButton.setTitleColor(UIColor.white, for: .normal)
        finishButton.backgroundColor = UIColor.blue
        finishButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        finishButton.layer.cornerRadius = 8
        finishButton.clipsToBounds = true
        finishButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        finishButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            finishButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 15),
            finishButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            finishButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60),
            finishButton.heightAnchor.constraint(equalToConstant: 40)
         //   stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70),
 
         
                    ])
        
    }
    
    @objc func buttonTapped() {
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            // Remove the item from your data source array
            selectedEXList.remove(at: selectedIndexPath.row)
            
            // Delete the row from the table view
            tableView.deleteRows(at: [selectedIndexPath], with: .fade)
        }
        }
    
    
    func showDesAlert(title:String , message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel , handler: nil)
        alert.addAction(action)
        DispatchQueue.main.async {
            self.present(alert, animated: true ,completion: nil)
        }
        
    }
    
    
    


    

   func setupAddButton()
    {
        addButton.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        addButton.tintColor = .systemBlue
        addButton.addTarget(self, action: #selector(addButtonClicked), for: .touchUpInside)

        // Set the size of the button
        addButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)

        // Create a UIBarButtonItem with the custom button
        let addButtonBarItem = UIBarButtonItem(customView: addButton)

        // Set the button as the right bar button item
        navigationItem.rightBarButtonItem = addButtonBarItem
    }

    @objc func addButtonClicked() {

       let nextScreen = WorkoutAddViewController()
       navigationController?.pushViewController(nextScreen, animated: true)

    }

}

class WorkoutAddViewController: UIViewController , UITableViewDataSource ,UITableViewDelegate{

    let nextButton = UIButton()
    let startLabel = UILabel()
    var selectedDataArray: [Exercises] = []
    var myArray: [String] = []

    var exercisesList = [Exercises]()
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ExerciseCustomeCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 120

        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70),

                    ])

        setupDoneButton()
        
        let anonymousFunction = { (fetchedExercisesList : [Exercises]) in
            DispatchQueue.main.async {
                self.exercisesList = fetchedExercisesList
                self.tableView.reloadData()
            }
    
        }
        
        ExerciseAPI.shared.fetchExercises(onCompletion: anonymousFunction)

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercisesList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExerciseCustomeCell
        let exercise = exercisesList[indexPath.row]
        cell.exImage.image = UIImage(named: "exercise.png")
        cell.exName.text = exercise.exerciseName
        cell.exDuration.text = exercise.duration
        cell.exGoal.text = exercise.goal
        if selectedDataArray.contains(exercise) {
                    cell.contentView.backgroundColor = .gray
                }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
            if let cell = tableView.cellForRow(at: indexPath) {
                cell.layer.borderWidth = 1.0
                   cell.layer.borderColor = UIColor.green.cgColor
                tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
            }

         selectedEXList.append(exercisesList[indexPath.row])

    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let deselectedData = exercisesList[indexPath.row]

        }

    func setupDoneButton()
    {
        view.addSubview(nextButton)
        nextButton.frame = CGRect(x: 50, y: 100, width: 200, height: 40)
        nextButton.setTitle("Done", for: .normal)
        nextButton.setTitleColor(UIColor.white, for: .normal)
        nextButton.backgroundColor = UIColor.blue
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        nextButton.layer.cornerRadius = 8
        nextButton.clipsToBounds = true
        nextButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 15),
            nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60),
            nextButton.heightAnchor.constraint(equalToConstant: 40)
         //   stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70),


                    ])

    }

    @objc func buttonTapped() {
        print(selectedEXList)
            let nextScreen = CustomScheduleViewController()
        navigationController?.pushViewController(nextScreen, animated: true)
        }

   

}
