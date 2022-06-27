
import UIKit

class InstanceDetailViewController: UIViewController {
//  나 자신에 대한 인스턴스를 넘겨줄때
//  나 자신에 대한 접근을 할 수 있도록 해줌
    var mainVC: ViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func sendDataMainVc(_ sender: Any) {
        mainVC?.dataLabel.text = "OH YEAH"
    }
    
}
