//
//  RateVC.swift
//  TindershipHackathon
//
//  Created by Taylor Givens on 8/2/23.
//

import UIKit

class RateVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        // Do any additional setup after loading the view.
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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
