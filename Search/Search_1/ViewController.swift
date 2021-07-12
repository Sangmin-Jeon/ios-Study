//
//  ViewController.swift
//  Search_1
//
//  Created by 전상민 on 2021/05/15.
//

import UIKit

class ViewController: UIViewController {
    
    var wordList = ["all","blue","sky","hello","number","marvel","super"
                    ,"친구","사랑","사람","바나나","메론","하늘","휴식"]
    
    var filteredWordList: [String] = [] // 전체 워드리스트에서 필터된 문자를 넣기위함
    var isFiltered = false // 검색을 한 상태인지 아닌상태인지를 check

    @IBOutlet weak var searchResultTableView: UITableView!
    
    // 테이블 뷰에 맞는 셀 구성
    // 필터 결과
    // 전체 결과
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchResultTableView.delegate = self // self로 할때 타입이 안맞아서 에러발생(class 타입 추가해줌)
        searchResultTableView.dataSource = self // ViewController에 Type추가 할것
        // 추가 하면서 반드시 정해진 함수를 각각 구현해야한다. func tableView
        
        // TableCell 등록
        searchResultTableView.register(UINib(nibName: "WordCell", bundle: nil), forCellReuseIdentifier: "wordCell")
        
        // search Controller를 viewController에 포함시키는 코드
        let searchC = UISearchController(searchResultsController: nil) // 보통 nil로 하면 됨
        searchC.searchResultsUpdater = self // SearchController에 text를 쓸때 계속 호출됨
        self.navigationItem.searchController = searchC
        // 만약 search Bar가 바로 안나온다면 hidesSearchBarWhenScrolling를 false로 할것
        // 이것은 초기값이 true로 되어있음
        self.navigationItem.hidesSearchBarWhenScrolling = false
        
    }
}

// 요즘 개발 style : ViewController에 뭔가 추가하려 할때 직접 넣지 않고
// extention(확장)을 사용하여 따로 만듬
// 하나의 class를 작게 하기위함 (가독성 상승)
extension ViewController: UITableViewDelegate{ // UITableViewDelegate는 해줄게 없어서 따로 뺌
    
}

extension ViewController: UITableViewDataSource{ // TableView를 구성하기 위한 필수값
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // 갯수
        
        switch isFiltered {
        case true:
            return filteredWordList.count
        case false:
            return wordList.count
        } // bool type의 경우를 다 case했음면 default는 안해도 됨
    }
    //  Cell의 높이 설정하는 함수
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 셀
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordCell") as! WordCell
        // as! WordCell 로 wordCell로 캐스팅을 해야지 그안에 내용을 사용가능(wordLabel)
        
        switch isFiltered {
        case true:
            cell.wordLabel.text = filteredWordList[indexPath.row] // 필터 됐으면 전체
        case false:
            cell.wordLabel.text = wordList[indexPath.row] // 필터가 안된상태는 전체
        }
        return cell
        
    }
    
}

extension ViewController: UISearchResultsUpdating{

    func updateSearchResults(for searchController: UISearchController) { // 검색하는 기능
        
        // searchBar에 써져있는 값을 가져옴(옵셔널 타입이라 if let)
        if let hasText = searchController.searchBar.text?.lowercased(){ // lowercased() : 소문자로 바꿈
            if hasText.isEmpty{ // 텍스트를 쓰지 않았을때(안썼을때)
                isFiltered = false
            }else{
                isFiltered = true
                // filter기능을 사용하여 전체 리스트에서 구분된 문자를 filteredWordList에 넣음
                filteredWordList = wordList.filter({ (element) -> Bool in // element: 필터를 할 대상
                // filteredWordList = wordList.filter({ $0.contains(hasText) }) // 생략된 형태
                    return element.contains(hasText) //contains: 들어있는지
                    // element에 내가 쓴 요소(hasText)가 들어있는지(들어있으면 true값)
                })
                
                
            }
            searchResultTableView.reloadData() // 테이블 뷰를 갱신하여 데이터를 보여줌
        }
    }

}
