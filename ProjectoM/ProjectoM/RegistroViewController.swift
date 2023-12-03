import UIKit
import CoreData

class RegistroViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nombreTextField: UITextField!
    @IBOutlet weak var apellidoTextField: UITextField!
    @IBOutlet weak var dniTextField: UITextField!
    @IBOutlet weak var celularTextField: UITextField!
    @IBOutlet weak var correoTextField: UITextField!
    @IBOutlet weak var contraseñaTextField: UITextField!

    // Propiedad para la conexión con CoreData
    var managedContext: NSManagedObjectContext!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        managedContext = appDelegate.persistentContainer.viewContext
        configureTextFields()
        contraseñaTextField.isSecureTextEntry = true
    }

    func configureTextFields() {
        nombreTextField.delegate = self
        apellidoTextField.delegate = self
        dniTextField.delegate = self
        celularTextField.delegate = self
        correoTextField.delegate = self
        contraseñaTextField.delegate = self
    }

    // Ocultar el teclado al tocar fuera del campo de texto
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func registrarBoton(_ sender: UIButton) {
            guard
                let nombre = nombreTextField.text, !nombre.isEmpty,
                let apellido = apellidoTextField.text, !apellido.isEmpty,
                let dni = dniTextField.text, isValidDNI(dni),
                let celular = celularTextField.text, isValidPhoneNumber(celular),
                let correo = correoTextField.text, isValidEmail(correo),
                let contraseña = contraseñaTextField.text, isPasswordValid(contraseña),
                let managedContext = managedContext
            else {
                mostrarError("Todos los campos son obligatorios y deben cumplir con las validaciones.")
                return
            }

            print("Todos los campos son válidos, procediendo al registro")

            let usuario = Usuario(context: managedContext)
            usuario.nombre = nombre
            usuario.apellido = apellido
            usuario.dni = dni
            usuario.celular = celular
            usuario.email = correo
            usuario.contrasena = contraseña

            do {
                try managedContext.save()
                print("Datos guardados exitosamente en Core Data")
                mostrarExito("Se registró correctamente.")
                // Puedes agregar aquí la lógica para navegar a otra vista si es necesario
            } catch let error as NSError {
                mostrarError("Error al guardar los datos: \(error.localizedDescription)")
            }
        }

        func mostrarExito(_ mensaje: String) {
            let alert = UIAlertController(title: "Éxito", message: mensaje, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }

    func isValidDNI(_ dni: String) -> Bool {
        let isValidLength = dni.count == 8
        if !isValidLength {
            mostrarError("El DNI debe tener 8 dígitos.")
        }
        return isValidLength
    }

    func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
            let isValidLength = phoneNumber.count >= 9 && phoneNumber.count <= 15
            let startsWithNine = phoneNumber.hasPrefix("9")
            
            if !isValidLength {
                mostrarError("El número de celular debe tener entre 9 y 15 dígitos.")
            } else if !startsWithNine {
                mostrarError("El número de celular debe comenzar con el dígito '9'.")
            }

            return isValidLength && startsWithNine
        }

    func isValidEmail(_ email: String) -> Bool {
        let isValid = email.contains("@") && email.contains(".")
        if !isValid {
            mostrarError("El correo electrónico no es válido.")
        }
        return isValid
    }

    func isPasswordValid(_ password: String) -> Bool {
        let isValid = password.count >= 8
        if !isValid {
            mostrarError("La contraseña debe tener al menos 8 caracteres.")
        }
        return isValid
    }

    func mostrarError(_ mensaje: String) {
           let alert = UIAlertController(title: "Error", message: mensaje, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
           present(alert, animated: true, completion: nil)
       }
   }
