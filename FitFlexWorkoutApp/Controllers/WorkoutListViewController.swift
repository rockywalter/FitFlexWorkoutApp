//
//  WorkoutListViewController.swift
//  FitFlexWorkoutApp
//
//  Created by Vishwa Dhananjaya on 2023-05-21.
//

import UIKit

class WorkoutListViewController: UIViewController , UITableViewDataSource ,UITableViewDelegate{
    
    let finishButton = UIButton()
    let startLabel = UILabel()
    
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
        
        setupfinishButton()
        setupEXLabel()
        
        let anonymousFunction = { (fetchedExercisesList : [Exercises]) in
            DispatchQueue.main.async {
                self.exercisesList = fetchedExercisesList
                self.tableView.reloadData()
            }
    
        }
        
        ExerciseAPI.shared.fetchFilterdExercises(fitnessLevel: glFitnessLevel, goal: glGoal,onCompletion: anonymousFunction)
        
       
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
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showDesAlert(title: "Exercise Details", message: "\(exercisesList[indexPath.row].description)")
        print("cell of \(exercisesList[indexPath.row].exerciseName) is clicked")
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
            finishButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 15),
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
    
    func setupEXLabel()
    {
        view.addSubview(startLabel)
        
        startLabel.text = "Lets Start!"
        startLabel.font = UIFont.boldSystemFont(ofSize: 25)
        startLabel.textColor = UIColor.black
        startLabel.textAlignment = .left
       
        
        startLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            startLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 1),
            startLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -1),
        //    welcomeLabel.heightAnchor.constraint(equalToConstant: 40)
         //   stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70),
 
         
                    ])
        
        
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
    
   
}

class ExerciseCustomeCell : UITableViewCell {
    
    let exImage = UIImageView()
    let exName = UILabel()
    let exGoal = UILabel()
    let exDuration = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(exImage)
        addSubview(exName)
        addSubview(exGoal)
        addSubview(exDuration)
        exImage.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        exName.frame = CGRect(x: 120, y: 20, width: 400, height: 30)
        exGoal.frame = CGRect(x: 120, y: 40, width: 400, height: 30)
        exDuration.frame = CGRect(x: 120, y: 70, width: 400, height: 30)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

