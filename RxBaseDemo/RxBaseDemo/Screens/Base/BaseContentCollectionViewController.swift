//
//  BaseViewController.swift
//  MilwaukeeDemo
//
//  Created by Thien.Vu2 on 15/11/2023.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import SnapKit

class BaseContentCollectionViewController<Section: AnimatableSectionModelType>: BaseViewController {
    var dataSource: RxCollectionViewSectionedAnimatedDataSource<Section>!
    var dataProvider: (any BaseBindingViewModelProvider)?
    var collectionViewDataSource: (any BaseCollectionViewModelDataSource)?
    
    internal lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.backgroundColor = .clear
        return collection
    }()
    
    override init(viewModel: (any BaseViewModel)? = nil) {
        super.init(viewModel: viewModel)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupContraints()
        configureCollectionView()
        createDataSource()
        bindingViewModel()
    }
    
    func setupView() {
        view.addSubview(collectionView)
    }
    
    func setupContraints() {
        collectionView.backgroundColor = UIColor.white
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

private extension BaseContentCollectionViewController {
    
    func configureCollectionView() {
        dataProvider?.configureCollectionView()
    }
    
    func bindingViewModel() {
        guard let provider = dataProvider else {
            return
        }
        
        provider.bindingViewModel()
    }
    
    func createDataSource() {
        guard let collectionViewDataSource = collectionViewDataSource else {
            return
        }
        
        dataSource = RxCollectionViewSectionedAnimatedDataSource<Section>(
            configureCell: { _, collectionView, indexPath, item in
                return collectionViewDataSource.collectionViewForCell(collectionView, indexPath: indexPath)
            },
            configureSupplementaryView: { _, collectionView, kind, indexPath in
                switch kind {
                case UICollectionView.elementKindSectionFooter:
                    return collectionViewDataSource.collectionViewForSupplementaryFooter?(collectionView, indexPath: indexPath, kind: kind) ?? UICollectionReusableView()
                    
                case UICollectionView.elementKindSectionHeader:
                    return collectionViewDataSource.collectionViewForSupplementaryHeader?(collectionView, indexPath: indexPath, kind: kind) ?? UICollectionReusableView()
                default:
                    return UICollectionReusableView()
                }
            })
        
        if let compositionalLayout = collectionViewDataSource.collectionViewLayoutItem?() {
            collectionView.setCollectionViewLayout(compositionalLayout, animated: false)
        }
    }
}
