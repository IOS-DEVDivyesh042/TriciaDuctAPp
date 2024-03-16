import UIKit

class thirty: UIViewController {

    // MARK: - UI Elements
    let angle1TextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter angle 1 in degrees"
        textField.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.5)
        textField.textAlignment = .center
        textField.layer.cornerRadius = 10
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let angle2TextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter angle 2 in degrees"
        textField.backgroundColor = UIColor.systemGreen.withAlphaComponent(0.5)
        textField.textAlignment = .center
        textField.layer.cornerRadius = 10
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let angle3TextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter angle 3 in degrees"
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
        button.tintColor = .black
        button.backgroundColor = .systemBlue
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
        view.addSubview(angle1TextField)
        view.addSubview(angle2TextField)
        view.addSubview(angle3TextField)
        view.addSubview(calculateButton)
        view.addSubview(outputLabel)

        // Set AutoLayout Constraints
        NSLayoutConstraint.activate([
            angle1TextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            angle1TextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            angle1TextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            angle2TextField.topAnchor.constraint(equalTo: angle1TextField.bottomAnchor, constant: 20),
            angle2TextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            angle2TextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            angle3TextField.topAnchor.constraint(equalTo: angle2TextField.bottomAnchor, constant: 20),
            angle3TextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            angle3TextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            calculateButton.topAnchor.constraint(equalTo: angle3TextField.bottomAnchor, constant: 20),
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
        guard let angle1Text = angle1TextField.text,
              let angle2Text = angle2TextField.text,
              let angle3Text = angle3TextField.text,
              let angle1 = Double(angle1Text),
              let angle2 = Double(angle2Text),
              let angle3 = Double(angle3Text) else {
            outputLabel.text = "Invalid input. Please enter valid angles."
            return
        }

        let area = calculateTriangleArea(angle1: angle1, angle2: angle2, angle3: angle3)
        outputLabel.text = "Area of the triangle: \(area)"
    }

    // Function to calculate the area of the triangle based on the input angles
    func calculateTriangleArea(angle1: Double, angle2: Double, angle3: Double) -> Double {
        // Assuming the angles provided form a valid triangle
        let sumOfAngles = angle1 + angle2 + angle3
        let s = sumOfAngles / 2.0
        let area = sqrt(s * (s - angle1) * (s - angle2) * (s - angle3))
        return area
    }
}
