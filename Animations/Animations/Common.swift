import Foundation
import UIKit

let screenRect = UIScreen.main.bounds
let generalFrame = CGRect(x: 0, y: 0, width: screenRect.width / 1.3, height: screenRect.height / 3.0)
let generalCenter = CGPoint(x: screenRect.midX, y: screenRect.midY - 50)

func drawRectView(_ color: UIColor, frame: CGRect, center: CGPoint) -> UIView {
  let view = UIImageView(frame: frame)
  view.center = center
  view.image = UIImage(named: "skull")
  view.backgroundColor = color
  return view
}


func makeAlert(_ title: String, message: String, actionTitle: String) -> UIAlertController {
  let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
  alert.addAction(UIAlertAction(title: actionTitle, style: UIAlertAction.Style.default, handler: nil))
  
  return alert
}
