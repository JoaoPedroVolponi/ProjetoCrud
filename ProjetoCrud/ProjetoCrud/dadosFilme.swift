import Foundation
class dadosFilme {
    var nome : String?
    var ano : String?
    var diretor : String?
    var duracao : String?
    var genero : String?
    
    init(){}
    
    init(nome: String){
        self.nome = nome
    }
    
    init (nome : String, ano : String, diretor : String, duracao : String, genero : String) {
        self.nome = nome
        self.ano = ano
        self.diretor = diretor
        self.duracao = duracao
        self.genero = genero
    }
    func toString() -> String{
        return "Nome: \(self.nome!) \n Ano: \(self.ano!) \n Dirigido por:\(self.diretor!) \n Gênero: \(self.genero!) \n Duração: \(self.duracao!) "
    }
}
