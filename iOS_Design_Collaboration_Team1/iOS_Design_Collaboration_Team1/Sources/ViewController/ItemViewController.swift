//
//  ItemViewController.swift
//  iOS_Design_Collaboration_Team1
//
//  Created by 노한솔 on 2020/11/14.
//

import UIKit

class ItemViewController: UIViewController {
  // MARK: - IBOutlets
  @IBOutlet weak var itemCollectionView: UICollectionView!
  @IBOutlet weak var cardPageControl: UIPageControl!
  @IBOutlet weak var profileButton: UIButton!
  
  // MARK: - Properties
  var items: [ProductModel] = []
  var currentIndex: CGFloat = 0
  
  // MARK: - Functions
  func pageControlInitLayout() {
    cardPageControl.numberOfPages = items.count
    cardPageControl.currentPageIndicatorTintColor = .systemBlue
    cardPageControl.pageIndicatorTintColor = UIColor(cgColor: CGColor(red: 203/255, green: 203/255, blue: 203/255, alpha: 1))
  }
  func profileButtonInitLayout() {
    profileButton.layer.cornerRadius = profileButton.frame.height/2
    profileButton.backgroundColor = UIColor(cgColor: CGColor(red: 203/255, green: 203/255, blue: 203/255, alpha: 1))
  }
  
  // MARK: - View LifeCycles
  override func viewDidLoad() {
    super.viewDidLoad()
    
    ProductService.shared.showProducts() { NetworkResults in
      switch NetworkResults {
      case .success(let data) :
        guard let data = data as? [T] else {return}
        var tempList:[ProductModel] = []
        for i in 0..<data.count {
          let productInfo = ProductModel.init(id: data[i].id, productName: data[i].productName, subtitle: data[i].subtitle, productImageUrl: data[i].productImageUrl)
          tempList.append(productInfo)
        }
        self.items = tempList
        self.itemCollectionView.reloadData()
      case .requestError(let message):
        guard let message = message as? String else {return}
        let alertViewController = UIAlertController(title: "불러오기 실패", message: message,
                                                    preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
        alertViewController.addAction(action)
        self.present(alertViewController, animated: true, completion: nil)
      case .pathError: print("path")
      case .serverError: print("serverError")
      case .networkFail: print("networkFail")
    
      }
    }
    self.itemCollectionView.delegate = self
    self.itemCollectionView.dataSource = self
    profileButtonInitLayout()
    pageControlInitLayout()
  }
  
  
  // MARK: - Extensions
}
extension ItemViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCollectionViewCell", for: indexPath) as? ItemCollectionViewCell else {
      return UICollectionViewCell()
    }
    cell.setItemCell(productName: self.items[indexPath.item].productName, subtitle: self.items[indexPath.item].subtitle, imageURL: self.items[indexPath.item].productImageUrl)
    cell.applyButton.layer.cornerRadius = 30
    cell.itemImageView.layer.zPosition = 1
    return cell
  }
}
extension ItemViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: itemCollectionView.frame.width*290/375, height: itemCollectionView.frame.height)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return itemCollectionView.frame.width*23/375
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: itemCollectionView.frame.width*43/375, bottom: 0, right: itemCollectionView.frame.width*43/375)
  }
  
}

extension ItemViewController {
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let layout = self.itemCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
    let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
    
    var offset = targetContentOffset.pointee
    let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
    var roundedIndex = round(index)
    
    
    if scrollView.contentOffset.x > targetContentOffset.pointee.x { roundedIndex = floor(index)
      
    }
    else if scrollView.contentOffset.x < targetContentOffset.pointee.x { roundedIndex = ceil(index)
      
    }
    else {
      roundedIndex = round(index)
      
    }
    
    if currentIndex > roundedIndex { currentIndex -= 1
      roundedIndex = currentIndex
      
    }
    else if currentIndex < roundedIndex { currentIndex += 1
      roundedIndex = currentIndex
      
    }
    cardPageControl.currentPage = Int(roundedIndex)
    
    offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: 0)
    targetContentOffset.pointee = offset
  }
  
  
}
