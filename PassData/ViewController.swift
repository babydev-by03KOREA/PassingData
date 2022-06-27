
import UIKit

// Passing Data (Data를 넘겨주는 방법)
// 1. 해당되는 인스턴스를 생성해서 그 값을 안에있는 프로퍼티에 접근해서 값을 넣는다.

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func MoveToDetail(_ sender: Any) {
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
//  Class를 인스턴스화
//  DetailViewController detailVC = new DetailViewController();
        
        self.present(detailVC, animated: true, completion: nil)
//      화면에 올라갈 준비를하고 옮겨라!
        
        detailVC.someString = "request.getParameter(String)"
//      화면에 올라갈 준비가 되어야만 생성됨
    }
    
}

