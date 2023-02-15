import UIKit

class ViewControllerRegistro: UIViewController {

    @IBOutlet weak var myButton: UIButton!
       
      let yourAttributes: [NSAttributedString.Key: Any] = [
          .font: UIFont.systemFont(ofSize: 14),
          .underlineStyle: NSUnderlineStyle.single.rawValue
      ]
             
      
      override func viewDidLoad() {
         super.viewDidLoad()
        
         let attributeString = NSMutableAttributedString(
            string: "Términos y Condiciones",
            attributes: yourAttributes
         )
         myButton.setAttributedTitle(attributeString, for: .normal)
      }


}
