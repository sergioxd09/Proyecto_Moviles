	

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var hasInsertedTestData = false // Bandera para realizar un seguimiento del estado de inserción de datos

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "BDMontalvo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Error loading Core Data stores: \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Permiso concedido para notificaciones")
            } else {
                print("Permiso denegado para notificaciones")
            }
        }

        // Insertar datos de prueba solo si no se han insertado antes
//        if !hasInsertedTestData {
//            insertTestData()
//            insertTestData2()
//            hasInsertedTestData = true
//        }

        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        self.saveContext()
    }

    // MARK: - Core Data Saving support

    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: - Función para insertar datos de prueba
    func insertTestData() {
        let context = persistentContainer.viewContext

        // Insertar datos de muestra aquí
        let nuevoServicio = Servicios(context: context)
        nuevoServicio.descripcion = "Clasico"
        nuevoServicio.hora = "10:00 AM"
        nuevoServicio.servicio = "Corte de cabello"
        
        let nuevoServicio2 = Servicios(context: context)
        nuevoServicio2.descripcion = "Peinado especializado"
        nuevoServicio2.hora = "12:00 PM"
        nuevoServicio2.servicio = "Peinados"

        let nuevoServicio3 = Servicios(context: context)
        nuevoServicio3.descripcion = "Secado de cabello"
        nuevoServicio3.hora = "02:30 PM"
        nuevoServicio3.servicio = "Secado"
        
        let nuevoServicio4 = Servicios(context: context)
        nuevoServicio4.descripcion = "Depilacion perfecta"
        nuevoServicio4.hora = "10:00 AM"
        nuevoServicio4.servicio = "Tratamientos Capilares"
        
        let nuevoServicio5 = Servicios(context: context)
        nuevoServicio5.descripcion = "Manos realmente bien tratadas"
        nuevoServicio5.hora = "12:00 PM"
        nuevoServicio5.servicio = "Manicura"

        let nuevoServicio6 = Servicios(context: context)
        nuevoServicio6.descripcion = "Uñas y pies bien tratados"
        nuevoServicio6.hora = "02:30 PM"
        nuevoServicio6.servicio = "Pedicura"
        
        let nuevoServicio7 = Servicios(context: context)
        nuevoServicio7.descripcion = "Maquillaje que no daña tu piel"
        nuevoServicio7.hora = "10:00 AM"
        nuevoServicio7.servicio = "Maquillaje"
        
        let nuevoServicio8 = Servicios(context: context)
        nuevoServicio8.descripcion = "Productos que ayudan a mejorar la piel de tu rostro"
        nuevoServicio8.hora = "12:00 PM"
        nuevoServicio8.servicio = "Tratamientos Faciales"

        let nuevoServicio9 = Servicios(context: context)
        nuevoServicio9.descripcion = "Atencion al cliente"
        nuevoServicio9.hora = "02:30 PM"
        nuevoServicio9.servicio = "Asesoramiento de Estilo"
        
        
        // Guardar cambios en el contexto
        saveContext()
    }
    
     
    func insertTestData2() {
         let context = persistentContainer.viewContext

         // Insertar datos de muestra aquí
         let nuevoTrabajdor = Trabajador(context: context)
        nuevoTrabajdor.apellido = "Begazo"
        nuevoTrabajdor.cargo = "Gerente"
        nuevoTrabajdor.nombre = "Marco"

         let nuevoTrabajador2 = Trabajador(context: context)
        nuevoTrabajador2.apellido = "Gallegos"
        nuevoTrabajador2.cargo = "empleado"
        nuevoTrabajador2.nombre = "Sergio"


         let nuevoTrabajador3 = Trabajador(context: context)
        nuevoTrabajador3.apellido = "Gil"
        nuevoTrabajador3.cargo = "administrador"
        nuevoTrabajador3.nombre = "Ana"
        
        let nuevoTrabajador4 = Trabajador(context: context)
        nuevoTrabajador4.apellido = "Mendoza"
        nuevoTrabajador4.cargo = "Limpieza"
        nuevoTrabajador4.nombre = "Luciana"
        
        let nuevoTrabajador5 = Trabajador(context: context)
        nuevoTrabajador5.apellido = "Torres"
        nuevoTrabajador5.cargo = "Estilista"
        nuevoTrabajador5.nombre = "Andrea"
        
        let nuevoTrabajador6 = Trabajador(context: context)
        nuevoTrabajador6.apellido = "Yalta"
        nuevoTrabajador6.cargo = "Peluquero"
        nuevoTrabajador6.nombre = "Maritza"
        
        let nuevoTrabajador7 = Trabajador(context: context)
        nuevoTrabajador7.apellido = "Vilca"
        nuevoTrabajador7.cargo = "Recepcionista"
        nuevoTrabajador7.nombre = "Daniel"
        
        let nuevoTrabajador8 = Trabajador(context: context)
        nuevoTrabajador8.apellido = "Alegria"
        nuevoTrabajador8.cargo = "Pedicurista"
        nuevoTrabajador8.nombre = "Antonio"


         // Guardar cambios en el contexto
         saveContext()
     }
      
}

