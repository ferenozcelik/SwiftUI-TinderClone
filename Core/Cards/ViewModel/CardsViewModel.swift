//
//  CardsViewModel.swift
//  TinderClone
//
//  Created by Fatih Eren Ozcelik on 16.03.2024.
//

import Foundation

@MainActor
class CardsViewModel: ObservableObject {
    
    @Published var cards = [Card]()
    
    private let service: CardService
    
    init(service: CardService) {
        self.service = service
        Task {
            await fetchCards()
        }
    }
    
    func fetchCards() async {
        do {
            self.cards = try await service.fetchCards()
        } catch {
            print("failed to fetch cards: \(error)")
        }
    }
    
    func removeCard(_ card: Card) {
        guard let index = cards.firstIndex(where: { $0.id == card.id }) else { return }
        cards.remove(at: index)
    }
}
