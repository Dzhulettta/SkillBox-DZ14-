//
//  DataModels.swift
//  DZ14
//
//  Created by Юлия Чужинова on 09.05.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import Foundation

//MARK: Модель данных для погоды на данный момент

struct WeatherData: Codable {
    var list: [List] = []
}

struct List: Codable {
    var name: String = ""
    var main: Main = Main()
    var weather: [Weather] = []
    
}

struct Weather: Codable {
    var id: Int
    var main: String
    var description: String
    var icon: String
    
}

struct Main: Codable {
    var temp: Double = 0
    var pressure: Int = 0
    var humidity: Int = 0
}

//MARK: - Модель данных для погоды на 3 часа и 5 дней

struct WeatherDataThreeHours: Codable {
    var list: [List1] = []
}

struct List1: Codable {
    var main: Main1 = Main1()
}

struct Main1: Codable {
    var temp: Double = 0
}
