import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var forceLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let touch = touches.first else {
      return
    }
    
    if traitCollection.forceTouchCapability == UIForceTouchCapability.available {
      if touch.force >= touch.maximumPossibleForce {
        forceLabel.text = "385+ g"
      } else {
        let force = touch.force / touch.maximumPossibleForce
        let grams = Int(force * 385)
        forceLabel.text = "\(grams) g"
      }
    }
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    forceLabel.text = "0 g"
  }
  
}

