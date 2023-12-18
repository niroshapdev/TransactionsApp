//
//  IntentHandler.swift
//  TransactionsAppIntent
//
//  Created by HUMANA on 18/12/23.
//

import Intents

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return MoneyTransfer()
    }
    
}

class MoneyTransfer : NSObject, MoneyTransferIntentHandling {
    func handle(intent: MoneyTransferIntent, completion: @escaping (MoneyTransferIntentResponse) -> Void) {
        guard let toAccount = intent.ToAccount, let fromAccount = intent.FromAccount, let amount = intent.Amount   else {
         completion(MoneyTransferIntentResponse(code: .failure, userActivity: nil))
         return
        }
        
            completion(MoneyTransferIntentResponse.success(fromAccount: fromAccount, toAccount: toAccount))
        
    }
    
  
    
    func resolveFromAccount(for intent: MoneyTransferIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        if let fromAccount = intent.FromAccount {
            completion(INStringResolutionResult.success(with: fromAccount))
        } else {
            completion(INStringResolutionResult.needsValue())
        }
    }
    
    func resolveToAccount(for intent: MoneyTransferIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        if let toAccount = intent.ToAccount {
            completion(INStringResolutionResult.success(with: toAccount))
        } else {
            completion(INStringResolutionResult.needsValue())
        }
    }
    
    
    func resolveAmount(for intent: MoneyTransferIntent, with completion: @escaping (MoneyTransferAmountResolutionResult) -> Void) {
        if let amount = intent.Amount as? Double {
            completion(MoneyTransferAmountResolutionResult.success(with: amount))
        } else {
            completion(MoneyTransferAmountResolutionResult.needsValue())
        }
    }

}
