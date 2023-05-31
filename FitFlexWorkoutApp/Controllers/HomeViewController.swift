//
//  HomeViewController.swift
//  FitFlexWorkoutApp
//
//  Created by Vishwa Dhananjaya on 2023-05-23.
//

import UIKit

class HomeViewController: UIViewController {
    
    let tabBar = UITabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTtab()
        // Do any additional setup after loading the view.
    }
    
    func setupTtab()
    {
        let firstVC = UINavigationController(rootViewController:DayPlanViewController())
        let secondVC = UINavigationController(rootViewController:CustomScheduleViewController())
        let thirdVC = UINavigationController(rootViewController:ProfileViewController())
        
        firstVC.title = "Exercises"
        secondVC.title = "Custom"
        thirdVC.title = "Profile"
        
        tabBar.setViewControllers([firstVC,secondVC,thirdVC], animated: true)

        
        guard let items = tabBar.tabBar.items else{
            return
        }
        
        let images = ["heart","pencil.circle","person.circle"]
        
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }
        
        tabBar.modalPresentationStyle = .fullScreen
        present(tabBar,animated: true)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
