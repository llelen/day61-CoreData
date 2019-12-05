//
//  Userr+CoreDataProperties.swift
//  60_createuserapp

//

import Foundation
import CoreData


extension Userr {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Userr> {
        return NSFetchRequest<Userr>(entityName: "Userr")
    }

    @NSManaged public var about: String?
    @NSManaged public var address: String?
    @NSManaged public var age: Int16
    @NSManaged public var email: String?
    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var company: String?
    @NSManaged public var friends: NSSet?
    
  
    
    var wrappedid : String{
        id ?? "id"
    }
    var wrappedname: String{
        name ?? "id"
    }
    var wrappedemail: String{
        email ?? "email"
    }
    var wrappedabout: String{
        about ?? "about"
    }
    var wrappedaddress: String{
        address ?? "address"
    }
    
    var wrappedcompany: String{
        company ?? "company"
    }
    
    var wrappedfriend: [Friendd]{
        let set = friends as? Set<Friendd> ?? []
        return set.sorted {
            $0.wrappedname < $1.wrappedname
        }
    }
    

}

// MARK: Generated accessors for friends
extension Userr {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: Friendd)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: Friendd)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}
