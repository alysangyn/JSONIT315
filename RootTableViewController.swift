//
//  RootTableViewController.swift
//  dokidoki_fa24
//
//  Created by Alysa Nguyen on 12/7/24.
//
import Foundation
import UIKit

class RootTableViewController : UITableViewController {
    var ddObjectArray = [dokidoki]()

    
    override func tableView(_ tableView: UITableView,
                             numberOfRowsInSection section: Int) -> Int {
        return ddObjectArray.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ddObject = ddObjectArray[indexPath.row]
        
        let entryNumber = ddObject.entryNumber
        let mood = ddObject.mood
        let dailyJournal = ddObject.dailyJournal;
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = "Entry #\(entryNumber)"
        cell.textLabel!.font = UIFont.boldSystemFont(ofSize: 18)
        
        cell.detailTextLabel!.text = dailyJournal
        cell.imageView?.image = UIImage(named: "catIcon.png")
        cell.imageView?.layer.cornerRadius = 10
        cell.imageView?.layer.borderWidth = 2
        cell.imageView?.layer.borderColor = UIColor.lightGray.cgColor
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showJE_Details" {
            
            let indexPath = tableView.indexPathForSelectedRow
            let selectedDDObject = ddObjectArray[indexPath!.row]
            
            
            let destController = segue.destination as! ViewController
            destController.randomDD = selectedDDObject
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        InitilizeData()
    }
    
    
    
    func InitilizeData() {
        let dd1 = dokidoki()
        dd1.entryNumber = 1
        dd1.mood = "Happy"
        dd1.dailyJournal = "Had a good day with lots of positive interactions."
        dd1.sleepHours = 7
        dd1.sleepQuality = "Good"
        dd1.weather = "Sunny"
        dd1.detailedEmotion = "Relaxed"
        dd1.selfCareActivity = "Meditation"
        dd1.physicalActivity = "Went for a jog"
        dd1.energyLevel = "High"
        dd1.meals = ["Breakfast - Pancakes", "Lunch - Salad", "Dinner - Pasta"]
        dd1.socialInteractions = "Met friends for lunch"
        dd1.stressLevel = "Low"
        dd1.productivity = "Completed all tasks"
        dd1.gratitude = "Thankful for spending time with friends"
        //dd1.ddImage = ""
        ddObjectArray.append(dd1)

        let dd2 = dokidoki()
        dd2.entryNumber = 2
        dd2.mood = "Sad"
        dd2.dailyJournal = "Didn't feel my best today, but tried my best to stay positive."
        dd2.sleepHours = 5
        dd2.sleepQuality = "Okay"
        dd2.weather = "Rainy"
        dd2.detailedEmotion = "Anxious"
        dd2.selfCareActivity = "Yoga"
        dd2.physicalActivity = "Went for a walk"
        dd2.energyLevel = "Low"
        dd2.meals = ["Breakfast - Waffles", "Lunch - Sandwich", "Dinner - Soup"]
        dd2.socialInteractions = "Had a video call with family"
        dd2.stressLevel = "Moderate"
        dd2.productivity = "Managed to finish some work tasks"
        dd2.gratitude = "Grateful for my supportive family"
        ddObjectArray.append(dd2)

        let dd3 = dokidoki()
        dd3.entryNumber = 3
        dd3.mood = "Excited"
        dd3.dailyJournal = "Had an exciting day, lots of new things happening!"
        dd3.sleepHours = 8
        dd3.sleepQuality = "Good"
        dd3.weather = "Partly Cloudy"
        dd3.detailedEmotion = "Energized"
        dd3.selfCareActivity = "Reading"
        dd3.physicalActivity = "Gym workout"
        dd3.energyLevel = "High"
        dd3.meals = ["Breakfast - Smoothie", "Lunch - Burrito", "Dinner - Sushi"]
        dd3.socialInteractions = "Caught up with an old friend"
        dd3.stressLevel = "Low"
        dd3.productivity = "Productive and finished all my goals"
        dd3.gratitude = "Thankful for opportunities"
        ddObjectArray.append(dd3)

        let dd4 = dokidoki()
        dd4.entryNumber = 4
        dd4.mood = "Angry"
        dd4.dailyJournal = "Had a frustrating day, some things didn't go as planned."
        dd4.sleepHours = 6
        dd4.sleepQuality = "Poor"
        dd4.weather = "Windy"
        dd4.detailedEmotion = "Frustrated"
        dd4.selfCareActivity = "Meditation"
        dd4.physicalActivity = "Light stretching"
        dd4.energyLevel = "Low"
        dd4.meals = ["Breakfast - Cereal", "Lunch - Pizza", "Dinner - Burger"]
        dd4.socialInteractions = "Had a heated discussion"
        dd4.stressLevel = "High"
        dd4.productivity = "Struggled to focus"
        dd4.gratitude = "Grateful for having time to relax in the evening"
        ddObjectArray.append(dd4)

        let dd5 = dokidoki()
        dd5.entryNumber = 5
        dd5.mood = "Calm"
        dd5.dailyJournal = "A very relaxing and uneventful day, felt calm and rested."
        dd5.sleepHours = 9
        dd5.sleepQuality = "Good"
        dd5.weather = "Clear"
        dd5.detailedEmotion = "Content"
        dd5.selfCareActivity = "Spa day"
        dd5.physicalActivity = "Swimming"
        dd5.energyLevel = "Moderate"
        dd5.meals = ["Breakfast - Toast", "Lunch - Salad", "Dinner - Grilled Chicken"]
        dd5.socialInteractions = "Spent time alone"
        dd5.stressLevel = "Very Low"
        dd5.productivity = "No major tasks planned"
        dd5.gratitude = "Thankful for a peaceful day"
        ddObjectArray.append(dd5)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
