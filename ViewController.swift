// DISCLAIMBER! this App is developed as an educational project
// certain materials are included under the fair use exemption of the U.S. Copyright Law and have been prepared according to the multimedia fair use guidelines and are restricted from further use
//  ViewController.swift
//  dokidoki_fa24
//
//  Created by Alysa Nguyen on 10/30/24.
//

import UIKit
import AVKit
import AVFoundation


class ViewController: UIViewController {

    //storyboard
    @IBOutlet weak var img_logo: UIImageView!
    @IBOutlet weak var lbl_banner: UILabel!

    @IBOutlet weak var lbl_entryNumber: UILabel!
    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var txt_intro: UITextView!
    @IBOutlet weak var txtJournal: UITextView!
    
    @IBOutlet weak var lbl_sleepQuality: UILabel!
    
    @IBOutlet weak var lbl_weather_input: UILabel!
    
    @IBOutlet weak var lbl_emotions_input: UILabel!
    
    @IBOutlet weak var lbl_sca_input: UILabel!
    
    @IBOutlet weak var swFav: UISwitch!
    
    @IBOutlet weak var lbl_sleepQColor: UILabel!
    
    @IBOutlet weak var lbl_date: UILabel!
    
    @IBOutlet weak var lbl_hoursSleept: UILabel!

    //initialize
    var ddObjectArray = [dokidoki]()
    var randomDD = dokidoki() // use this object to pass the selected journal entru from the master list to this view
    
    var passedJE = dokidoki()
    
    var mySoundFile: AVAudioPlayer!
    var currentDate = Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 25))!
    
    
    //functions
    @IBAction func swFav_valChanged(_ sender: Any) {
        if(swFav.isOn) {
            UserDefaults.standard.set(lbl_banner.text, forKey: "favorite")
        } else {
            UserDefaults.standard.set("", forKey: "favorite")
        }
    }
    
    @IBAction func btnWebsite(_ sender: Any) {
        let browserApp = UIApplication.shared
        
        let url = URL(string: "https://mentalhealthhotline.org/")
        
        browserApp.open(url!)
    }
    
    //var dokidokiArray = ["Journal","Chat","Tips","About"]
    
    @IBAction func btnNext(_ sender: Any) {
        setLabel()
    }
    
    func setLabel() {
        //randomDD = ddObjectArray.randomElement()!
        
        lbl_entryNumber.text = "\(randomDD.entryNumber)"
        lbl_banner.text = randomDD.mood
        txtJournal.text = randomDD.dailyJournal
        lbl_hoursSleept.text = "\(randomDD.sleepHours)"
        lbl_sleepQuality.text = randomDD.sleepQuality
        lbl_weather_input.text = randomDD.weather
        lbl_emotions_input.text =
        randomDD.detailedEmotion
        lbl_sca_input.text =
        randomDD.selfCareActivity
        // Set the date label
        lbl_date.text = formatDate(date: currentDate)
        lbl_date.textAlignment = .center
        
        let fav = UserDefaults.standard.string(forKey: "favorite")
        swFav.isOn = (randomDD.mood == fav)
        
        currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
        
        //switch statement
        switch (randomDD.sleepQuality) {
        case "Good":
            lbl_sleepQColor.backgroundColor = UIColor(red: 250/255, green: 220/255, blue: 228/255, alpha: 1.0)
            break
        case "Okay":  lbl_sleepQColor.backgroundColor = UIColor(red: 185/255, green: 203/255, blue: 225/255, alpha: 1.0)
            break
        case "Poor" : lbl_sleepQColor.backgroundColor = UIColor(red: 188/255, green: 0/255, blue: 62/255, alpha: 1.0)
            break
        default: lbl_sleepQColor.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        
        }
        
        //decorate the controls
        txtJournal.layer.cornerRadius = 15
        txtJournal.layer.borderWidth = 1
        txtJournal.layer.borderColor = UIColor(red: 233/255, green: 237/255, blue: 246/255, alpha: 1.0).cgColor
        
        lbl_banner.layer.cornerRadius = 15
        lbl_banner.layer.borderWidth = 1
        lbl_banner.layer.borderColor = UIColor(red: 233/255, green: 237/255, blue: 246/255, alpha: 1.0).cgColor

        lbl_hoursSleept.layer.cornerRadius = 15
        lbl_hoursSleept.layer.borderWidth = 1
        lbl_hoursSleept.layer.borderColor = UIColor(red: 233/255, green: 237/255, blue: 246/255, alpha: 1.0).cgColor
        
        lbl_sleepQuality.layer.cornerRadius = 15
        lbl_sleepQuality.layer.borderWidth = 1
        lbl_sleepQuality.layer.borderColor = UIColor(red: 233/255, green: 237/255, blue: 246/255, alpha: 1.0).cgColor
        
        lbl_weather_input.layer.cornerRadius = 15
        lbl_weather_input.layer.borderWidth = 1
        lbl_weather_input.layer.borderColor = UIColor(red: 233/255, green: 237/255, blue: 246/255, alpha: 1.0).cgColor
        
        lbl_emotions_input.layer.cornerRadius = 15
        lbl_emotions_input.layer.borderWidth = 1
        lbl_emotions_input.layer.borderColor = UIColor(red: 233/255, green: 237/255, blue: 246/255, alpha: 1.0).cgColor
        
        lbl_sca_input.layer.cornerRadius = 15
        lbl_sca_input.layer.borderWidth = 1
        lbl_sca_input.layer.borderColor = UIColor(red: 233/255, green: 237/255, blue: 246/255, alpha: 1.0).cgColor
        
        mySoundFile.play()
        
        //lbl_banner.text = dokidokiArray.randomElement()
    }
    
    func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM dd, yyyy"
            return dateFormatter.string(from: date)
    }
    
    func populateDDObjects() {
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
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        img_logo.alpha = 0
        lbl_date.alpha = 0
        txt_intro.alpha = 0
        lbl_name.alpha = 0
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        
        UIView.animate(withDuration: 3, animations: {
            self.img_logo.alpha = 1
            self.lbl_banner.alpha = 1
            self.lbl_date.alpha = 1
            self.txt_intro.alpha = 1
            self.lbl_name.alpha = 1
        })
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        swFav.isOn = false
        populateDDObjects() //initalize the objects, same as InitilizeData()
        let soundUrl = URL(fileURLWithPath: Bundle.main.path(forResource: "soundFile", ofType: "wav")!)
        mySoundFile = try? AVAudioPlayer(contentsOf: soundUrl)
        
        setLabel() // set initial value on the labels
        
        
        // Do any additional setup after loading the view.
    }


}

