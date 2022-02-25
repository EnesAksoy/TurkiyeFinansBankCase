//
//  ViewController.swift
//  TurkiyeFinansBankCase
//
//  Created by ENES AKSOY on 26.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Constans
    private let collectionViewCellId = "MainPageCollectionViewCell"
    
    // MARK: - Outlets
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var searchTextField: FinansTextField!
    @IBOutlet private weak var moviesButton: FinansButton!
    @IBOutlet private weak var musicButton: FinansButton!
    @IBOutlet private weak var appsButton: FinansButton!
    @IBOutlet private weak var booksButton: FinansButton!
    
    // MARK: - Properties
    private var viewModel: MainPageViewModel!
    private var searchModel: [SearchModel] = []
    private var buttons: [FinansButton] = []
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = MainPageViewModel()
        self.viewModel.delegate = self
        
        self.searchTextField.delegate = self
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib.init(nibName: self.collectionViewCellId, bundle: nil), forCellWithReuseIdentifier: self.collectionViewCellId)
        
        self.searchTextField.autocorrectionType = .no
        
        self.buttons.append(self.moviesButton)
        self.buttons.append(self.musicButton)
        self.buttons.append(self.appsButton)
        self.buttons.append(self.booksButton)
    }
    
    // MARK: - Actions
    @IBAction func moviesButtonClick(_ sender: Any) {
        self.buttonsChangeBackgroundColor(selectButton: self.moviesButton)
        self.viewModel.filterSearchModel(wrapperType: .movies)
    }
    
    @IBAction func musicButtonClick(_ sender: Any) {
        self.buttonsChangeBackgroundColor(selectButton: self.musicButton)
        self.viewModel.filterSearchModel(wrapperType: .music)
    }
    
    @IBAction func appsButtonClick(_ sender: Any) {
        self.buttonsChangeBackgroundColor(selectButton: self.appsButton)
        self.viewModel.filterSearchModel(wrapperType: .apps)
    }
    
    @IBAction func booksButtonClick(_ sender: Any) {
        self.buttonsChangeBackgroundColor(selectButton: self.booksButton)
        self.viewModel.filterSearchModel(wrapperType: .books)
    }
    
    @IBAction func deleteButtonClick(_ sender: Any) {
        self.searchTextField.text = ""
        self.buttonsChangeBackgroundColor(selectButton: nil)
        self.searchModel = []
        self.collectionView.reloadData()
    }
    
    private func buttonsChangeBackgroundColor(selectButton: FinansButton?) {
        if selectButton != nil {
            for button in self.buttons {
                button == selectButton ? (button.backgroundColor = .white) : (button.backgroundColor = .clear)
            }
        } else {
            for button in self.buttons {
                button.backgroundColor = .clear
            }
        }
    }
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = "\(textField.text ?? "")\(string)"
        if text.count >= 2 {
            self.buttonsChangeBackgroundColor(selectButton: nil)
            self.viewModel.serviceCallMethod(search: text)
        } else {
            self.searchModel = []
            self.collectionView.reloadData()
        }
        return true
    }
}

// MARK: - MainPageViewModelDelegate
extension ViewController: MainPageViewModelDelegate {
    func updateView(_ searchModel: [SearchModel], errorText: String) {
        self.searchModel.removeAll()
        self.searchModel = searchModel
        for search in self.searchModel {
            print("wrapperType = \(search.wrapperType)")
        }
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.searchModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.collectionViewCellId, for: indexPath) as! MainPageCollectionViewCell
        if self.searchModel.count > 0 {
            cell.mainPageCollectionViewCellMethod(imageViewUrl: self.searchModel[indexPath.row].artworkUrl100 ?? "",
                                                  name: self.searchModel[indexPath.row].collectionName ?? "",
                                                  date: self.searchModel[indexPath.row].releaseDate ?? "",
                                                  price: self.searchModel[indexPath.row].collectionPrice ?? 0)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.searchModel.count > 0 {
            ObjectStore.shared.selectItem = self.searchModel[indexPath.row]
            let detailViewController = DetailViewController()
            detailViewController.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.collectionView.frame.size.width/2) - 5, height: (self.collectionView.frame.size.width/2) - 5)
    }
}

