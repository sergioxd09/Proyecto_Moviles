//
//  Promo+CoreDataProperties.swift
//  ProjectoM
//
//  Created by DAMII on 24/11/23.
//
//

import Foundation
import CoreData


extension Promo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Promo> {
        return NSFetchRequest<Promo>(entityName: "Promo")
    }

    @NSManaged public var descripcion: String?
    @NSManaged public var nombre: String?
    @NSManaged public var fecha: String?

}

extension Promo : Identifiable {

}
