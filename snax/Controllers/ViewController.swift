//
//  ViewController.swift
//  snax
//
//  Created by Jessica Yuan on 4/20/19.
//  Copyright © 2019 Jessica Yuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var filterCollection: UICollectionView!
    var restaurantCollection: UICollectionView!
    var filterArray: [Filter]! = []
    var restaurantArray: [Restaurant]! = []
    var filteredArray: [Restaurant]! = []
    var layoutWidth: CGFloat!
    
    var filteredStrings:[String] = []
    var searchActive : Bool = false
    let searchController = UISearchController(searchResultsController: nil)
    var filterFiltered: [Restaurant]! = []
    
    let filterCellReuseIdentifier = "filterCellReuseIdentifier"
    let restaurantCellReuseIdentifier = "restaurantCellReuseIdentifier"
    let padding: CGFloat = 8
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Restaurants"
        
        self.searchController.searchResultsUpdater = self
        self.searchController.delegate = self
        self.searchController.searchBar.delegate = self
        self.searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.dimsBackgroundDuringPresentation = true
        self.searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search names, filters"
        searchController.searchBar.sizeToFit()
        searchController.searchBar.becomeFirstResponder()
        
        self.navigationItem.titleView = searchController.searchBar
        present(searchController, animated: true, completion: nil)
        self.dismiss(animated: true, completion: nil)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterScreen))
        
        let TavernaBanfiMenu = [MenuItem(name: "Statler Chicken", price: 25, description: "Potato Puree, Mushrooms, Cipollini Onions, Sun-dried tomato butter sauce" ,category: .dinner), MenuItem(name: "Salmon", price: 29, description: "Broccolini, Herbed Quinoa, Arugula, Smoked Tomato Hummus", category: .dinner), MenuItem(name: "Zucchini Noodles", price: 21, description: "Quinoa Crocchettes, Tomatoes, Broccolini, Dried Olive Miso, Broccoli Pesto, Pomodoro", category: .dinner), MenuItem(name: "Smoked Short Rib", price: 32, description: "Braised Italian Greens, Prosciutto, Sweet Potato Hash, Pickled Red Onion, Red Wine Jus", category: .dinner)]
        
        let MattinsMenu = [MenuItem(name: "Turkey Club", price: 6.69, description: "Turkey breast, bacon, provolone, leaf lettuce, tomato, mayonnaise on a telera roll.", category: nil), MenuItem(name: "Chicken Bacon Ranch", price: 6.69, description: "Tomato, red onion, grilled chicken, bacon with ranch on a kariser roll.", category: nil ), MenuItem(name: "Chicken Club", price: 6.69, description: "Chicken breast, bacon, swiss cheese, leaf lettuce, tomato, mayonnaise on a sourdough bread", category: nil), MenuItem(name: "Tuna Melt", price: 6.49, description: "Swiss cheese melted on a tuna salad topped with leaf lettuce, tomato, on a multi grain bread.", category: nil), MenuItem(name: "Taco Bowl", price: 7.99, description: "lime brown rice, black beans, lettuce, salsa, guacamole, sour cream, chipotle lime chicken, tortilla chips, tomato, onion, jalepenos", category: nil)]
        
        let NastiesMenu = [MenuItem(name: "Buffalo Chicken Sub", price: 8.49, description: "Grilled or fried chicken,spicy buffalo sauce, blue cheese dressing, shredded lettuce", category: nil), MenuItem(name: "Chicken Parm", price: 8.49, description: "Grilled or fried chicken smothered in a marianara sauce, topped with melted mozzarella cheese", category: nil), MenuItem(name: "Southwest Chicken Sub", price: 8.49, description: "Grilled or fried chicken, pepperjack cheese, bacon, tomatoes, chipotle ranch dressing, shredded lettuce", category: nil), MenuItem(name: "Meatball Sub", price: 8.49, description: "Meatballs in marinara sauce, topped with melted mozzarella cheese" , category: nil)]
        
        restaurantArray.append(Restaurant(image: UIImage(named: "TavernaBanfi")!, name: "Taverna Banfi", tags: ["Breakfast", "Lunch", "Dinner", "Italian"], price: 40, times: [
            [7, 0, 14, 0, 17, 30, 21, 0], [7, 0, 21, 0], [7, 0, 21, 0],
            [7, 0, 21, 0], [7, 0, 21, 0], [7, 0, 21, 0], [7, 0, 21, 0]
            ], menu: TavernaBanfiMenu))
            
        restaurantArray.append(Restaurant(image: UIImage(named: "mattins")!, name: "Mattin's Cafe", tags: ["Breakfast", "Lunch", "American", "Sandwiches"], price: 6, times: [
            [0, 0, 0, 0], [7, 0, 22, 0], [7, 0, 20, 0], [7, 0, 20, 0],
            [7, 0, 20, 0], [7, 0, 17, 0], [0, 0, 0, 0]
            ], menu: MattinsMenu))
        
        restaurantArray.append(Restaurant(image: UIImage(named: "nasties")!, name: "Bear Necessities", tags: ["Breakfast", "Lunch", "Dinner", "American", "Sandwiches"], price: 10, times: [
            [10, 0, 24, 0, 0, 0, 2, 0], [8, 0, 24, 0, 0, 0, 2, 0],
            [8, 0, 24, 0, 0, 0, 2, 0], [8, 0, 24, 0, 0, 0, 2, 0],
            [8, 0, 24, 0, 0, 0, 2, 0], [8, 0, 24, 0, 0, 0, 2, 0],
            [10, 0, 24, 0, 0, 0, 2, 0]
            ], menu: NastiesMenu))
        
        restaurantArray.append(Restaurant(image: UIImage(named: "jennie")!, name: "Cafe Jennie", tags: ["Breakfast", "Lunch", "Sandwiches"], price: 15, times: [
            [0, 0, 0, 0], [8, 0, 18, 0], [8, 0, 18, 0], [8, 0, 18, 0],
            [8, 0, 18, 0], [8, 0, 18, 0], [10, 0, 17, 0]
            ]))
        restaurantArray.append(Restaurant(image: UIImage(named: "ctb")!, name: "Collegetown Bagels", tags: ["Breakfast", "Lunch", "Dinner", "Sandwiches", "Desserts"], price: 15, times: [
            [6, 45, 24, 0, 0, 0, 1, 30], [6, 45, 24, 0, 0, 0, 1, 30],
            [6, 45, 24, 0, 0, 0, 1, 30], [6, 45, 24, 0, 0, 0, 1, 30],
            [6, 45, 24, 0, 0, 0, 1, 30], [6, 45, 24, 0, 0, 0, 1, 30],
            [6, 45, 24, 0, 0, 0, 1, 30]
            ]))
        restaurantArray.append(Restaurant(image: UIImage(named: "plumtree")!, name: "Plum Tree", tags: ["Lunch", "Dinner", "Japanese"], price: 30, times: [
            [12, 0, 15, 0, 17, 0, 22, 0], [11, 30, 14, 30, 17, 0, 22, 0],
            [11, 30, 14, 30, 17, 0, 22, 0], [17, 0, 22, 0],
            [11, 30, 14, 30, 17, 0, 22, 30], [11, 30, 14, 30, 17, 0, 23, 00],
            [12, 0, 15, 0, 17, 0, 23, 0]
            ]))
        restaurantArray.append(Restaurant(image: UIImage(named: "dairy")!, name: "Cornell Dairy Bar", tags: ["Breakfast", "Lunch", "Sandwiches", "Desserts"], price: 15, times: [
            [0, 0, 0, 0], [8, 30, 18, 0], [8, 30, 18, 0], [8, 30, 18, 0],
            [8, 30, 18, 0], [8, 30, 18, 0], [0, 0, 0, 0]
            ]))
        restaurantArray.append(Restaurant(image: UIImage(named: "alehouse")!, name: "Ithaca Ale House", tags: ["Lunch", "Dinner", "American"], price: 15, times: [
            [9, 0, 24, 0, 0, 0, 1, 0], [11, 0, 24, 0, 0, 0, 1, 0],
            [11, 0, 24, 0, 0, 0, 1, 0], [11, 0, 24, 0, 0, 0, 1, 0],
            [11, 0, 24, 0, 0, 0, 1, 0], [11, 0, 24, 0, 0, 0, 1, 0],
            [11, 0, 24, 0]
            ]))
        restaurantArray.append(Restaurant(image: UIImage(named: "fourseasons")!, name: "Four Seasons", tags: ["Lunch", "Dinner", "Korean"], price: 15, times: [
            [11, 0, 22, 0], [11, 0, 22, 0], [11, 0, 22, 0], [11, 0, 22, 0],
            [11, 0, 22, 0], [11, 0, 22, 0], [11, 0, 22, 0]
            ]))
        restaurantArray.append(Restaurant(image: UIImage(named: "saigon")!, name: "Saigon Kitchen", tags: ["Lunch", "Dinner", "Vietnamese"], price: 15, times: [
            [11, 30, 21, 30], [0, 0, 0, 0], [11, 30, 21, 30], [11, 30, 21, 30],
            [11, 30, 21, 30], [11, 30, 22, 0], [11, 30, 22, 0]
            ]))
        
        filteredArray = restaurantArray
        
        filterArray.append(Filter(title: "Open Now"))
        filterArray.append(Filter(title: "Breakfast"))
        filterArray.append(Filter(title: "Lunch"))
        filterArray.append(Filter(title: "Dinner"))
        filterArray.append(Filter(title: "American"))
        filterArray.append(Filter(title: "Japanese"))
        filterArray.append(Filter(title: "Italian"))
        filterArray.append(Filter(title: "Korean"))
        filterArray.append(Filter(title: "Vietnamese"))
        filterArray.append(Filter(title: "Sandwiches"))
        filterArray.append(Filter(title: "Desserts"))
        
        let filterLayout = UICollectionViewFlowLayout()
        filterLayout.scrollDirection = .horizontal
        filterLayout.minimumInteritemSpacing = padding
        filterLayout.minimumLineSpacing = padding
        
        filterCollection = UICollectionView(frame: .zero, collectionViewLayout: filterLayout)
        filterCollection.translatesAutoresizingMaskIntoConstraints = false
        filterCollection.backgroundColor = .white
        filterCollection.dataSource = self
        filterCollection.delegate = self
        filterCollection.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: filterCellReuseIdentifier)
        filterCollection.showsHorizontalScrollIndicator = false
        self.view.addSubview(filterCollection)
        
        let restaurantLayout = UICollectionViewFlowLayout()
        restaurantLayout.scrollDirection = .vertical
        restaurantLayout.minimumInteritemSpacing = padding
        restaurantLayout.minimumLineSpacing = padding
        
        restaurantCollection = UICollectionView(frame: .zero, collectionViewLayout: restaurantLayout)
        restaurantCollection.translatesAutoresizingMaskIntoConstraints = false
        restaurantCollection.backgroundColor = .white
        restaurantCollection.dataSource = self
        restaurantCollection.delegate = self
        restaurantCollection.register(RestaurantCollectionViewCell.self, forCellWithReuseIdentifier: restaurantCellReuseIdentifier)
        restaurantCollection.showsVerticalScrollIndicator = false
        self.view.addSubview(restaurantCollection)
        
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            filterCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            filterCollection.heightAnchor.constraint(equalToConstant: 50),
            filterCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            filterCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1*padding)
            ])
        NSLayoutConstraint.activate([
            restaurantCollection.topAnchor.constraint(equalTo: filterCollection.bottomAnchor),
            restaurantCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -1*padding),
            restaurantCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            restaurantCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -1*padding)
            ])
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (searchActive){
            return filterFiltered.count
        }
        var count = filterArray.count
        if(collectionView == self.restaurantCollection){
            count = filteredArray.count
        }
        return count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == self.filterCollection){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: filterCellReuseIdentifier, for: indexPath) as! FilterCollectionViewCell
            let filter = filterArray[indexPath.item]
            cell.configure(for: filter)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: restaurantCellReuseIdentifier, for: indexPath) as! RestaurantCollectionViewCell
            let restaurant: Restaurant!
            if (searchActive) {
                restaurant = filterFiltered[indexPath.item]
            } else {
                restaurant = filteredArray[indexPath.item]
            }
            cell.configure(for: restaurant)
            return cell
        }
    }
    
    
    @objc func indexChanged(){
        
    }
    
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (collectionView == self.filterCollection){
            let cell = filterCollection.cellForItem(at: indexPath) as! FilterCollectionViewCell
            cell.toggleColor()
            let filter = filterArray[indexPath.item]
            filter.isSelected.toggle()
            cell.configure(for: filter)
            
            filteredArray = []
            var selectedFilters: [String] = []
            for f in filterArray {
                if (f.isSelected){
                    selectedFilters.append(f.title)
                }
            }
            
            for r in restaurantArray {
                let commonElements = Array(Set(selectedFilters).intersection(Set(r.tags)))
                if (selectedFilters.count == 0){
                    filteredArray = restaurantArray
                } else if (selectedFilters.contains("Open Now")) {
                    if (selectedFilters.count==1){
                        if (r.isOpen){
                            filteredArray.append(r)
                        }
                    } else {
                        if (r.isOpen && commonElements.count>0){
                            if ((selectedFilters.contains("Breakfast")||selectedFilters.contains("Lunch")||selectedFilters.contains("Dinner"))&&(selectedFilters.contains("American")||selectedFilters.contains("Japanese")||selectedFilters.contains("Italian")||selectedFilters.contains("Korean")||selectedFilters.contains("Vietnamese")||selectedFilters.contains("Sandwiches")||selectedFilters.contains("Desserts"))){
                                if ((commonElements.contains("Breakfast")||commonElements.contains("Lunch")||commonElements.contains("Dinner"))&&(commonElements.contains("American")||commonElements.contains("Japanese")||commonElements.contains("Italian")||commonElements.contains("Korean")||commonElements.contains("Vietnamese")||commonElements.contains("Sandwiches")||commonElements.contains("Desserts"))){
                                    filteredArray.append(r)
                                }
                            } else {
                                filteredArray.append(r)
                            }
                        }
                    }
                } else {
                    if (commonElements.count>0){
                        if ((selectedFilters.contains("Breakfast")||selectedFilters.contains("Lunch")||selectedFilters.contains("Dinner"))&&(selectedFilters.contains("American")||selectedFilters.contains("Japanese")||selectedFilters.contains("Italian")||selectedFilters.contains("Korean")||selectedFilters.contains("Vietnamese")||selectedFilters.contains("Sandwiches")||selectedFilters.contains("Desserts"))){
                            if ((commonElements.contains("Breakfast")||commonElements.contains("Lunch")||commonElements.contains("Dinner"))&&(commonElements.contains("American")||commonElements.contains("Japanese")||commonElements.contains("Italian")||commonElements.contains("Korean")||commonElements.contains("Vietnamese")||commonElements.contains("Sandwiches")||commonElements.contains("Desserts"))){
                                filteredArray.append(r)
                            }
                        } else {
                            filteredArray.append(r)
                        }
                    }
                }
            }
            restaurantCollection.reloadData()
        } else {
            let restaurant = filteredArray[indexPath.item]
            let detailViewController = DetailViewController(image: restaurant.image!, name: restaurant.name, tags: restaurant.tags, priceImage: restaurant.priceImage!, times: restaurant.times, isOpen: restaurant.isOpen, menu: restaurant.menu)
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    }
    
    @objc func filterScreen(){
        
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (collectionView == self.filterCollection){
            let height: CGFloat = collectionView.frame.height
            return CGSize(width: height*(11/8), height: height)
        } else {
            layoutWidth = ((restaurantCollection.frame.width - (padding))/2)
            return CGSize(width: layoutWidth, height: ((restaurantCollection.frame.width - (padding))/2)*(3/4))
        }
    }
}

