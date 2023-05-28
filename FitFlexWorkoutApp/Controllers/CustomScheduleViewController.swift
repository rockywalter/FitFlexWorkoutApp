//
//  CustomScheduleViewController.swift
//  FitFlexWorkoutApp
//
//  Created by Vishwa Dhananjaya on 2023-05-23.
//

import UIKit

class CustomScheduleViewController: UIViewController {
    
    let addButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        title = " Add Custom Schedules"
        setupAddButton()

        // Do any additional setup after loading the view.
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
        
//        let nextScreen = WorkoutAddViewController()
//        navigationController?.pushViewController(nextScreen, animated: true)
        
    }

}

//class WorkoutAddViewController: UIViewController , UITableViewDataSource ,UITableViewDelegate{
//
//    let nextButton = UIButton()
//    let startLabel = UILabel()
//    var selectedDataArray: [Exercise] = []
//    var myArray: [String] = []
//
//    let exercises = [
//        Exercise(image: "e1", name: "Squats",discription:" Lower body exercise", duration: "10"),
//        Exercise(image: "e2", name: "Run",discription:"A form of aerobic exercise", duration: "20min"),
//        Exercise(image: "e3", name: "Bench Press",discription:"Good for chest", duration: "10"),
//        Exercise(image: "e4", name: "Back Press",discription:"Good for Back", duration: "15"),
//        Exercise(image: "e5", name: "Burpees",discription:"Good for all body", duration: "2min"),
//        Exercise(image: "e5", name: "Mountain climbers",discription:"Good for all body", duration: "2min")
//    ]
//
//    let tableView = UITableView()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = UIColor.white
//        view.addSubview(tableView)
//        tableView.dataSource = self
//        tableView.delegate = self
//        tableView.register(ExerciseCustomeCell.self, forCellReuseIdentifier: "cell")
//        tableView.rowHeight = 120
//
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
//            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
//            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -0),
//            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70),
//
//                    ])
//
//        setupNextButton()
//        setupEXLabel()
//
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return exercises.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExerciseCustomeCell
//        let exercise = exercises[indexPath.row]
//        cell.exImage.image = UIImage(named: exercise.image)
//        cell.exName.text = exercise.name
//        cell.exDuration.text = exercise.duration
//        cell.exDiscription.text = exercise.discription
//        if selectedDataArray.contains(exercise) {
//                    cell.contentView.backgroundColor = .gray
//                }
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        let selectedData = exercises[indexPath.row]
////
////            if !selectedDataArray.contains(selectedData) {
////                selectedDataArray.append(selectedData)
////            }
////
////            if let cell = tableView.cellForRow(at: indexPath) {
////                cell.contentView.backgroundColor = .gray
////                tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
////            }
//
//        myArray.append(exercises[indexPath.row].name)
//
//    }
//
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
////        let deselectedData = exercises[indexPath.row]
////
////         if let index = selectedDataArray.firstIndex(of: deselectedData) {
////             selectedDataArray.remove(at: index)
////         }
////
////         if let cell = tableView.cellForRow(at: indexPath) {
////             cell.contentView.backgroundColor = .white
////         }
//        }
//
//    func setupNextButton()
//    {
//        view.addSubview(nextButton)
//        nextButton.frame = CGRect(x: 50, y: 100, width: 200, height: 40)
//        nextButton.setTitle("Next", for: .normal)
//        nextButton.setTitleColor(UIColor.white, for: .normal)
//        nextButton.backgroundColor = UIColor.blue
//        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
//        nextButton.layer.cornerRadius = 8
//        nextButton.clipsToBounds = true
//        nextButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
//
//        nextButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            nextButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 15),
//            nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
//            nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -60),
//            nextButton.heightAnchor.constraint(equalToConstant: 40)
//         //   stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70),
//
//
//                    ])
//
//    }
//
//    @objc func buttonTapped() {
//        print(myArray)
//            let nextScreen = DayPlanViewController()
//        navigationController?.pushViewController(nextScreen, animated: true)
//        }
//
//    func setupEXLabel()
//    {
//        view.addSubview(startLabel)
//
//        startLabel.text = "Lets Start!"
//        startLabel.font = UIFont.boldSystemFont(ofSize: 25)
//        startLabel.textColor = UIColor.black
//        startLabel.textAlignment = .left
//
//
//        startLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            startLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
//            startLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 1),
//            startLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -1),
//        //    welcomeLabel.heightAnchor.constraint(equalToConstant: 40)
//         //   stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70),
//
//
//                    ])
//
//
//    }
//
//}
