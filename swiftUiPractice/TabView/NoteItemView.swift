//
//  NoteItemView.swift
//  swiftUiPractice
//
//  Created by dremobaba on 2023/1/1.
//

import SwiftUI

class Item: Hashable, Identifiable {
    let title: String
    let subTitle: String
    let icon: String
    let time: String
    let id:String = UUID().uuidString
    
    init(title: String, subTitle: String, icon: String, time: String) {
        self.title = title
        self.subTitle = subTitle
        self.icon = icon
        self.time = time
    }
    
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.id == rhs.id
    }
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
}
extension Item {
    static func allItems() -> [Item] {
        return [
            Item(title: "⚡️Quote by Lao Tzu", subTitle: "The journey of a thousand miles begins with one step", icon: "bolt.car.fill", time: "14 m"),
            Item(title: "Why Self-Discipline is so Hard 🧠", subTitle: "Self-discipline is both an environment and an individual problem", icon: "clock.fill", time: "17 h"),
            Item(title: "💯 1% better every day!", subTitle: "5 minutes is all it takes", icon: "personalhotspot", time: "23 h"),
            Item(title: "📣Quote by Tony Robbins", subTitle: "It's not about your resources, it's about your resourcefulness", icon: "wave.3.forward.circle.fill", time: "1 d"),
            Item(title: "How to Read More Books Next Year", subTitle: "As a new year approaches, think about what habits you'd like to build", icon: "book.fill", time: "1 d"),
            Item(title: "📣Quote by Sirius Black", subTitle: "If you want to know what a man's like, take a good look at how he treats his inferiors, not his equals", icon: "bolt.heart", time: "1 d"),
            Item(title: "⚡️Quote by Lao Tzu", subTitle: "The journey of a thousand miles begins with one step", icon: "bolt.car.fill", time: "14 m"),
            Item(title: "Why Self-Discipline is so Hard 🧠", subTitle: "Self-discipline is both an environment and an individual problem", icon: "clock.fill", time: "17 h"),
            Item(title: "💯 1% better every day!", subTitle: "5 minutes is all it takes", icon: "personalhotspot", time: "23 h"),
            Item(title: "📣Quote by Tony Robbins", subTitle: "It's not about your resources, it's about your resourcefulness", icon: "wave.3.forward.circle.fill", time: "1 d"),
            Item(title: "How to Read More Books Next Year", subTitle: "As a new year approaches, think about what habits you'd like to build", icon: "book.fill", time: "1 d"),
            Item(title: "📣Quote by Sirius Black", subTitle: "If you want to know what a man's like, take a good look at how he treats his inferiors, not his equals", icon: "bolt.heart", time: "1 d"),
            Item(title: "⚡️Quote by Lao Tzu", subTitle: "The journey of a thousand miles begins with one step", icon: "bolt.car.fill", time: "14 m"),
            Item(title: "Why Self-Discipline is so Hard 🧠", subTitle: "Self-discipline is both an environment and an individual problem", icon: "clock.fill", time: "17 h"),
            Item(title: "💯 1% better every day!", subTitle: "5 minutes is all it takes", icon: "personalhotspot", time: "23 h"),
            Item(title: "📣Quote by Tony Robbins", subTitle: "It's not about your resources, it's about your resourcefulness", icon: "wave.3.forward.circle.fill", time: "1 d"),
            Item(title: "How to Read More Books Next Year", subTitle: "As a new year approaches, think about what habits you'd like to build", icon: "book.fill", time: "1 d"),
            Item(title: "📣Quote by Sirius Black", subTitle: "If you want to know what a man's like, take a good look at how he treats his inferiors, not his equals", icon: "bolt.heart", time: "1 d"),
            Item(title: "⚡️Quote by Lao Tzu", subTitle: "The journey of a thousand miles begins with one step", icon: "bolt.car.fill", time: "14 m"),
            Item(title: "Why Self-Discipline is so Hard 🧠", subTitle: "Self-discipline is both an environment and an individual problem", icon: "clock.fill", time: "17 h"),
            Item(title: "💯 1% better every day!", subTitle: "5 minutes is all it takes", icon: "personalhotspot", time: "23 h"),
            Item(title: "📣Quote by Tony Robbins", subTitle: "It's not about your resources, it's about your resourcefulness", icon: "wave.3.forward.circle.fill", time: "1 d"),
            Item(title: "How to Read More Books Next Year", subTitle: "As a new year approaches, think about what habits you'd like to build", icon: "book.fill", time: "1 d"),
            Item(title: "📣Quote by Sirius Black", subTitle: "If you want to know what a man's like, take a good look at how he treats his inferiors, not his equals", icon: "bolt.heart", time: "1 d"),
        ]
    }
}

struct NoteItemView: View {
    let item: Item
    var body: some View {
        VStack(spacing: 3) {
            HStack {
                Circle()
                    .fill(.yellow.opacity(0.6))
                    .frame(width: 30, height: 30)
                    .overlay {
                        Image(systemName: item.icon)
                            .renderingMode(.template)
                            .foregroundColor(.white)
                    }
                    .padding(5)
                Text(item.title)
                    .foregroundColor(.white)
                    .font(.headline)
                    .bold()
                Spacer()
                VStack(spacing: 10) {
                    Text(item.time)
                        .foregroundColor(.white.opacity(0.6))
                        .font(.footnote)
                    Image(systemName: "ellipsis")
                        .renderingMode(.template)
                        .foregroundColor(.white.opacity(0.6))
                }
            }
            .padding([.horizontal, .top], 5)
            HStack {
                Spacer(minLength: 53)
                Text(item.subTitle)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                    .font(.footnote.weight(.light))
                    .padding([.trailing, .bottom], 10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer(minLength: 45)
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.black.opacity(0.8))
    }
}

struct NoteItemView_Previews: PreviewProvider {
    static var previews: some View {
        NoteItemView(item: Item.allItems().first!)
    }
}
