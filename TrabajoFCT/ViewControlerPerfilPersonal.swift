import UIKit

class ViewControllerPerfilPersonal: UIViewController {

    @IBOutlet weak var ImagenPerfilPersonal: UIImageView!
    

    // Dispose of any resources that can be recreated.
      override func viewDidLoad() {
         super.viewDidLoad()
          ImagenPerfilPersonal.layer.cornerRadius = ImagenPerfilPersonal.frame.size.width/2
              }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
