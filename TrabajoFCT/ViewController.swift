//
//  ViewController.swift
//  TrabajoFCT
//
//  Created by Apps2M on 7/2/23.
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myButton: UIButton!
    let dataManager : DataManager = DataManager()
    let url = URL(string: "http://127.0.0.1:5000/api/usuario")
      let yourAttributes: [NSAttributedString.Key: Any] = [
          .font: UIFont.systemFont(ofSize: 14),
          .underlineStyle: NSUnderlineStyle.single.rawValue
      ]
    var listaUser : [String] = []
    var listaPass : [String] = []
    private let imageView: UIImageView = {
        let imageView = UIImageView(frame:  CGRect(x: 0, y: 0, width: 200, height: 250))
        imageView.image = UIImage(named: "LogoProyecto")
        return imageView
    }()
    
    func loadEvents(){
        URLSession.shared.dataTask(with: url!) {(data, response, error) in
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  response.statusCode == 200, error == nil else {return}
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                self.dataManager.user.removeAll()
                for nombre in json as! [[String : Any]] {
                    self.dataManager.user.append(User(json: nombre))
                }
            } catch let errorJson {
                print(errorJson)
            }
            
        }.resume()
    }
      override func viewDidLoad() {
         super.viewDidLoad()
          loadEvents()

         view.addSubview(imageView)
         
        
         let attributeString = NSMutableAttributedString(
            string: "¿Olvidaste tu contraseña?",
            attributes: yourAttributes
         )
         myButton.setAttributedTitle(attributeString, for: .normal)
      }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
            self.animate()
        })
    }
    private func animate() {
        UIView.animate(withDuration: 0.5, animations: {
            let size = self.view.frame.size.width * 0.5
            let diffX = size - self.view.frame.size.width
            let diffY = self.view.frame.size.width - size
            
            self.imageView.frame = CGRect(
                x:-(diffX/2),
                y: diffY/2,
                width: size,
                height: size
            )
            
            self.imageView.alpha = 0
            
        })
            
        
    }
    @IBAction func IniciarSesion(_ sender: Any) {
        
    }
    
}

