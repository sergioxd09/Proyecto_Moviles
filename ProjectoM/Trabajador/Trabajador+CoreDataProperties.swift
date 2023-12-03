//
//  Trabajador+CoreDataProperties.swift
//  ProjectoM
//
//  Created by DAMII on 1/12/23.
//
//

import Foundation
import CoreData


extension Trabajador {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Trabajador> {
        return NSFetchRequest<Trabajador>(entityName: "Trabajador")
    }

    @NSManaged public var apellido: String?
    @NSManaged public var cargo: String?
    @NSManaged public var nombre: String?

}

extension Trabajador : Identifiable {

}
