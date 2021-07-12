//
//  DetailViewController.swift
//  LifeCycleVC
//
//  Created by 전상민 on 2021/05/16.
//

import UIKit

class DetailViewController: UIViewController { // LifeCycle 과정(생성 - 소멸)
   
    override func awakeFromNib() { // viewcontroller는 awakeFromNib이 제일 먼저 호출됨
        // 메인 스토르보드에서 viewcontroller가 연결된 시점
        // 호출이 안될수도 있는데 ViewController를 화면으로 만들지 않고 Code로 만들었을 경우이다.
        super.awakeFromNib()
        print("awakeFromNib") // Optional(나올수도 안나올수도)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewDidLoad") // once(단 한번 호출)
        
        // let testVC = UIViewController : ViewController를 화면으로 만들지 않고 Code로 만드는 방법
    }
    
    override func viewWillAppear(_ animated: Bool) { // 화면 나오기 직전 무언가를 할때
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    // 화면이 나옴
    override func viewDidAppear(_ animated: Bool) { // 그 다음 호출되는 함수
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    // 화면이 사라지는 시점
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ViewdDidDisappear")
    }
    
    deinit { // 최종적으로 Controller가 메모리에서 해제되었을때 호출됨
        // 화면을 나갔는데 deinit이 호출되지 않으면 위에서 무언가가 메모리에 아직 남아있는 상태
        print("deinit")
    }
}
