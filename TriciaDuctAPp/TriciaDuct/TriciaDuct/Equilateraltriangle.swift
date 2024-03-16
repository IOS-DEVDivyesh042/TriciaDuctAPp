import UIKit

class Equilateraltriangle: UIViewController {

    // MARK: - UI Elements
    let sideTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter side length in cm"
        textField.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.5)
        textField.textAlignment = .center
        textField.layer.cornerRadius = 10
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let heightTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter height in cm"
        textField.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.5)
        textField.textAlignment = .center
        textField.layer.cornerRadius = 10
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Calculate Area", for: .normal)
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
        view.addSubview(sideTextField)
        view.addSubview(heightTextField)
        view.addSubview(calculateButton)
        view.addSubview(outputLabel)

        // Set AutoLayout Constraints
        NSLayoutConstraint.activate([
            sideTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            sideTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            sideTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            heightTextField.topAnchor.constraint(equalTo: sideTextField.bottomAnchor, constant: 20),
            heightTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            heightTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            calculateButton.topAnchor.constraint(equalTo: heightTextField.bottomAnchor, constant: 20),
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
        guard let sideText = sideTextField.text,
              let heightText = heightTextField.text,
              let side = Double(sideText),
              let height = Double(heightText) else {
            outputLabel.text = "Invalid input. Please enter valid side and height values."
            return
        }

        let area = calculateEquilateralTriangleArea(side: side, height: height)
        outputLabel.text = "Area of the equilateral triangle: \(area) square cm"
    }

    // Function to calculate the area of the Equilateral Triangle based on the side and height
    func calculateEquilateralTriangleArea(side: Double, height: Double) -> Double {
        // Assuming the side and height provided are for a valid equilateral triangle
        let area = (side * height) / 2.0
        return area
    }
}
