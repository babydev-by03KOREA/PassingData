
import UIKit

// protocol: 반드시 사용되어야할것을 선언해두는것!
// 뼈대만 만들어놓기 때문에 func의 return (ex/ -> bool)은 명시하지 않는다.
protocol DelegateDetailViewControllerDelegate: AnyObject {
    func passString (string: String)
}

class DelegateDetailViewController: UIViewController {
//  weak -> 주소값만 가지는 약한참조. 사용이 끝나면 자원해제
//  다른쪽에서 만들고 끝나면 그쪽에서 끝남(소멸)
//  이 프로토콜에서 선언된걸 강제로 구현해!
    weak var delegate: DelegateDetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func passDataToMainVC(_ sender: Any) {
        delegate?.passString(string: "delegate pass Data")
        self.dismiss(animated: true, completion: nil)
    }
    
}
