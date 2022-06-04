//
//  NewsEditViewController.swift
//  WSP.KBTU
//
//  Created by Akniyet Turdybay on 26.05.2022.
//

import UIKit

class NewsEditViewController: UIViewController, UITextViewDelegate{
    
    var newsTitle: String? = nil
    var newsDate: String? = nil
    var newsDescription: String? = nil
    let scrollView = UIScrollView()
    let containerView = UIView()
    var index: IndexPath
    var news: [NewsCellConfigurator]  = []
    
    lazy var newsCellTitle: UITextView = {
        let newsCellTitle = UITextView()
        newsCellTitle.isScrollEnabled = false
        newsCellTitle.delegate = self
        newsCellTitle.text = newsTitle
        newsCellTitle.isUserInteractionEnabled = true
        newsCellTitle.textColor = .black
        newsCellTitle.font = UIFont.systemFont(ofSize: 30, weight: .bold)
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
    
    lazy var newsCellDescription: UITextView = {
        let newsCellDescription = UITextView()
        newsCellDescription.isScrollEnabled = false
        newsCellDescription.delegate = self
        newsCellDescription.text = newsDescription
        newsCellDescription.isUserInteractionEnabled = true
        newsCellDescription.textColor = .darkGray
        newsCellDescription.font = UIFont.systemFont(ofSize: 20, weight: .regular)
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
    
    @objc private func saveData() {
        news[index.row].item.newsTitle = self.newsCellTitle.text
        news[index.row].item.newsDescription = self.newsCellDescription.text
        let detailVC = NewsDetalisViewController(index: index, news: news)
        detailVC.newsCellTitle.text = self.newsCellTitle.text
        detailVC.newsDescription = self.newsCellDescription.text
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "E, d MMM yyyy HH:mm"
        let result = formatter.string(from: date)
        news[index.row].item.newsDate = result
        detailVC.newsDate = result
        dismiss(animated: true)
    }

    
    private func configureNavigationBar() {
        let leftNavigatiomItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backToNewsDetailPage))
        let rightNavigationItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveData))
        navigationItem.leftBarButtonItem = leftNavigatiomItem
        navigationItem.rightBarButtonItem = rightNavigationItem
        navigationItem.title = NSLocalizedString("Edit News", comment: "")
        
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
    
    @objc private func backToNewsDetailPage() {
            dismiss(animated: true)
    }
    
    
    
    
    


}
