//
//  JoinBubbleVC.swift
//  TindershipHackathon
//
//  Created by Taylor Givens on 8/1/23.
//

import UIKit

class ChatBubbleVC: UIViewController {
    @IBOutlet weak var voiceNotes: UIImageView!
    @IBOutlet weak var keyCocktails: UIImageView!
    @IBOutlet weak var roys: UIImageView!

    @IBOutlet weak var viewToBlur: UIView!
    @IBOutlet weak var pop: UIImageView!
    
    @IBOutlet weak var No: UIButton!
    @IBOutlet weak var bubbleLabel: UILabel!
    
    @IBOutlet weak var extendTime: UIImageView!
    @IBOutlet weak var typingRect: UIImageView!
    @IBOutlet weak var typing: UIImageView!
    @IBOutlet weak var dots: UIImageView!
    @IBOutlet weak var voice: UIImageView!
  
    @IBOutlet weak var TimerLabel: UILabel!
    @IBOutlet weak var extend: UIButton!
    
    @IBOutlet weak var bubbleBack: UIImageView!
    var timer: Timer?
    var totalSeconds = 5 * 60 + 5
       
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        bubbleBack.isHidden = true
        updateCountdown()
        // Do any additional setup after loading the view.
        bubbleLabel.layer.masksToBounds = true
        bubbleLabel.layer.cornerRadius = 10
        
        voiceNotes.isHidden = true
        keyCocktails.isHidden = true
        typing.isHidden = true
        typingRect.isHidden = true
        dots.isHidden = true
        voice.isHidden = true
        pop.isHidden = true
        extend.isHidden = true
        extendTime.isHidden = true
        No.isHidden = true
        viewToBlur.layer.cornerRadius = 10
        
    }
    
    // Function to format the time in minutes and seconds
     func formatTime(minutes: Int, seconds: Int) -> String {
         return String(format: "%2d:%02d", minutes, seconds)
     }
     
     // Function to update the countdown timer
     func updateCountdown() {
         timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
             guard let self = self else { return }
             
             let minutes = self.totalSeconds / 60
             let seconds = self.totalSeconds % 60
             self.TimerLabel.text = self.formatTime(minutes: minutes, seconds: seconds)
             bubbleBack.isHidden = false
             self.totalSeconds -= 1
             
         }
     }
    
    @IBAction func extend(_ sender: Any) {
        pop.isHidden = true
        extend.isHidden = true
        extendTime.isHidden = false
        No.isHidden = false
    }
    @IBAction func no(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MatchVC") as! MatchVC
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)

      
        // Use DispatchQueue to show the first image view after 2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            self.typing.isHidden = false
            self.typingRect.isHidden = false
        }
        // Use DispatchQueue to show the second image view after 4 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.7) {
            self.keyCocktails.isHidden = false
            self.typing.isHidden = true
            self.typingRect.isHidden = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.4) {
            self.voiceNotes.isHidden = false
            self.dots.isHidden = false
            self.voice.isHidden = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.pop.isHidden = false
            self.extend.isHidden = false
            self.applyBlurEffect()
            }
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
    
    func applyBlurEffect() {
          // Create a UIBlurEffect with the desired style (e.g., .light, .dark, .extraLight, .prominent, etc.)
          let blurEffect = UIBlurEffect(style: .prominent)

          // Create a UIVisualEffectView with the blur effect
          let blurView = UIVisualEffectView(effect: blurEffect)

          // Set the size of the blur view to match the size of the view you want to blur
          blurView.frame = viewToBlur.bounds

          // Add the blur view as a subview to the view you want to blur
          viewToBlur.addSubview(blurView)

          // If you want to blur only the background of the view and not its subviews, use this line instead:
          // viewToBlur.insertSubview(blurView, at: 0)
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
