import UIKit
import CoreData

class LoginViewController: UIViewController {

    @IBOutlet weak var dniTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
            super.viewDidLoad()

            // Configurar la propiedad isSecureTextEntry para el campo de contraseña
            passwordTextField.isSecureTextEntry = true
        }
    @IBAction func ingresar(_ sender: UIButton) {
        guard let dni = dniTextField.text, !dni.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            showAlert(message: "Por favor, ingrese DNI y contraseña.")
            return
        }

        if validateLogin(dni: dni, password: password) {
            showAlert(message: "Inicio de sesión exitoso.")
            // Aquí realizamos la navegación a la siguiente vista si el inicio de sesión es exitoso
            performSegue(withIdentifier: "PrincipalController", sender: self)
        } else {
            showAlert(message: "DNI o contraseña incorrectos.")
        }
    }

    func validateLogin(dni: String, password: String) -> Bool {
        let fetchRequest: NSFetchRequest<Usuario> = Usuario.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "dni == %@ AND contrasena == %@", dni, password)

        do {
            let users = try context.fetch(fetchRequest)
            return !users.isEmpty
        } catch {
            print("Error al validar el inicio de sesión: \(error.localizedDescription)")
            return false
        }
    }

    func showAlert(message: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Inicio de Sesión", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

}
