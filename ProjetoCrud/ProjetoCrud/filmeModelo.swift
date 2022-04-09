import Foundation
import CoreData

class filmeModelo : funcoes {
    
    func salvarFilme(filme: dadosFilme){
        
        let adicionarfilme = super.saveConnectionCoreData(entityName: "Filmes")
        adicionarfilme.setValue(filme.nome, forKey: "nome")
        adicionarfilme.setValue(filme.diretor, forKey: "diretor")
        adicionarfilme.setValue(filme.ano, forKey: "ano")
        adicionarfilme.setValue(filme.genero, forKey: "genero")
        adicionarfilme.setValue(filme.duracao, forKey: "duracao")
        
        do{
            try super.getContext().save()
        } catch{
            print("Erro ao Salvar")
        }
    }
    
    func todosOsFilmes() -> [dadosFilme]{
        var listaFilme : [dadosFilme] = []
        let solicitacao = super.solicitacao(entityName: "Filmes")
        do{
            let pegarFilme = try super.getContext().fetch(solicitacao)
            for mais in pegarFilme as! [NSManagedObject]{
                let filme = dadosFilme()
                filme.nome = mais.value(forKey: "nome") as? String
                filme.duracao = mais.value(forKey: "duracao") as? String
                filme.genero = mais.value(forKey: "genero") as? String
                filme.diretor = mais.value(forKey: "diretor") as? String
                filme.ano = mais.value(forKey: "ano") as? String
                listaFilme.append(filme)
            }
        }catch{
            print("Erro")
        }
        return listaFilme
    }
    
    func deletarFilme(index : Int){
        
        let solicitacao =  super.solicitacao(entityName: "Filmes")
        
        do{
            let selecionarFilme = try super.getContext().fetch(solicitacao) as! [NSManagedObject]
            try super.getContext().delete(selecionarFilme[index])
            try super.getContext().save()
            
        }catch{
            print("Erro")
        }
    }
    
    func alterarFilme(index : Int, filme : dadosFilme){
        let solicitacao  = super.solicitacao(entityName: "Filmes")
        
        do {
            let selecionarFilme =  try super.getContext().fetch(solicitacao) as! [NSManagedObject]
            selecionarFilme[index].setValue(filme.nome,forKey: "nome")
            selecionarFilme[index].setValue(filme.ano, forKey: "ano")
            selecionarFilme[index].setValue(filme.genero, forKey: "genero")
            selecionarFilme[index].setValue(filme.duracao, forKey: "duracao")
            selecionarFilme[index].setValue(filme.diretor, forKey: "diretor")
            try super.getContext().save()
        } catch {
            print("Erro Filme não existe")
        }
    }
}
