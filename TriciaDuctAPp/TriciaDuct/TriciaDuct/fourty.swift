import UIKit

class fourty : UIViewController {

    // MARK: - UI Elements
    let angleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter one angle in degrees"
        textField.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.5)
        textField.textAlignment = .center
        textField.layer.cornerRadius = 10
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Calculate", for: .normal)
        button.backgroundColor = .systemBlue
        button.tintColor = .black
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let outputLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        // Add UI Elements
        view.addSubview(angleTextField)
        view.addSubview(calculateButton)
        view.addSubview(outputLabel)

        // Set AutoLayout Constraints
        NSLayoutConstraint.activate([
            angleTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            angleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            angleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            calculateButton.topAnchor.constraint(equalTo: angleTextField.bottomAnchor, constant: 20),
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculateButton.widthAnchor.constraint(equalToConstant: 200),
            calculateButton.heightAnchor.constraint(equalToConstant: 50),

            outputLabel.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 20),
            outputLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            outputLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])

        // Set button action
        calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
    }

    @objc func calculateButtonTapped() {
        guard let angleText = angleTextField.text,
              let angle = Double(angleText) else {
            outputLabel.text = "Invalid input. Please enter a valid angle."
            return
        }

        let result = calculate454590Triangle(angle: angle)
        outputLabel.text = "Result: \(result)"
    }

    // Function to calculate the sides of the 45-45-90 triangle based on the input angle
    func calculate454590Triangle(angle: Double) -> (leg: Double, hypotenuse: Double) {
        // Assuming the angle provided is for a valid 45-45-90 triangle
        let leg = cos(angle.degreesToRadians) * sqrt(2.0)
        let hypotenuse = leg * 2.0
        return (leg, hypotenuse)
    }
}

extension Double {
    var degreesToRadians: Double {
        return self * .pi / 180
    }
}
