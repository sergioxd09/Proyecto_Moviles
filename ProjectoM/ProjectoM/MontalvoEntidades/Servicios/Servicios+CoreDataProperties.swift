//
//  Servicios+CoreDataProperties.swift
//  ProjectoM
//
//  Created by DAMII on 24/11/23.
//
//

import Foundation
import CoreData


extension Servicios {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Servicios> {
        return NSFetchRequest<Servicios>(entityName: "Servicios")
    }

    @NSManaged public var servicio: String?
    @NSManaged public var hora: String?
    @NSManaged public var descripcion: String?

}

extension Servicios : Identifiable {

}
