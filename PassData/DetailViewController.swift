
import UIKit

class DetailViewController: UIViewController {

    var someString = ""
//  무조건 같이 생성되는 변수를 만들어둠
    @IBOutlet weak var SomeLabel: UILabel!
//    화면에 올라갈 준비가 되었을때 생성됨. nil
    override func viewDidLoad() {
        super.viewDidLoad()
//    다 로드가 된 이시점에 이 코드를 넣어둔다.
        SomeLabel.text = someString
    }
    
}
