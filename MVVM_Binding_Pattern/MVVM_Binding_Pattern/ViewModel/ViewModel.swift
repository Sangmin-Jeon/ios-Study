//
//  ViewModel.swift
//  MVVM_Binding_Pattern
//
//  Created by 전상민 on 2021/07/09.
//

import Foundation

struct UserListViewModel {
    // 사용자가 업데이트 될 때마다 여기에 생성
    var users: Observable<[UserTableViewCellModel]> = Observable([])
    
}

struct UserTableViewCellModel {
    let name: String
}
