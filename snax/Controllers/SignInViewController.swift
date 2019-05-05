import UIKit
import GoogleSignIn

class SignInViewController: UIViewController, GIDSignInUIDelegate {
    
    // MARK: - View vars
    var appNameLabel: UILabel!
    var signInButton: GIDSignInButton!
    let snaxcolor = UIColor(red: 31/255.0, green: 207/255.0, blue: 131/255.0, alpha: 1.0)
    
    // MARK: - Constants
    let verticalSpace: CGFloat = 125
    let appName = "Snax"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        GIDSignIn.sharedInstance().uiDelegate = self
        
        setupViews()
        setupConstraints()
        
    }
    
    func setupViews() {
        appNameLabel = UILabel()
        appNameLabel.translatesAutoresizingMaskIntoConstraints = false
        appNameLabel.font = UIFont.boldSystemFont(ofSize: 40)
        appNameLabel.textAlignment = .center
        appNameLabel.text = appName
        appNameLabel.textColor = snaxcolor
        view.addSubview(appNameLabel)
        
        signInButton = GIDSignInButton()
        signInButton.style = .wide
        signInButton.colorScheme = .light
        signInButton.center = view.center
        view.addSubview(signInButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            appNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            appNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            appNameLabel.bottomAnchor.constraint(equalTo: signInButton.topAnchor, constant: -10),
            appNameLabel.widthAnchor.constraint(equalTo: view.widthAnchor),
           
            
            ])
}
    @objc func PresentSignUpScreen(){
        let signUpViewController = SignUpViewController()
        present(signUpViewController, animated: true, completion: nil)
    }
}
