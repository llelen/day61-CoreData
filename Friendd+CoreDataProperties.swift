//
//  Friendd+CoreDataProperties.swift
//  60_createuserapp
//

//

import Foundation
import CoreData


extension Friendd {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friendd> {
        return NSFetchRequest<Friendd>(entityName: "Friendd")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var origin: Userr?
    
    
    var wrappedid : String{
        id ?? "id"
    }
    var wrappedname: String{
        name ?? "id"
    }

}
