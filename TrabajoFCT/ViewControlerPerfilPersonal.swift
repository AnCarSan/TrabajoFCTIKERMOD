import UIKit

class ViewControllerPerfilPersonal: UIViewController {

    @IBOutlet weak var ImagenPerfilPersonal: UIImageView!
    

    // Dispose of any resources that can be recreated.
      override func viewDidLoad() {
         super.viewDidLoad()
          ImagenPerfilPersonal.layer.cornerRadius = ImagenPerfilPersonal.frame.size.width/2
              }
    
    let dataManager : DataManager = DataManager()
    let url = URL(string: "http://127.0.0.1:5000/api/usuario")
    func loadUsers(){
        URLSession.shared.dataTask(with: url!) {(data, response, error) in
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  response.statusCode == 200, error == nil else {return}
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                self.dataManager.user.removeAll()
                for user in json as! [[String : Any]] {
                    self.dataManager.login.append(user(json: user))
                    
                }
                for pass in json as! [[String : Any]] {
                    self.dataManager.login.append(Login(json: pass))
                    
                }
                self.listaUser.removeAll()
                for userLog in self.dataManager.login{
                    self.listaUser.append(userLog.user)
                    self.listaPass.append(userLog.pass)
                    
                }
                
            } catch let errorJson {
                print(errorJson)
            }
        }.resume()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
