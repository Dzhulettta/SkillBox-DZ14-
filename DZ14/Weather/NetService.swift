//
//  NetService.swift
//  DZ14
//
//  Created by Юлия Чужинова on 09.05.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import UIKit

//MARK: Запрос погоды на данный момент

class NetService {
    static let shared = NetService()
    
    func updateWeatherInfoThreeHours(comletion: @escaping (WeatherDataThreeHours?, String) -> Void ) {
        let url = URL(string: treeURL)
        let request = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                print("DataTesk error: \(error!.localizedDescription)")
                return
            }
            if let data = data {
                do {
                    let temp = try JSONDecoder().decode(WeatherDataThreeHours.self, from: data)
                    comletion(temp, "Ок")
                }
                catch {
                    print(error)
                    comletion(nil, ErrorTypeLoad.errorData.rawValue)
                }
            } else {
                comletion(nil,"Нет данных для обработки")
            }
        }
            task.resume()
    }}

//MARK: Запрос погоды на 3 часа и 5 дней

class NetService1 {
static let shared = NetService1()
func updateWeatherInfo(comletion: @escaping (WeatherData?, String) -> Void ) {
    let url = URL(string: nowURL)
    let request = URLRequest(url: url!)
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        guard error == nil else {
            print("DataTesk error: \(error!.localizedDescription)")
            return
        }
       if let data = data {
                do {
                    let temp = try JSONDecoder().decode(WeatherData.self, from: data)
                    comletion(temp, "Ок")
                }
                catch {
                    print(error)
                    comletion(nil, ErrorTypeLoad.errorData.rawValue)
                }
            } else {
                comletion(nil,"Нет данных для обработки")
            }
        }
        task.resume()
}
}
