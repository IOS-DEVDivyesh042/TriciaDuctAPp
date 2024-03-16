import UIKit

class IsoscelesTriangle: UIViewController {

    // MARK: - UI Elements
    let side1TextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter length of side 1 in cm"
        textField.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.5)
        textField.textAlignment = .center
        textField.layer.cornerRadius = 10
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let side2TextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter length of side 2 in cm"
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
        view.addSubview(side1TextField)
        view.addSubview(side2TextField)
        view.addSubview(heightTextField)
        view.addSubview(calculateButton)
        view.addSubview(outputLabel)

        // Set AutoLayout Constraints
        NSLayoutConstraint.activate([
            side1TextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            side1TextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            side1TextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            side2TextField.topAnchor.constraint(equalTo: side1TextField.bottomAnchor, constant: 20),
            side2TextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            side2TextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            heightTextField.topAnchor.constraint(equalTo: side2TextField.bottomAnchor, constant: 20),
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
        guard let side1Text = side1TextField.text,
              let side2Text = side2TextField.text,
              let heightText = heightTextField.text,
              let side1 = Double(side1Text),
              let side2 = Double(side2Text),
              let height = Double(heightText) else {
            outputLabel.text = "Invalid input. Please enter valid side and height values."
            return
        }

        let area = calculateIsoscelesTriangleArea(side1: side1, side2: side2, height: height)
        outputLabel.text = "Area of the isosceles triangle: \(area) square cm"
    }

    // Function to calculate the area of the Isosceles Triangle based on the sides and height
    func calculateIsoscelesTriangleArea(side1: Double, side2: Double, height: Double) -> Double {
        // Assuming the sides and height provided are for a valid isosceles triangle
        let base = (side1 == side2) ? side1 : (2 * side1 * side2) / (side1 + side2) // calculate base for isosceles triangle
        let area = (base * height) / 2.0
        return area
    }
}
