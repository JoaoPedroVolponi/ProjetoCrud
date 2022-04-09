import Foundation
import CoreData
import UIKit

class funcoes {
    func saveConnectionCoreData(entityName: String) -> NSManagedObject{
        let conexao = NSEntityDescription.insertNewObject(forEntityName: entityName, into: getContext())
        return conexao
    }
    
    func getContext() -> NSManagedObjectContext{
        let appfilme = UIApplication.shared.delegate as! AppDelegate
        let contexto = appfilme.persistentContainer.viewContext
        return contexto
    }
    
    func solicitacao (entityName: String) -> NSFetchRequest<NSFetchRequestResult>{
        let solicitacao = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        return solicitacao
        
    }
    
}
