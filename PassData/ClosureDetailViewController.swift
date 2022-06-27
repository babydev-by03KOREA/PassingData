
import UIKit

class ClosureDetailViewController: UIViewController {
//  return이 없으면 Closure의 경우 Void를 명시할것
    
    var myClosure: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func closurePassData(_ sender: Any) {
//      optional은 Delegate와 똑같이 있을수도, 없을수도 있다.
        myClosure?("closure string")
        self.dismiss(animated: true, completion: nil)
    }
    
}
