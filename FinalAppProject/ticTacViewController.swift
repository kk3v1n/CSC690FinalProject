import UIKit

class ticTacViewController: UIViewController {
    
    //we have two cases circle / cross
    enum Turn{ //can also use boolean and int
        case Circle
        case Cross
    }
    
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var spot1: UIButton!
    @IBOutlet weak var spot2: UIButton!
    @IBOutlet weak var spot3: UIButton!
    @IBOutlet weak var spot4: UIButton!
    @IBOutlet weak var spot5: UIButton!
    @IBOutlet weak var spot6: UIButton!
    @IBOutlet weak var spot7: UIButton!
    @IBOutlet weak var spot8: UIButton!
    @IBOutlet weak var spot9: UIButton!
    
    
    var firstTurn = Turn.Cross
    
    var currentTurn = Turn.Cross
    
    var CIRCLE = "O"
    var CROSS = "X"
    
    var board = [UIButton]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
    }
    
    func initBoard(){ //collection
        board.append(spot1)
        board.append(spot2)
        board.append(spot3)
        board.append(spot4)
        board.append(spot5)
        board.append(spot6)
        board.append(spot7)
        board.append(spot8)
        board.append(spot9)
    }
    
    @IBAction func tappingAction(_ sender: UIButton) {
        addToTheBoard(sender)
        
        if(winCondition(CROSS)){
            resultAlert(title: "Cross Win!")
        }
        
        if (winCondition(CIRCLE)){
            resultAlert(title: "Circle Wins!")
        }
        
        if(fullBoard()){
            resultAlert(title: "No one wins! Draw!")
        }
    }
    
    func winCondition(_ s: String) -> Bool{
        
        //horizontal
        if symbol(spot1, s) && symbol(spot2, s) && symbol(spot3, s){
            return true
        }
        if symbol(spot4, s) && symbol(spot5, s) && symbol(spot6, s){
            return true
        }
        if symbol(spot7, s) && symbol(spot8, s) && symbol(spot9, s){
            return true
        }
        
        //vertical
        if symbol(spot1, s) && symbol(spot4, s) && symbol(spot7, s){
            return true
        }
        if symbol(spot2, s) && symbol(spot5, s) && symbol(spot8, s){
            return true
        }
        if symbol(spot3, s) && symbol(spot6, s) && symbol(spot9, s){
            return true
        }
        
        //diagonal
        if symbol(spot1, s) && symbol(spot5, s) && symbol(spot9, s){
            return true
        }
        if symbol(spot3, s) && symbol(spot5, s) && symbol(spot7, s){
            return true
        }
        
        //no one one
        return false
        
    }
    
    //checking what symbol we are with
    func symbol(_ button: UIButton, _ symbol: String) -> Bool {
        return button.title(for: .normal) == symbol
    }
    
    
    func resultAlert(title:String){
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
            self.resetBoard()
        }))
        self.present(ac, animated: true)
    }
    
    func resetBoard(){
        for button in board{
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        if (firstTurn == Turn.Circle){
            firstTurn = Turn.Cross
            turnLabel.text = CROSS
        } else if(firstTurn == Turn.Cross){
            firstTurn = Turn.Circle
            turnLabel.text = CIRCLE
        }
        currentTurn = firstTurn
        
    }
    
    func fullBoard() -> Bool {
        for button in board{
            if button.title(for: .normal) == nil{
                return false
            }
        }
        return true
    }
    
    
    func addToTheBoard(_ sender: UIButton){
        if(sender.title(for: .normal) == nil){
            if(currentTurn == Turn.Circle){
                sender.setTitle(CIRCLE, for: .normal)
                currentTurn = Turn.Cross
                turnLabel.text = CROSS
            }
            else if(currentTurn == Turn.Cross){
                sender.setTitle(CROSS, for: .normal)
                currentTurn = Turn.Circle
                turnLabel.text = CIRCLE
            }
            sender.isEnabled = false
        }
    }
    
    
    
    
    
    
    
    
    
    
}
