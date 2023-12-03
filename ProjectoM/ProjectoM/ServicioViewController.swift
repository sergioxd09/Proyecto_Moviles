import UIKit
import CoreData

class ServicioViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var servicios = [Servicios]()
    var context: NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        context = appDelegate.persistentContainer.viewContext
        fetchServicios()


    }

    func fetchServicios() {
        let fetchRequest: NSFetchRequest<Servicios> = Servicios.fetchRequest()

        do {
            servicios = try context.fetch(fetchRequest)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            print("Error al recuperar datos desde Core Data: \(error.localizedDescription)")
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return servicios.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)

        let servicio = servicios[indexPath.row]

        // Configuracion de la celda con los valores del servicio
        
        cell.textLabel?.text = servicio.descripcion
        if let hora = servicio.hora, let servicioText = servicio.servicio {
            cell.detailTextLabel?.text = "\(hora) - \(servicioText)"
        } else {
            cell.detailTextLabel?.text = "Valores no disponibles"
        }

        return cell
    }

}
