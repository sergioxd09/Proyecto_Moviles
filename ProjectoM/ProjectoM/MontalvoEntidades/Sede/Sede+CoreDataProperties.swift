//
//  Sede+CoreDataProperties.swift
//  ProjectoM
//
//  Created by DAMII on 24/11/23.
//
//

import Foundation
import CoreData


extension Sede {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sede> {
        return NSFetchRequest<Sede>(entityName: "Sede")
    }

    @NSManaged public var nombre: String?
    @NSManaged public var direccion: String?
    @NSManaged public var hora: String?

}

extension Sede : Identifiable {

}
