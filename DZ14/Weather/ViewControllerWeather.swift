//
//  ViewControllerWeather.swift
//  DZ14
//
//  Created by Юлия Чужинова on 09.05.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import UIKit

struct  KeyWeather {
static let oneHour = "oneHour"
static let twoHour = "twoHour"
static let threeHour = "threeHour"
static let oneDay = "oneDay"
static let twoDay = "twoDay"
static let threeDay = "threeDay"
static let fourDay = "fourDay"
static let fiveDay = "fiveDay"
static let city = "city"
static let temp = "temp"
static let weather = "weather"
}

class ViewControllerWeather: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var tableThreeHours1: UITableView!
    @IBOutlet weak var cityNameLabel1: UILabel!
    @IBOutlet weak var weatherDiscription1: UILabel!
    @IBOutlet weak var temperatureLabel1: UILabel!
    @IBOutlet weak var weatherImage1: UIImageView!
    
    var weatherData: WeatherData!
    var weatherDataThreeHours: WeatherDataThreeHours!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = .lightContent
    
        tableThreeHours1.delegate = self
        tableThreeHours1.dataSource = self
        
        NetService.shared.updateWeatherInfoThreeHours() { (data, status) in
            if let data = data {
                DispatchQueue.main.async {
                    self.weatherDataThreeHours = data
                    self.tableThreeHours1.reloadData()
                }
            } else  {
                self.tableThreeHours1.reloadData()
                print(status)
            }
        }
        NetService1.shared.updateWeatherInfo() { (data, status) in
            if let data = data {
                DispatchQueue.main.async {
                    self.weatherData = data
                    self.updateView()
                }
            } else  {
                print(status)
            }
        }
        
        cityNameLabel1.text = defaults.string(forKey: KeyWeather.city)
        weatherDiscription1.text = defaults.string(forKey: KeyWeather.weather)
        temperatureLabel1.text = defaults.string(forKey: KeyWeather.temp)
    }
    
    func  updateView() {
        cityNameLabel1.text = weatherData!.list[0].name.description
        weatherDiscription1.text = DataSource.weatherIDs[weatherData.list[0].weather[0].id]
        let tempOur = Int(round(weatherData.list[0].main.temp))
        temperatureLabel1.text = "\(tempOur)°"
        weatherImage1.image = UIImage(named: weatherData.list[0].weather[0].icon)
        saveInfo()
    }
    
    func saveInfo(){
        if let city = cityNameLabel1.text{
            defaults.set(city, forKey: KeyWeather.city)
        }
        if let weather = weatherDiscription1.text{
                         defaults.set(weather, forKey: KeyWeather.weather)
                     }
        if let temp = temperatureLabel1.text{
            defaults.set(temp, forKey: KeyWeather.temp)
        }
        
    }
    //MARK: - Table
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            return "Погода на ближайшее время:"
        } else {
            return "Погода на ближайшие 5 дней:"
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 3
        } else {
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        if weatherDataThreeHours != nil {
          
            if indexPath.section == 0{
                
                switch indexPath.row {
                    
                case 0:
                    cell.textLabel?.text = "Температура через 3 часа: \(Int(round(weatherDataThreeHours.list[0].main.temp)))°"
                    if let oneHour = cell.textLabel?.text{
                        defaults.set(oneHour, forKey: KeyWeather.oneHour)
                        print("Температура через 3 часа: \(defaults.string(forKey: KeyWeather.oneHour))")
                        }
                case 1:
                    cell.textLabel?.text = "Температура через 6 часов: \(Int(round(weatherDataThreeHours.list[1].main.temp)))°"
                   if let twoHour = cell.textLabel?.text{
                    defaults.set(twoHour, forKey: KeyWeather.twoHour)
                        }
                default:
                    cell.textLabel?.text = "Температура через 9 часов: \(Int(round(weatherDataThreeHours.list[2].main.temp)))°"
                if let threeHour = cell.textLabel?.text{
                    defaults.set(threeHour, forKey: KeyWeather.threeHour)
                                 }
                    
                }
                return cell
              
                        } else {
                switch indexPath.row {
                case 0: cell.textLabel?.text = "Сегодня: \(Int(round(weatherDataThreeHours.list[0].main.temp)))°"
               if let oneDay = cell.textLabel?.text{
                defaults.set(oneDay, forKey: KeyWeather.oneDay)
                    }
                case 1: cell.textLabel?.text = "Завтра: \(Int(round(weatherDataThreeHours.list[8].main.temp)))°"
                if let twoDay = cell.textLabel?.text{
                    defaults.set(twoDay, forKey: KeyWeather.twoDay)
                    }
                case 2: cell.textLabel?.text = "Послезавтра: \(Int(round(weatherDataThreeHours.list[16].main.temp)))°"
                if let threeDay = cell.textLabel?.text{
                    defaults.set(threeDay, forKey: KeyWeather.threeDay)
                    }
                case 3: cell.textLabel?.text = "После-послезавтра: \(Int(round(weatherDataThreeHours.list[24].main.temp)))°"
                if let fourDay = cell.textLabel?.text{
                    defaults.set(fourDay, forKey: KeyWeather.fourDay)
                    }
                default:
                    cell.textLabel?.text = "После-после-послезавтра: \(Int(round(weatherDataThreeHours.list[36].main.temp)))°"
                if let fiveDay = cell.textLabel?.text{
                    defaults.set(fiveDay, forKey: KeyWeather.fiveDay)
                    }
                }
                 return cell
                
            }
        
            
            tableView.reloadData()
        } else {
            if indexPath.section == 0{
                           switch indexPath.row {
                               
                           case 0:
                               cell.textLabel?.text = defaults.string(forKey: KeyWeather.oneHour)
                              
                           case 1:
                            cell.textLabel?.text = defaults.string(forKey: KeyWeather.twoHour)
                            
                           default:
                            cell.textLabel?.text = defaults.string(forKey: KeyWeather.threeHour)
                           }
                           return cell
                       } else {
                           switch indexPath.row {
                           case 0: cell.textLabel?.text = defaults.string(forKey: KeyWeather.oneDay)
                           case 1: cell.textLabel?.text = defaults.string(forKey: KeyWeather.twoDay)
                           case 2: cell.textLabel?.text = defaults.string(forKey: KeyWeather.threeDay)
                           case 3: cell.textLabel?.text = defaults.string(forKey: KeyWeather.fourDay)
                           default:
                               cell.textLabel?.text = defaults.string(forKey: KeyWeather.fiveDay)
                           }
                            return cell
                       }
                       tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
