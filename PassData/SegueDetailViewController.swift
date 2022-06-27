// 화살표로 연결된 화면의 ViewController은 본 Class와 연결됨.
import UIKit

class SegueDetailViewController: UIViewController {
    var dataString = ""
    
    @IBOutlet weak var dataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataLabel.text = dataString
//      화면에 올라갈 준비를 해 줘야만 함!
    }
    

}
