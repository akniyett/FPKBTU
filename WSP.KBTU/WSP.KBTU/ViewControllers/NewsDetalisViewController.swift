//
//  NewsDetalisViewController.swift
//  WSP.KBTU
//
//  Created by Lidiya Karnaukhova on 25.05.2022.
//

import UIKit

class NewsDetalisViewController: UIViewController {
   
    var newsTitle: String? = nil
    var newsDate: String? = nil
    var newsDescription: String? = nil
    var index: IndexPath
    let scrollView = UIScrollView()
    let containerView = UIView()
    var news: [NewsCellConfigurator] = []
    
    lazy var newsCellTitle: UILabel = {
        let newsCellTitle = UILabel()
        newsCellTitle.text = newsTitle
        newsCellTitle.isUserInteractionEnabled = true
        newsCellTitle.textColor = .black
        newsCellTitle.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        newsCellTitle.numberOfLines = 0
        return newsCellTitle
    }()
    
    lazy var newsCellDate: UILabel = {
        let newsCellDate = UILabel()
        newsCellDate.text = newsDate
        newsCellDate.isUserInteractionEnabled = true
        newsCellDate.textColor = .systemBlue
        newsCellDate.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        newsCellDate.numberOfLines = 0
        return newsCellDate
    }()
    
    lazy var newsCellDescription: UILabel = {
        let newsCellDescription = UILabel()
        newsCellDescription.text = newsDescription
        newsCellDescription.isUserInteractionEnabled = true
        newsCellDescription.textColor = .darkGray
        newsCellDescription.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        newsCellDescription.numberOfLines = 0
        return newsCellDescription
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupScrollView()
        configureNavigationBar()
        configureNewsCellTitle()
        configureNewsCellDate()
        configureNewsCellDescription()
    }
    
    init(index: IndexPath, news: [NewsCellConfigurator]){
        self.index = index
        self.news = news
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.alwaysBounceVertical = true
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(additionalSafeAreaInsets)
            $0.height.greaterThanOrEqualToSuperview()
        }
        
        scrollView.addSubview(containerView)
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.lessThanOrEqualToSuperview()
            $0.height.greaterThanOrEqualToSuperview()
            
        }

    }
    
    private func configureNavigationBar() {
        let rightNavigationItem  = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(presentEditPage))
        navigationItem.rightBarButtonItem = rightNavigationItem
        navigationItem.title = NSLocalizedString("News Details", comment: "")
        
    }

    private func configureNewsCellTitle() {
        containerView.addSubview(newsCellTitle)
        newsCellTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
        }
    }

    private func configureNewsCellDate() {
        containerView.addSubview(newsCellDate)
        newsCellDate.snp.makeConstraints {
            $0.top.equalTo(newsCellTitle.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
        }
    }
    
    private func configureNewsCellDescription() {
        containerView.addSubview(newsCellDescription)
        newsCellDescription.snp.makeConstraints {
            $0.top.equalTo(newsCellDate.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(20)
        }
    }

    @objc private func presentEditPage() {
        let editVC = NewsEditViewController(index: index, news: news)
        editVC.newsTitle = self.newsTitle
        editVC.newsDate = self.newsDate
        editVC.newsDescription = self.newsDescription
        let navigationVC = UINavigationController(rootViewController: editVC)
        navigationVC.modalPresentationStyle = .currentContext
        present(navigationVC, animated: true)
    }

}
