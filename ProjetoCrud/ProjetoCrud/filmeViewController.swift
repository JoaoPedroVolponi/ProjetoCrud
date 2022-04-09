import UIKit

class filmeViewController: UIViewController {
    
    var filme : dadosFilme = dadosFilme()
    var index : Int = -1
    var bancodeDados = filmeModelo()
    
    @IBOutlet weak var textGenero: UITextField!
    @IBOutlet weak var textDuracao: UITextField!
    @IBOutlet weak var textDiretor: UITextField!
    @IBOutlet weak var textNome: UITextField!
    @IBOutlet weak var textAno: UITextField!
    @IBAction func botaoSalvar(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(alterar()){
            botaoSalvar("Alterar Filme")
            
            textNome.text = filme.nome
            textDuracao.text = filme.duracao
            textDiretor.text = filme.diretor
            textAno.text = filme.ano
            textGenero.text = filme.genero
        }
       
    }
    @IBAction func botaoAddFilme(_ sender: Any) {
        filme.nome = textNome.text
        filme.duracao = textDuracao.text
        filme.diretor = textDiretor.text
        filme.ano = textAno.text
        filme.genero = textGenero.text
        if(alterar()){
            bancodeDados.alterarFilme(index: index, filme: filme)
            
        }else{
            bancodeDados.salvarFilme(filme: filme)
        }
       
    }
    func alterar() -> Bool
    {
        return index >= 0 ? true : false
    }
}
