//
//  Links.swift
//  DZ14
//
//  Created by Юлия Чужинова on 09.05.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import Foundation

//MARK: Links
let treeURL = "https://api.openweathermap.org/data/2.5/forecast?id=524901&units=metric&APPID=01619d67d8252c069cd7a7edbe5fb756"
let nowURL = "https://api.openweathermap.org/data/2.5/find?q=Moscow,RU&type=like&units=metric&APPID=01619d67d8252c069cd7a7edbe5fb756"
//MARK: Описание ошибок

enum ErrorTypeLoad: String {
    case ok = "Ok"
    case errorData = "Не возможно обработать данные"
}
