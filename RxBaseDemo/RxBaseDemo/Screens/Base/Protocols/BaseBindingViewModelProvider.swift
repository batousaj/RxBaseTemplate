//
//  BaseBindingViewModel.swift
//  MilwaukeeDemo
//
//  Created by Thien.Vu2 on 15/11/2023.
//

import Foundation
import RxCocoa
import RxDataSources
import UIKit

protocol BaseBindingViewModelProvider {
    associatedtype Section: AnimatableSectionModelType
    var viewController: BaseContentCollectionViewController<Section>? { get }
    
    func configureCollectionView()
    func bindingViewModel()
}

@objc protocol BaseCollectionViewModelDataSource {
    func collectionViewForCell(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
    
    @objc optional
    func collectionViewForSupplementaryHeader(_ collectionView: UICollectionView, indexPath: IndexPath, kind: String) -> UICollectionReusableView
    
    @objc optional
    func collectionViewForSupplementaryFooter(_ collectionView: UICollectionView, indexPath: IndexPath, kind: String) -> UICollectionReusableView
    
    func collectionViewSizeCell(sectionIndex: Int) -> NSCollectionLayoutSize
    
    @objc optional
    func collectionViewLayoutItem() -> UICollectionViewCompositionalLayout?
}
