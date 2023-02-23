class Pelicula : Codable{
    public let nombre: String
    public let genero: String
    public let director: String
    public let protagonista: String
    public let descripcionCorta: String
    public let foto: String
    public let anoDePublicacion: String
    public let duracion: String
  
    
    init(json: [String: Any]) {
        nombre = json["nombre"] as? String ?? ""
        genero = json["contrasena"] as? String ?? ""
        director = json["director"] as? String ?? ""
        protagonista = json["protagonista"] as? String ?? ""
        descripcionCorta = json["descripcionCorta"] as? String ?? ""
        foto = json["foto"] as? String ?? ""
        anoDePublicacion = json["anoDePublicacion"] as? String ?? ""
        duracion = json["duracion"] as? String ?? ""
        }
}
