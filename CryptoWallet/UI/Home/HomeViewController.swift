//
//  ViewController.swift
//  CryptoWallet
//
//  Created by Elvis on 3/14/21.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private var viewModel: HomeViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewModel()
        setupTableView()
        title = viewModel?.getTitle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel?.fetchData()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerCell(type: CoinTableViewCell.self)
    }
    
    private func setupViewModel() {
        viewModel = HomeDI().createViewModel()
        
        viewModel?.dataLoaded = { [weak self] in
            guard let self = self else {return}
            self.tableView.reloadData()
        }
        
        viewModel?.detailsLoaded = { [weak self] id in
            guard let self = self else {return}
            guard let row = self.viewModel?.getIndex(by: id) else { return }
            let indexPath = IndexPath(row: row, section: 0)
            if let visibleRows = self.tableView.indexPathsForVisibleRows, visibleRows.contains(indexPath) {
                self.tableView.reloadRows(at: [indexPath], with: .fade)
            }
        }
        
        viewModel?.showError = { [weak self] error in
            guard let self = self else {return}
            // not implemented
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.getData().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let models = viewModel?.getData() ?? []
        let cell: CoinTableViewCell = tableView.dequeueCell(withType: CoinTableViewCell.self, for: indexPath)
        cell.setup(model: models[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let models = viewModel?.getData() ?? []
        let model = models[indexPath.row]
        
        if let _ = model.logo { return }
        viewModel?.fetchDetails(for: model.id)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let coinModel = viewModel?.getDetails(by: indexPath.row) else { return }
        let homeRouter = HomeRouter(navigationController: self.navigationController ?? UINavigationController(rootViewController: self))
        homeRouter.navigateToDetails(model: coinModel)
    }
}

