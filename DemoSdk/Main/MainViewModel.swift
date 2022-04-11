//
//  MainViewModel.swift
//  DemoSdk
//
//  Created by vex on 2022/04/11.
//

import Alamofire
class MainViewModel {
    //TODO: url 수정해야 됨!
    private let url = "https://api.shoplive.cloud/v1/campaigns/CSwxW7JdpaqcJqnSYLaO"
    private let decoder = JSONDecoder()
    //TODO: 받아온 데이터를 이런 식으로 접근 하는 것이 MVVM 패턴에 맞는 방법인지 확인 필요
    var broadCastList: Observable<Array<Result>?> = Observable(nil)
    func getBroadcastList() {
        let response = AF.request(url, method: .get)
        response.responseData() { response in
            switch response.result
            {
            case .success:
                guard let test = response.value else {return}
                self.encode(test: test)
            case .failure:
                //TODO: 통신 실패 처리 필요
                print("통신 실패")
            }
        
        }
    }
    
    private func encode(test : Data) {
        guard let decoderData = try? decoder.decode(BroadCastListModel.self, from: test) else {
            return
        }
        broadCastList.value = decoderData.results
        //결과 출력 추후 삭제 필요
        print(decoderData)
    }
}
