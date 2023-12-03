//
//  Usuario+CoreDataProperties.swift
//  ProjectoM
//
//  Created by DAMII on 24/11/23.
//
//

import Foundation
import CoreData


extension Usuario {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Usuario> {
        return NSFetchRequest<Usuario>(entityName: "Usuario")
    }

    @NSManaged public var apellido: String?
    @NSManaged public var celular: String?
    @NSManaged public var contrasena: String?
    @NSManaged public var dni: String?
    @NSManaged public var email: String?
    @NSManaged public var nombre: String?

}

extension Usuario : Identifiable {

}
