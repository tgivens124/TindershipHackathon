//
//  MatchVC.swift
//  TindershipHackathon
//
//  Created by Taylor Givens on 8/2/23.
//

import UIKit

class MatchVC: UIViewController {
    @IBOutlet weak var match1: UIButton!
    
    
    @IBOutlet weak var match2: UIButton!
    @IBOutlet weak var bubbles: UILabel!
      
    @IBOutlet weak var Continue: UIButton!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view1: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        // Do any additional setup after loading the view.
        bubbles.layer.masksToBounds = true
        bubbles.layer.cornerRadius = 10
        
        view1.layer.cornerRadius = 14
        
       view2.layer.cornerRadius = 13
       view1.isHidden = true
        view2.isHidden = true
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
    
    @IBAction func match1(_ sender: Any) {
        view2.isHidden = false
    }
    
    @IBAction func match2(_ sender: Any) {
      
        view1.isHidden = false
    }
    
    @IBAction func ContinueToMatch(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "RateVC") as! RateVC
        self.navigationController?.pushViewController(viewController, animated: true)
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
