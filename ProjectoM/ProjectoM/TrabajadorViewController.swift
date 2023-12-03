import UIKit
import CoreData

class TrabajadorViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var trabajador = [Trabajador]()
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
        let fetchRequest: NSFetchRequest<Trabajador> = Trabajador.fetchRequest()

        do {
            trabajador = try context.fetch(fetchRequest)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            print("Error al recuperar datos desde Core Data: \(error.localizedDescription)")
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trabajador.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda2", for: indexPath)

        let trabajador  = trabajador[indexPath.row]

        // Configuracion sobre  la celda con los valores del apellido
        cell.textLabel?.text = trabajador.apellido
        if let cargo = trabajador.cargo, let trabajadorText = trabajador.nombre {
            cell.detailTextLabel?.text = "\(cargo) - \(trabajadorText)"
        } else {
            cell.detailTextLabel?.text = "Valores no disponibles"
        }

        return cell
    }

}
