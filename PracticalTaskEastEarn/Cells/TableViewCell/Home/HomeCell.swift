//
//  HomeCell.swift
//  PracticalTaskEastEarn
//
//  Created by Disha on 26/02/24.
//

import UIKit

class HomeCell: UITableViewCell {
    
    //MARK: - OUTLETS

    @IBOutlet weak var lblTitleLabel: UILabel!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var collectionFlowHeight: UICollectionViewFlowLayout!
    @IBOutlet weak var stackViewLeading: NSLayoutConstraint!
    @IBOutlet weak var stackViewTralling: NSLayoutConstraint!
    @IBOutlet weak var pageControll: UIPageControl!
    
    //MARK: - VARIABLES
    
    var mainData: Home?
    var categoryData: Category?
    var bottmData: Botom?
    var arrTopSecound: [MainStickyMenu] = []
    var row = Int()
    var firstRow = Int()
    var timer: Timer?
    let timeInterval: Double = 2.0 
    var currentIndex = 0
    var centerCell: UnStichedCell?
    
    //MARK: - METHODS
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.homeCollectionView.delegate = self
        self.homeCollectionView.dataSource = self
        print(self.arrTopSecound)
        self.initialDetails()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - FUNCTIONS
    
    func initialDetails() {
        self.homeCollectionView.register(UINib(nibName: "topFirstCell", bundle: nil), forCellWithReuseIdentifier: "topFirstCell")
        self.homeCollectionView.register(UINib(nibName: "TopSecoundCell", bundle: nil), forCellWithReuseIdentifier: "TopSecoundCell")
        self.homeCollectionView.register(UINib(nibName: "ShortByCategoryCell", bundle: nil), forCellWithReuseIdentifier: "ShortByCategoryCell")
        self.homeCollectionView.register(UINib(nibName: "ShopByFebricCell", bundle: nil), forCellWithReuseIdentifier: "ShopByFebricCell")
        self.homeCollectionView.register(UINib(nibName: "UnStichedCell", bundle: nil), forCellWithReuseIdentifier: "UnStichedCell")
        self.homeCollectionView.register(UINib(nibName: "BeuqueCollectionCell", bundle: nil), forCellWithReuseIdentifier: "BeuqueCollectionCell")
    }
    
}
//MARK: - DELEGATE METHODS OF COLLECTIONVIEW
extension HomeCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.row == 0 && section == 0 {
            return self.mainData?.mainStickyMenu.count ?? 0
        }else if self.row == 1 && section == 1 {
            return self.arrTopSecound.count
        }else if self.row == 2 && section == 2 {
            return self.categoryData?.shopByCategory.count ?? 0
        }else if self.row == 3 && section == 3 {
            return self.categoryData?.shopByFabric.count ?? 0
        }else if self.row == 4 && section == 4 {
            return self.categoryData?.unstitched.count ?? 0
        }else if self.row == 5 && section == 5{
            return self.categoryData?.boutiqueCollection.count ?? 0
        }else if self.row == 6 && section == 6 {
            return self.bottmData?.rangeOfPattern.count ?? 0
        }else if self.row == 7 && section == 7 {
            return self.bottmData?.designOccasion.count ?? 0
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topFirstCell", for: indexPath) as! topFirstCell
            cell.configureCell(self.mainData?.mainStickyMenu[indexPath.row])
            timer?.invalidate()
            self.timer = nil
            return cell
        }else if indexPath.section == 1  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopSecoundCell", for: indexPath) as! TopSecoundCell
            self.startAutoScrollingIn2ndCell()
            cell.configureCell(self.arrTopSecound[indexPath.row])
            return cell
        }else if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShortByCategoryCell", for: indexPath) as! ShortByCategoryCell
            cell.categoryConfigCell(self.categoryData?.shopByCategory[indexPath.row])
            timer?.invalidate()
            self.timer = nil
            return cell
        }else if indexPath.section == 3 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopByFebricCell", for: indexPath) as! ShopByFebricCell
            cell.configureCell(self.categoryData?.shopByFabric[indexPath.row])
            timer?.invalidate()
            self.timer = nil
            return cell
        }else if indexPath.section == 4 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UnStichedCell", for: indexPath) as! UnStichedCell
            self.collectionFlowHeight.minimumInteritemSpacing = 10
            self.collectionFlowHeight.minimumLineSpacing = 20
            self.collectionFlowHeight.sectionInset.right = 10
            self.collectionFlowHeight.sectionInset.left = 0
            cell.configureCell(self.categoryData?.unstitched[indexPath.row])
            timer?.invalidate()
            self.timer = nil
            return cell
        }else if indexPath.section == 5 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BeuqueCollectionCell", for: indexPath) as! BeuqueCollectionCell
            self.startAutoScroll()
            cell.configureCell(self.categoryData?.boutiqueCollection[indexPath.row])
            return cell
        }else if indexPath.section == 6 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopByFebricCell", for: indexPath) as! ShopByFebricCell
            cell.configureRangeOfCell(self.bottmData?.rangeOfPattern[indexPath.row])
            timer?.invalidate()
            self.timer = nil
            return cell
        }else if indexPath.section == 7 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShortByCategoryCell", for: indexPath) as! ShortByCategoryCell
            cell.designAsPerConfigCell(self.bottmData?.designOccasion[indexPath.row])
            timer?.invalidate()
            self.timer = nil
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topFirstCell", for: indexPath) as! topFirstCell
            cell.configureCell(self.mainData?.mainStickyMenu[indexPath.row])
            timer?.invalidate()
            self.timer = nil
            print(self.arrTopSecound.count)
            return cell
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: self.homeCollectionView.frame.size.width / 2.5, height: self.homeCollectionView.frame.size.height)
        }else if indexPath.section == 1 {
            return CGSize(width: self.homeCollectionView.frame.size.width, height: self.homeCollectionView.frame.size.height)
        }else if indexPath.section == 2 {
            return CGSize(width: self.homeCollectionView.frame.size.width / 2.5, height: self.homeCollectionView.frame.size.height / 2 - 10)
        }else if indexPath.section == 3 {
            return CGSize(width: self.homeCollectionView.frame.size.width / 2.5, height: self.homeCollectionView.frame.size.height / 2 - 8)
        }else if indexPath.section == 4 {
            return CGSize(width: self.homeCollectionView.frame.size.width / 1.5, height: self.homeCollectionView.frame.size.height)
        }else if indexPath.section == 5 {
            return CGSize(width: self.homeCollectionView.frame.size.width, height: 400)
        }else if indexPath.section == 6 {
            return CGSize(width: self.homeCollectionView.frame.size.width / 2.5, height: self.homeCollectionView.frame.size.height / 2 - 8)
        }else if indexPath.section == 7 {
            return CGSize(width: self.homeCollectionView.frame.size.width / 3.2, height: 180)
        }else{
            return CGSize()
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
      let layout = self.homeCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing

      var offset = targetContentOffset.pointee
      let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing

      let roundedIndex = round(index)

      offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: scrollView.contentInset.top)

      targetContentOffset.pointee = offset
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
      guard scrollView is UICollectionView else {return}

      let centerPoint = CGPoint(x: self.homeCollectionView.frame.size.width / 2 + scrollView.contentOffset.x,
                                y: self.homeCollectionView.frame.size.height / 2 + scrollView.contentOffset.y)
      if let indexPath = self.homeCollectionView.indexPathForItem(at: centerPoint) {
        self.centerCell = (self.homeCollectionView.cellForItem(at: indexPath) as? UnStichedCell)
        self.centerCell?.transformToLarge()
      }

      if let cell = self.centerCell {
        let offsetX = centerPoint.x - cell.center.x
        if offsetX < -100 || offsetX > 100 {
          cell.transformToStandard()
          self.centerCell = nil
        }
      }
    }
    
    // Start auto-scrolling
        func startAutoScroll() {
            // Invalidate previous timer if exists
            timer?.invalidate()
            // Schedule timer for auto-scrolling
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(scrollCollectionView), userInfo: nil, repeats: true)
        }
        
        // Auto-scroll collection view
        @objc func scrollCollectionView() {
            // Calculate next index to scroll
            let indexPaths = self.homeCollectionView.indexPathsForVisibleItems
            let nextIndexPath: IndexPath
            if let lastIndexPath = indexPaths.last, lastIndexPath.item + 1 < self.homeCollectionView.numberOfItems(inSection: 5) {
                nextIndexPath = IndexPath(item: lastIndexPath.item + 1, section: 5)
            } else {
                nextIndexPath = IndexPath(item: 0, section: 5)
            }
            // Scroll to next index
            self.pageControll.currentPage = nextIndexPath.item
            self.homeCollectionView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
        }
    
    func startAutoScrollingIn2ndCell() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(scrollSecond), userInfo: nil, repeats: true)
    }
    
    @objc func scrollSecond() {
        // Calculate next index to scroll
        let indexPaths = self.homeCollectionView.indexPathsForVisibleItems
        let nextIndexPath: IndexPath
        if let lastIndexPath = indexPaths.last, lastIndexPath.item + 1 < self.homeCollectionView.numberOfItems(inSection: 1) {
            nextIndexPath = IndexPath(item: lastIndexPath.item + 1, section: 1)
        } else {
            nextIndexPath = IndexPath(item: 0, section: 1)
        }
        // Scroll to next index
        self.homeCollectionView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
    }
    
}
