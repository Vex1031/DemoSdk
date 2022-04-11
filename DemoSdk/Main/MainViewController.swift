//
//  MainViewController.swift
//  DemoSdk
//
//  Created by vex on 2022/04/11.
//
import UIKit
import SnapKit

final class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private var dateFomatter : DateFormatter = {
      let date = DateFormatter()
        date.dateFormat = "yyyy-MM-dd HH:mm"
        return date
    }()
    
    private var date = Date()
    private let viewModel = MainViewModel()
    
    private lazy var broadCastTableView : UITableView = {
        let table = UITableView()
        table.register(BroadCastTableCell.self, forCellReuseIdentifier: "cell")
        table.dataSource = self
        table.delegate = self
        table.rowHeight = 100
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(broadCastTableView)
        setTable()
        setNavigation()
        viewModel.getBroadcastList()
        reloadTebleView()
    }
    
    private func reloadTebleView() {
        viewModel.broadCastList.bind{ make in
            self.broadCastTableView.reloadData()
        }
    }
    
    private func setNavigation() {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "DemoSdk"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setTable() {
        broadCastTableView.snp.makeConstraints{make in
            make.width.height.equalToSuperview()
            make.top.equalToSuperview()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.broadCastList.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = broadCastTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? BroadCastTableCell else {
            return UITableViewCell()
        }
        guard let title = viewModel.broadCastList.value?[indexPath.row].title else {
            return UITableViewCell()
        }
        guard let status = viewModel.broadCastList.value?[indexPath.row].campaignStatus else {
            return UITableViewCell()
        }
        guard let schedule = viewModel.broadCastList.value?[indexPath.row].scheduledAt else {
            return UITableViewCell()
        }
        //TODO: 이미지를 변환하는 코드가 너무 김.... 좋은 방법을 찾아봐야 함
        guard let thumnail = viewModel.broadCastList.value?[indexPath.row].backgroundURL else {
            return UITableViewCell()
        }
        guard let imageUrl = URL(string: thumnail) else {
            return UITableViewCell()
        }
        guard let imageData = try? Data(contentsOf: imageUrl) else {
            return UITableViewCell()
        }
        date = Date(timeIntervalSince1970: (Double(schedule) / 1000.0))
        cell.broadcastLabel.text = title
        cell.statusLabel.text = status
        cell.scheduleLabel.text = dateFomatter.string(from: date)
        cell.thumnailImage.image = UIImage(data: imageData)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        moveDetailConroller()
    }
    
    private func moveDetailConroller() {
        let controller = DetailController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
