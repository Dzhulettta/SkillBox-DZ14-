//
//  UserDefaults.swift
//  DZ14
//
//  Created by Юлия Чужинова on 04.05.2020.
//  Copyright © 2020 Юлия Чужинова. All rights reserved.
//

import Foundation

class Persistance {
static let shared = Persistance()
    
  private let kUserNameKey = "Persistance.kUserNameKey"
    var userName: String? {
        set { UserDefaults.standard.set(newValue, forKey: kUserNameKey)}
        get { return UserDefaults.standard.string(forKey: kUserNameKey)}
    }
    private let kUserFirstNameKey = "Persistance.kUserFirstNameKey"
      var userFirstName: String? {
          set { UserDefaults.standard.set(newValue, forKey: kUserFirstNameKey)}
          get { return UserDefaults.standard.string(forKey: kUserFirstNameKey)}
      }
}
