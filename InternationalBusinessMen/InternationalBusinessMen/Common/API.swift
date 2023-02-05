//
//  API.swift
//  InternationalBusinessMen
//
//  Created by Fatima Sahar on 3/2/23.
//

import Foundation

protocol API {
    func getConversionRates() async throws -> ConversionList
    func getTransactions() async throws -> TransactionList
}

class IBMAPI: RestManagerAsync, API {
    func getConversionRates() async throws -> ConversionList {
        // TODO: gestionar error?
        try await sendRequest(url: IBMURLString.conversionRate.url, responseModel: ConversionList.self).get()
    }
    
    func getTransactions() async throws -> TransactionList {
        try await sendRequest(url: IBMURLString.transaction.url, responseModel: TransactionList.self).get()
    }
}
