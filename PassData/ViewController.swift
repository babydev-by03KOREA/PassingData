
import UIKit

// Passing Data (Data를 넘겨주는 방법)
// 1. 해당되는 인스턴스를 생성해서 그 값을 안에있는 프로퍼티에 접근해서 값을 넣는다.
// 2. segue

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//      실행이 될 때(화살표)
        if segue.identifier == "segueDetail" {
//      만약 id가 segueDetail이라면,
            if let detailVC = segue.destination as? SegueDetailViewController {
//              목적지가 ViewController로 되어있다면,
                detailVC.dataString =  "Values"
//              detailVC에 dataString이라는 변수에 "값"을 넣어서 넘겨줘!
            }
//      목적지인 SegueDetailViewController에서 작성된 타입캐스트 해서 IBOutlet에 직접 접근함.
        }
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

