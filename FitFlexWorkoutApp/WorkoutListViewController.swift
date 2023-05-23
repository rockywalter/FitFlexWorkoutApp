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

    let exercises = [
        Exercise(image: "e1", name: "Squats",discription:" Lower body exercise", duration: "10"),
        Exercise(image: "e2", name: "Run",discription:"A form of aerobic exercise", duration: "20min"),
        Exercise(image: "e3", name: "Bench Press",discription:"Good for chest", duration: "10"),
        Exercise(image: "e4", name: "Back Press",discription:"Good for Back", duration: "15"),
        Exercise(image: "e5", name: "Burpees",discription:"Good for all body", duration: "2min"),
        Exercise(image: "e5", name: "Mountain climbers",discription:"Good for all body", duration: "2min")
    ]
    
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
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExerciseCustomeCell
        let exercise = exercises[indexPath.row]
        cell.exImage.image = UIImage(named: exercise.image)
        cell.exName.text = exercise.name
        cell.exDuration.text = exercise.duration
        cell.exDiscription.text = exercise.discription
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("cell of \(exercises[indexPath.row].name) is clicked")
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
   
}

class ExerciseCustomeCell : UITableViewCell {
    
    let exImage = UIImageView()
    let exName = UILabel()
    let exDiscription = UILabel()
    let exDuration = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(exImage)
        addSubview(exName)
        addSubview(exDiscription)
        addSubview(exDuration)
        exImage.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        exName.frame = CGRect(x: 120, y: 20, width: 120, height: 30)
        exDiscription.frame = CGRect(x: 120, y: 40, width: 200, height: 30)
        exDuration.frame = CGRect(x: 120, y: 70, width: 120, height: 30)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


struct Exercise{
    var image : String
    var name : String
    var discription : String
    var duration : String
}
