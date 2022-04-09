import UIKit

class filmeTableViewController: UITableViewController {
    
    var filmes : [dadosFilme] = []
    var bancodeDados = filmeModelo()

    override func viewDidLoad() {
        super.viewDidLoad()
        filmes = bancodeDados.todosOsFilmes()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaFilme", for: indexPath)

        celula.textLabel?.text = filmes[indexPath.row].nome
        celula.textLabel?.textColor = UIColor.white
        return celula
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            bancodeDados.deletarFilme(index: indexPath.row)
            filmes = bancodeDados.todosOsFilmes()
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let botao = self.storyboard?.instantiateViewController(withIdentifier: "FilmeStory") as! filmeViewController
        
        let alert = UIAlertController(title: filmes[indexPath.row].nome, message: filmes[indexPath.row].toString(), preferredStyle: .alert)
        
        let buttonCancel = UIAlertAction(title: "Fechar", style: .destructive, handler: {(alert) -> Void in print("OK")})
        let buttonAlter = UIAlertAction(title: "Alterar", style: .default, handler: {(alert) -> Void in
            botao.filme = self.filmes[indexPath.row]
            botao.index = indexPath.row
            self.navigationController?.pushViewController(botao, animated: true)
        })
        alert.addAction(buttonCancel)
        alert.addAction(buttonAlter)
        present(alert , animated: true, completion: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
