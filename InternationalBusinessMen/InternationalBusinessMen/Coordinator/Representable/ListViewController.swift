//
//  ListViewController.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 4/2/23.
//

import SwiftUI

struct ListViewController: UIViewControllerRepresentable {

    let navController =  UINavigationController()

    func makeUIViewController(context: Context) -> UINavigationController {
        let coordinator = MainCoordinator(navigation: navController)
        return coordinator.getMainListFlow()
    }

    func updateUIViewController(_ pageViewController: UINavigationController, context: Context) { }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    class Coordinator: NSObject {
        var parent: ListViewController

        init(_ listViewController: ListViewController) {
            self.parent = listViewController
        }
    }
}
