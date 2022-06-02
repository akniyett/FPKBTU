//
//  NewsViewController.swift
//  WSP.KBTU
//
//  Created by Lidiya Karnaukhova on 26.04.2022.
//

import UIKit

class NewsViewController: UIViewController {
    
    let viewModel = NewsViewModel()
    var news: [NewsCellConfigurator] = []

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.tableView.delegate = self
        self.tableView.dataSource = self
        configureNavigationBar()
        configureTableView()
        news = viewModel.getNews()
    }
    
    private func configureNavigationBar() {
        let leftNavigationItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backToLogIn))
        navigationItem.leftBarButtonItem = leftNavigationItem
        navigationItem.title = NSLocalizedString("News", comment: "")
    }

    private func configureTableView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
                .inset(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        }
    }
    
    @objc private func backToLogIn() {
        let rootVC = LogInViewController()
        let navigationVC = UINavigationController(rootViewController: rootVC)
        navigationVC.modalPresentationStyle = .currentContext
        present(navigationVC, animated: true)
    }
}

extension NewsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var item: CellConfigurator
        item = news[indexPath.row]
        
        tableView.register(type(of: item).cellClass, forCellReuseIdentifier: type(of: item).reuseId)
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId, for: indexPath)
        item.configure(cell: cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        let rootVC = NewsDetalisViewController(index: indexPath, news: news)
        rootVC.newsTitle = news[indexPath.row].item.newsTitle
        rootVC.newsDate = news[indexPath.row].item.newsDate
        rootVC.newsDescription = news[indexPath.row].item.newsDescription
        self.navigationController?.pushViewController(rootVC, animated: true)
    }
}

