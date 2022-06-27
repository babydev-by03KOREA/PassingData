
import UIKit

// Passing Data (Data를 넘겨주는 방법)
// 1. 해당되는 인스턴스를 생성해서 그 값을 안에있는 프로퍼티에 접근해서 값을 넣는다.
// 2. segue
// 3. instance
// 4. delegate pattern 대리/위임
// 5. clousure
// 6. Notification

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationName = Notification.Name("sendSomeString")
//        addObserver의 경우 여러번 호출되지않게 주의해야함.
//        Notification은 addEventListener()과 같이 키보드 input등의 작업 시 호출됨.
        NotificationCenter.default.addObserver(self, selector: #selector(showSomeString), name: notificationName, object: nil)
        
//      자동으로 이벤트가 잡히는걸 Setting할 수 있다.
//      특정한 func 호출을 위해 #selector을 사용한다.
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        
//      필요없으면 remove observe 기능을 사용해서 지울수 있다.
    }
    
    @objc func keyboardWillShow() {
        print("will show")
    }
    
    @objc func keyboardDidShow() {
        print("did show")
    }
    
    @objc func showSomeString(notification: Notification) {
        if let str = notification.userInfo?["str"] as? String {
            self.dataLabel.text = str
        }
        
    }
    
    @IBOutlet weak var dataLabel: UILabel!
    
    @IBAction func moveToInstance(_ sender: Any) {
        let detailVC = InstanceDetailViewController(nibName: "InstanceDetailViewController", bundle: nil)
         
        detailVC.mainVC = self
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
//  2. segue
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

// 호출/구현부가 나누어져있음
    @IBAction func moveToDelegate(_ sender: Any) {
         let detailVC = DelegateDetailViewController(nibName: "DelegateDetailViewController", bundle: nil)
        detailVC.delegate = self
//      구현된 자신을 확인하는 self입니다.
//      명시된 타입을 준수해야만 합니다.
        self.present(detailVC, animated: true, completion: nil)
    }
    
    @IBAction func moveToClosure(_ sender: Any) {
        let detailVC = ClosureDetailViewController(nibName: "ClosureDetailViewController", bundle: nil)
//  return받아서 호출
        detailVC.myClosure = { str in
            self.dataLabel.text = str
        }
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
    
    @IBAction func moveToNoti(_ sender: Any) {
        let detailVC = NotiDetailViewController(nibName: "NotiDetailViewController", bundle: nil)
        self.present(detailVC, animated: true, completion: nil)
    }
}

//  '내가 선언한 프로토콜을 준수합니다'라는 정의가 반드시 필요합니다.
extension ViewController: DelegateDetailViewControllerDelegate {
    func passString(string: String) {
        self.dataLabel.text = string
    }
}
