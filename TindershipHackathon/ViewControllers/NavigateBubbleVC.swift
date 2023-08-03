//
//  CreateBubbleVC.swift
//  TindershipHackathon
//
//  Created by Taylor Givens on 8/1/23.
//

import UIKit

class NavigateBubbleVC: UIViewController {
    @IBOutlet weak var create: UIButton!
    @IBOutlet weak var join: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        // Do any additional setup after loading the view.
       
        join.layer.cornerRadius = 20
        create.layer.cornerRadius = 20

    }
    
    @IBAction func joinBubble(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ExploreVC") as! ExploreVC
        self.navigationController?.pushViewController(viewController, animated: true)
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

}
