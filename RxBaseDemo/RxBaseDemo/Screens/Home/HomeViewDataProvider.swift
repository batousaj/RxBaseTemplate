//
//  HomeViewDataProvider.swift
//  MilkeeDemo
//
//  Created by Thien.Vu2 on 06/12/2023.
//

import Foundation
import RxCocoa
import RxDataSources
import UIKit

class HomeViewDataProvider: BaseBindingViewModelProvider {
    typealias Section = HomeSection
    public weak var viewController: BaseContentCollectionViewController<Section>?
    
    init(viewController: BaseContentCollectionViewController<Section>? = nil) {
        self.viewController = viewController
    }
    
    func configureCollectionView() {
        viewController?.collectionView.register(HomeHeaderCell.self, forCellWithReuseIdentifier: String(describing: HomeHeaderCell.self))
    }
    
    func bindingViewModel() {
        guard let viewController = viewController,
              let viewModel = viewController.viewModel as? HomeViewModel else {
            return
        }
        
        let input = HomeViewModel.Input()
        let output = viewModel.transform(input: input)
        
        output.sections
            .drive(viewController.collectionView.rx.items(dataSource: viewController.dataSource))
            .disposed(by: viewController.disposeBag)
    }
}

extension HomeViewDataProvider: BaseCollectionViewModelDataSource {
    func collectionViewForCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = self.viewController?.dataSource.sectionModels[indexPath.section].items[indexPath.row] else {
            return UICollectionViewCell()
        }
        
        switch item {
        case .headerCell:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HomeHeaderCell.self),
                                                             for: indexPath) as? HomeHeaderCell {
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
    func collectionViewSizeCell(sectionIndex: Int) -> NSCollectionLayoutSize {
        return NSCollectionLayoutSize(
            widthDimension: .absolute(133.0),
            heightDimension: .absolute(203.0))
    }
    
    func collectionViewLayoutItem() -> UICollectionViewCompositionalLayout? {
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.scrollDirection = .vertical
        configuration.interSectionSpacing = 0
        let compositionalLayout = UICollectionViewCompositionalLayout(sectionProvider: { [weak self] sectionIndex, _ in
            guard let self = self else { return nil }
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: self.collectionViewSizeCell(sectionIndex: sectionIndex),
                subitems: [NSCollectionLayoutItem(
                    layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(1.0),
                        heightDimension: .fractionalHeight(1.0)))])
            
            // Section
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .groupPaging
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 27, bottom: 10, trailing: 27)
            section.interGroupSpacing = 10
            return section
        }, configuration: configuration)
        
        return compositionalLayout
    }
}
