//
//  Trabajador+CoreDataProperties.swift
//  ProjectoM
//
//  Created by DAMII on 24/11/23.
//
//

import Foundation
import CoreData


extension Trabajador {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Trabajador> {
        return NSFetchRequest<Trabajador>(entityName: "Trabajador")
    }

    @NSManaged public var nombre: String?
    @NSManaged public var apellido: String?
    @NSManaged public var email: String?
    @NSManaged public var cargo: String?

}

extension Trabajador : Identifiable {

}
