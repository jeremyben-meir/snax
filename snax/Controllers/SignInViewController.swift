import UIKit
import GoogleSignIn

class SignInViewController: UIViewController, GIDSignInUIDelegate {
    
    var signInButton: GIDSignInButton!
    var imageView: UIImageView!
    let verticalSpace: CGFloat = 125
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        GIDSignIn.sharedInstance().uiDelegate = self
        
        imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "generic_icon")
        view.addSubview(imageView)
        
        signInButton = GIDSignInButton()
        signInButton.style = .wide
        signInButton.colorScheme = .light
        signInButton.center = view.center
        view.addSubview(signInButton)
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            imageView.bottomAnchor.constraint(equalTo: signInButton.topAnchor, constant: -10),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor)
            ])
    }
}
