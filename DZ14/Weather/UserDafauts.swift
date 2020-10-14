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
//import Foundation
//import UIKit
//
//class UserDafautsWeather{
//
//    let defaults = UserDefaults.standard
//    static let shared = UserDafautsWeather()
//    
//    struct WeatherUserDafauts: Codable {
//        var oneHour: String
//        var twoHour: String
//        var threeHour: String
//        var fourHour: String
//        var fiveHour: String
//        var oneDay: String
//        var twoDay: String
//        var threeDay: String
//        var fourDay: String
//        var fiveDay: String
//        
//    }
//    var weather: [WeatherUserDafauts]{
//
//        get {
//            if let data = defaults.value(forKey: "contactListKey") as? Data{
//               return try! PropertyListDecoder().decode([WeatherUserDafauts].self, from: data)
//            } else {
//                return [WeatherUserDafauts]()
//            }
//        }
//        set {
//            if let data = try? PropertyListEncoder().encode(newValue) as? Data{
//                defaults.set(data, forKey: "contactListKey")
//                
//            }
//        }
//    }
//
//    func  saveWeather(name: String, city: String, six: String) {
//        let weather = WeatherUserDafauts(name: name, city: city, six: six)
//        weather.append(weather)
//    }
//
//}

