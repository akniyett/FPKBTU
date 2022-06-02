//
//  NewsTableViewCell.swift
//  WSP.KBTU
//
//  Created by Lidiya Karnaukhova on 26.04.2022.
//

import UIKit
import SnapKit

typealias NewsCellConfigurator = TableCellConfigurator<NewsTableViewCell, News>

class NewsTableViewCell: UITableViewCell, ConfigurableCell {
    
    typealias DataType = News
    static let identifier = "NewsTableCell"
        
    let date: UILabel = {
        let date = UILabel()
        date.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        date.textColor = .systemBlue
        return date
    }()
    
    let title: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        title.textColor = .black
        title.numberOfLines = 0
        return title
    }()
    
    let descript: UILabel = {
        let descript = UILabel()
        descript.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        descript.textColor = .gray
        descript.numberOfLines = 0
        return descript
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: News) {
        date.text = data.newsDate
        title.text = data.newsTitle
        descript.text = data.newsDescription
    }
    
    private func layoutUI() {
        contentView.addSubview(date)
        contentView.addSubview(title)
        contentView.addSubview(descript)
        
        date.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(title.snp.top)
        }
        
        title.snp.makeConstraints {
            $0.top.equalTo(date.snp.bottom).offset(6)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(descript.snp.top)
        }
        
        descript.snp.makeConstraints {
            $0.top.equalTo(title.snp.bottom).offset(6)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(10)
        }
    }
}

