//
//  TransactionList.swift
//  Minttt
//
//  Created by Vijay Lama on 3/30/22.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack{
            List {
                // MARK: Transaction Groups
                ForEach(Array(transactionListVM.groupTransactionByMonth()), id: \.key) { month, transactions in
                    Section {
                        // MARK: Transaction List
                        
                        ForEach(transactions) { transaction in
                            TransactionRow(transaction: transaction) 
                        }
                        
                    } header: {
                        //MARK: Transaction Month
                        Text(month)
                    }
                }
            }//: List
            .listStyle(.plain)
        }//: VStack
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct TransactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        Group {
            NavigationView {
                TransactionList()
            }
            NavigationView {
                TransactionList()
            }
            .preferredColorScheme(.dark)
        }
        .environmentObject(transactionListVM)
    }
}
