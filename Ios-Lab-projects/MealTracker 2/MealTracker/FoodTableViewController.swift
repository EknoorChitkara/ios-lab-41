//
//  FoodTableViewController.swift
//  MealTracker
//
//  Created by Eknoor on 18/08/25.
//

import UIKit

class FoodTableViewController: UITableViewController {
    
    var meals: [Meal] {
        let breakfastFoods = [
            Food(name: "Pancakes", description: "Fluffy pancakes with syrup"),
            Food(name: "Omelette", description: "Egg omelette with cheese"),
            Food(name: "Toast", description: "Buttered whole grain toast")
        ]
        let breakfast = Meal(name: "Breakfast", food: breakfastFoods)
        
        let lunchFoods = [
            Food(name: "Sandwich", description: "Ham and cheese sandwich"),
            Food(name: "Salad", description: "Fresh garden salad"),
            Food(name: "Soup", description: "Tomato soup")
        ]
        let lunch = Meal(name: "Lunch", food: lunchFoods)
        
        let dinnerFoods = [
            Food(name: "Steak", description: "Grilled beef steak"),
            Food(name: "Pasta", description: "Spaghetti with marinara sauce"),
            Food(name: "Fish", description: "Baked salmon with lemon")
        ]
        let dinner = Meal(name: "Dinner", food: dinnerFoods)
        
        return [breakfast, lunch, dinner]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals[section].food.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        
        let meal = meals[indexPath.section]
        let foodItem = meal.food[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = foodItem.name
        content.secondaryText = foodItem.description
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }
}
