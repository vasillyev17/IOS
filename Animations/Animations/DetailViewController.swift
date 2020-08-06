import UIKit

class DetailViewController: UIViewController {

  var barTitle = ""
  var animateView: UIView!
  fileprivate let duration = 2.0
  fileprivate let delay = 0.2
  fileprivate let scale = 1.2
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupRect()
    setupNavigationBar()
    but.layer.cornerRadius = 5
  }
  
  fileprivate func setupNavigationBar() {
    navigationController?.navigationBar.topItem?.title = barTitle
  }
  
  fileprivate func setupRect() {
      animateView = drawRectView(UIColor.red, frame: generalFrame, center: generalCenter)
    view.addSubview(animateView)
  }
  
    @IBOutlet weak var but: UIButton!
    @IBAction func didTapAnimate(_ sender: AnyObject) {
    switch barTitle {
    case "2-Color":
      changeColor(UIColor.green)
      
    case "Simple 2D Rotation":
      rotateView(Double.pi)
      
    case "Multicolor":
      multiColor(UIColor.green, UIColor.blue)
      
    case "Multi Point Position":
      multiPosition(CGPoint(x: animateView.frame.origin.x, y: 100), CGPoint(x: animateView.frame.origin.x, y: 350))
  
      
    case "Color and Frame Change":
      let currentFrame = self.animateView.frame
      let firstFrame = currentFrame.insetBy(dx: -30, dy: -50)
      let secondFrame = firstFrame.insetBy(dx: 10, dy: 15)
      let thirdFrame = secondFrame.insetBy(dx: -15, dy: -20)
      colorFrameChange(firstFrame, secondFrame, thirdFrame, UIColor.orange, UIColor.yellow, UIColor.green)
      
      
    case "Pop":
      Pop()
      
    default:
      let alert = makeAlert("Alert", message: "The animation not implemented yet", actionTitle: "OK")
      self.present(alert, animated: true, completion: nil)
    }
  }
  
  fileprivate func changeColor(_ color: UIColor) {
    UIView.animate(withDuration: self.duration, animations: {
      self.animateView.backgroundColor = color
      }, completion: nil)
  }
  
  fileprivate func multiColor(_ firstColor: UIColor, _ secondColor: UIColor) {
    UIView.animate(withDuration: duration, animations: {
      self.animateView.backgroundColor = firstColor
      }, completion: { finished in
        self.changeColor(secondColor)
    })
  }
  
  fileprivate func multiPosition(_ firstPos: CGPoint, _ secondPos: CGPoint) {
    func simplePosition(_ pos: CGPoint) {
      UIView.animate(withDuration: self.duration, animations: {
        self.animateView.frame.origin = pos
      }, completion: nil)
    }
    
    UIView.animate(withDuration: self.duration, animations: {
      self.animateView.frame.origin = firstPos
      }, completion: { finished in
        simplePosition(secondPos)
    })
  }
  
  fileprivate func rotateView(_ angel: Double) {
    UIView.animate(withDuration: duration, delay: delay, options: [.repeat], animations: {
      self.animateView.transform = CGAffineTransform(rotationAngle: CGFloat(angel))
      }, completion: nil)
  }
  
  fileprivate func colorFrameChange(_ firstFrame: CGRect, _ secondFrame: CGRect, _ thirdFrame: CGRect,
                                _ firstColor: UIColor, _ secondColor: UIColor, _ thirdColor: UIColor) {
    UIView.animate(withDuration: self.duration, animations: {
      self.animateView.backgroundColor = firstColor
      self.animateView.frame = firstFrame
      }, completion: { finished in
        UIView.animate(withDuration: self.duration, animations: {
          self.animateView.backgroundColor = secondColor
          self.animateView.frame = secondFrame
          }, completion: { finished in
            UIView.animate(withDuration: self.duration, animations: {
              self.animateView.backgroundColor = thirdColor
              self.animateView.frame = thirdFrame
              }, completion: nil)
        })
    })
  }
  
  fileprivate func curvePath(_ endPoint: CGPoint, controlPoint1: CGPoint, controlPoint2: CGPoint) {
    let path = UIBezierPath()
    path.move(to: self.animateView.center)
    
    path.addCurve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)

    let anim = CAKeyframeAnimation(keyPath: "position")
    
    anim.path = path.cgPath
    
    anim.duration = self.duration
    
    self.animateView.layer.add(anim, forKey: "animate position along path")
    self.animateView.center = endPoint
  }
  
  fileprivate func Pop() {
    UIView.animate(withDuration: duration / 4,
      animations: {
      self.animateView.transform = CGAffineTransform(scaleX: CGFloat(self.scale), y: CGFloat(self.scale))
      }, completion: { finished in
        UIView.animate(withDuration: self.duration / 4, animations: {
          self.animateView.transform = CGAffineTransform.identity
        })
    })
  }
   
}
