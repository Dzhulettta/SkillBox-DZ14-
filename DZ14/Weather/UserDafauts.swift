//
//  UserDafauts.swift
//  DZ14
//
//  Created by Юлия Чужинова on 14.10.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

//
//  ContactList.swift
//  new
//
//  Created by Юлия Чужинова on 12.10.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//
//
import Foundation
import UIKit

class UserDafautsWeather{

    let defaults = UserDefaults.standard
    static let shared = UserDafautsWeather()
    
    struct WeatherUserDafauts: Codable {
        var oneHour: String?
        var twoHour: String?
        var threeHour: String?
        var oneDay: String?
        var twoDay: String?
        var threeDay: String?
        var fourDay: String?
        var fiveDay: String?
//        var weather: String{
//        return "\(oneHour), \(twoHour), \(threeHour), \(oneDay), \(twoDay), \(threeDay), \(fourDay), \(fiveDay)"
//    }
    }
    var weatherAll: [WeatherUserDafauts]{

        get {
            if let data = defaults.value(forKey: "saveWeather") as? Data{
               return try! PropertyListDecoder().decode([WeatherUserDafauts].self, from: data)
            } else {
                return [WeatherUserDafauts]()
            }
        }
        set {
            if let data = try? PropertyListEncoder().encode(newValue) as? Data{
                defaults.set(data, forKey: "saveWeather")
                
            }
        }
    }
    func  saveWeatheroneHour(oneHour: String){
        let weather = WeatherUserDafauts(oneHour: oneHour)
        weatherAll.append(weather)
    }
    func  saveWeathertwoHour(twoHour: String){
        let weather = WeatherUserDafauts(twoHour: twoHour)
        weatherAll.append(weather)
    }
    func  saveWeatherthreeHour(threeHour: String){
           let weather = WeatherUserDafauts(threeHour: threeHour)
           weatherAll.append(weather)
       }
    func  saveWeatheroneDay(oneDay: String){
           let weather = WeatherUserDafauts(oneDay: oneDay)
           weatherAll.append(weather)
       }
    func  saveWeathertwoDay(twoDay: String){
           let weather = WeatherUserDafauts(twoDay: twoDay)
           weatherAll.append(weather)
       }
    func  saveWeatherthreeDay(threeDay: String){
           let weather = WeatherUserDafauts(threeDay: threeDay)
           weatherAll.append(weather)
       }
    func  saveWeatherfourDay(fourDay: String){
           let weather = WeatherUserDafauts(fourDay: fourDay)
           weatherAll.append(weather)
       }
    func  saveWeatherfiveDay(fiveDay: String){
              let weather = WeatherUserDafauts(fiveDay: fiveDay)
              weatherAll.append(weather)
          }
    

//    func  saveWeather(oneHour: String, twoHour: String, threeHour: String, oneDay: String, twoDay: String, threeDay: String, fourDay: String, fiveDay: String){
//        let weather = WeatherUserDafauts(oneHour: oneHour, twoHour: twoHour, threeHour: threeHour, oneDay: oneDay, twoDay: twoDay, threeDay: threeDay, fourDay: fourDay, fiveDay: fiveDay)
////        let weather1 = WeatherUserDafauts(oneHour: oneHour)
////        let weather2 = WeatherUserDafauts(twoHour: twoHour)
////        let weather3 = WeatherUserDafauts(threeHour: threeHour)
////        let weather4 = WeatherUserDafauts(oneDay: oneDay)
////        let weather5 = WeatherUserDafauts(twoDay: twoDay)
////        let weather6 = WeatherUserDafauts(threeDay: threeDay)
////        let weather7 = WeatherUserDafauts(fourDay: fourDay)
////        let weather8 = WeatherUserDafauts(fiveDay: fiveDay)
//        weatherAll.removeAll()
//        weatherAll.append(weather)
////        weatherAll.append(weather1)
////        weatherAll.append(weather2)
////        weatherAll.append(weather3)
////        weatherAll.append(weather4)
////        weatherAll.append(weather5)
////        weatherAll.append(weather6)
////        weatherAll.append(weather7)
////        weatherAll.append(weather8)
//    }

}