extension ViewController: UISearchControllerDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
        self.dismiss(animated: true, completion: nil)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterScreen))
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchString = searchController.searchBar.text
        var stringArray: [String] = []
        for r in filteredArray {
            stringArray.append(r.name)
        }
        for t in filterArray {
            stringArray.append(t.title)
        }
        filteredStrings = stringArray.filter({ (item) -> Bool in
            let countryText: NSString = item as NSString
            
            return (countryText.range(of: searchString!, options: NSString.CompareOptions.caseInsensitive).location) != NSNotFound
        })
        if let search = searchString, search.count>0 {
            var filteredItemsStrings: [String] = []
            for r in filteredArray {
                filteredItemsStrings.append(r.name)
            }
            for t in filterArray {
                filteredItemsStrings.append(t.title)
                print(filteredItemsStrings)
            }
            let commonElements = Array(Set(filteredItemsStrings).intersection(Set(filteredStrings)))
            
            var tempFilteredArray: [Restaurant] = []
            
            if(filteredArray.count>0) {
                for f in filteredArray {
                    if (commonElements.contains(f.name) || Array(Set(commonElements).intersection(Set(f.tags))).count>0){
                        tempFilteredArray.append(f)
                    }
                }
                filterFiltered=tempFilteredArray
            }
        }
        restaurantCollection.reloadData()
        
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
        restaurantCollection.reloadData()
        navigationItem.rightBarButtonItem = nil
        navigationItem.leftBarButtonItem = nil
    }
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
        restaurantCollection.reloadData()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Filter", style: .plain, target: self, action: #selector(filterScreen))
    }
    
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        if !searchActive {
            searchActive = true
            restaurantCollection.reloadData()
            navigationItem.rightBarButtonItem = nil
            navigationItem.leftBarButtonItem = nil
        }
        
        searchController.searchBar.resignFirstResponder()
    }
}

