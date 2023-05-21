//
//  DayPlanViewController.swift
//  FitFlexWorkoutApp
//
//  Created by Vishwa Dhananjaya on 2023-05-21.
//

import UIKit

class DayPlanViewController: UIViewController, UITableViewDataSource ,UITableViewDelegate{
    
    let days = [
        Day(name: "Day 01", image: "1"),
        Day(name: "Day 02", image: "2"),
        Day(name: "Day 03", image: "3"),
        Day(name: "Day 04", image: "4"),
        Day(name: "Day 05", image: "5"),
        Day(name: "Day 06", image: "6"),
        Day(name: "Day 07", image: "7")
    ]
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomeCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 120
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -0),
 
                    ])
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomeCell
        let day = days[indexPath.row]
        cell.dayImage.image = UIImage(named: day.image)
        cell.dayName.text = day.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("cell of \(days[indexPath.row].name) is clicked")
    }
    
    
   


}

class CustomeCell : UITableViewCell {
    
    let dayImage = UIImageView()
    let dayName = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(dayImage)
        addSubview(dayName)
        dayImage.frame = CGRect(x: 10, y: 10, width: 100, height: 100)
        dayName.frame = CGRect(x: 120, y: 20, width: 120, height: 30)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


struct Day{
    var name : String
    var image : String
}
