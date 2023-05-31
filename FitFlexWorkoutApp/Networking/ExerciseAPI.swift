//
//  ExerciseAPI.swift
//  FitFlexWorkoutApp
//
//  Created by Vishwa Dhananjaya on 2023-05-28.
//

import Foundation

final class ExerciseAPI
{
    
    static let shared  = ExerciseAPI()
    
    
    func fetchExercises(onCompletion: @escaping ([Exercises]) -> ())
    {
        let urlString = "https://fitflexbackend-production.up.railway.app/exercises"
        let url = URL(string: urlString)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, resp ,error) in
            guard let data = data else {
                print("Data was nil")
                return
            }
            
            guard let exercisesList = try? JSONDecoder().decode([Exercises].self, from: data) else {
                print("Could not decode json")
                return
            }
            
            onCompletion(exercisesList)
            
        }
        
        task.resume()
     
    }
    
    func fetchFilterdExercises(fitnessLevel: String, goal: String,onCompletion: @escaping ([Exercises]) -> ())
    {
 
        var urlComponents = URLComponents(string: "https://fitflexbackend-production.up.railway.app/exercises/searchexercises")!

        let queryItems = [
            URLQueryItem(name: "fitnessLevel", value: fitnessLevel),
            URLQueryItem(name: "goal", value: goal)
        ]


        urlComponents.queryItems = queryItems

        guard let url = urlComponents.url else {

            return
        }

        // Use the generated URL for API requests or further processing
        print(url.absoluteString)

        
        let task = URLSession.shared.dataTask(with: url) { (data, resp ,error) in
            guard let data = data else {
                print("Data was nil")
                return
            }
            
            guard let exercisesList = try? JSONDecoder().decode([Exercises].self, from: data) else {
                print("Could not decode json")
                return
            }
            
            onCompletion(exercisesList)
            
        }
    task.resume()
    }
    
}

