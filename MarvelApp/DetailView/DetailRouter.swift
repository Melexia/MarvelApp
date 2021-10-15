//
//
// DetailRouter.swift
// MarvelApp
//
// Using Swift 5.0
//
// Created by Andrea Sánchez Román on 06/10/21.
// Copyright (c) 2021 and Confidential to Melexia All rights reserved.
//


import UIKit

class DetailRouter : DetailRouterProtocol{
         
    var viewController : UIViewController {
        return createViewController()
    }
    
    private func createViewController() -> UIViewController {
        let bundle = Bundle(for: HomeView.self)
        let view = DetailView(nibName: "DetailView", bundle: bundle)
        
        let viewModel: DetailPresenterProtocol = DetailViewModel()
        let router: DetailRouterProtocol = DetailRouter()
        
        view.viewModel = viewModel
        viewModel.view = view
        viewModel.router = router
        
        return view
    }
  
    func openLink(link: URL) {
        UIApplication.shared.open(link)
    }
    
    func back(view: DetailViewProtocol) {
        if let newView = view as? UIViewController {
            newView.dismiss(animated: true, completion: nil)
        }
    }
}
