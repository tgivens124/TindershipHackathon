//
//  ViewController.swift
//  TindershipHackathon
//
//  Created by Taylor Givens on 7/31/23.
//

import UIKit

class EnterBubbleVC: UIViewController {

    @IBOutlet weak var joinNow: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setGradientBackground()
        joinNow.layer.cornerRadius = 22
        setBubble()
        
    }
    func setBubble(){
        let bubbleImage = UIImage(named: "Bubble.png")
           
        let bubbleImageView = UIImageView(image: bubbleImage)
           // Set the frame of the UIImageView to position and size it within the view
           bubbleImageView.frame = CGRect(x: 50, y: 150, width: 300, height: 300)
           
           // Add the UIImageView as a subview to the desired view (e.g., self.view)
           view.addSubview(bubbleImageView)
    }
    

    func setGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(hex: "#041933").cgColor, UIColor(hex: "#91BCF1").cgColor]
        gradientLayer.locations = [0.0, 1.0] // You can adjust the gradient stops here
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0) // Start point of the gradient
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)   // End point of the gradient
        gradientLayer.frame = view.bounds // Set the frame to fill the entire view
        
        view.layer.insertSublayer(gradientLayer, at: 0) // Add the gradient layer to the backmost position
    }
    
    @IBAction func joinBubble(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "NavigateBubbleVC") as! NavigateBubbleVC
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}
extension UIColor {
    convenience init(hex: String) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }

        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)

        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
