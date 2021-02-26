//
//  ViewController.swift
//  SearchViewControllerTutorial
//
//  Created by Drink Sirichai on 13/2/2564 BE.
//

import Foundation
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    private lazy var searchController: UISearchController = {
        let searchVC = UISearchController(searchResultsController: nil)
        searchVC.searchResultsUpdater = self
        searchVC.obscuresBackgroundDuringPresentation = false
        searchVC.searchBar.placeholder = "Search data"
        return searchVC
    }()

    private let viewModel: ViewModel = ViewModel()
    private var persons: [Person] = []
    private var filteredPersons: [Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Search view controller tutorial"

        persons = viewModel.getMockPersonModel()
        filteredPersons = persons

        collectionView.register(UINib(nibName: "PersonCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self

        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    private func getFilteredPerson(_ keyword: String) -> [Person] {

        return persons.filter { $0.name.lowercased().contains(keyword) || $0.job.title.lowercased().contains(keyword) }
    }
}

extension ViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return searchController.isActive ? filteredPersons.count : persons.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PersonCollectionViewCell else {
            return .init()
        }

        cell.setup(searchController.isActive ? filteredPersons[indexPath.row] : persons[indexPath.row])

        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return .init(width: view.bounds.width - 32, height: 100)
    }
}

extension ViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {

        if let searchKeyword = searchController.searchBar.text, !searchKeyword.isEmpty {
            filteredPersons = getFilteredPerson(searchKeyword.lowercased())
        } else {
            filteredPersons = persons
        }
        collectionView.reloadData()
    }
}
