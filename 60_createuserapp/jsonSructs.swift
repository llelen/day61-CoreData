//
//  jsonSructs.swift
//  60_createuserapp
//


import UIKit
import SwiftUI

class User : Codable, Identifiable{
    var id: String = "Id"
    var name: String = "name"
    var age: Int = 0
    var company: String = "Company"
    var email: String = "Email"
    var address: String = "Address"
    var about: String = "About"
    var friends: [Friend] = []
    
    
    
}

class Friend : Codable, Identifiable{
    var id: String = "0"
    var name : String = "Name"
}

