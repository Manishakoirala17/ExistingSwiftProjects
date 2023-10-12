//
//  ReminderWidget.swift
//  ReminderWidget
//
//  Created by Manisha on 12/10/23.
//

import WidgetKit
import SwiftUI
import SwiftData

struct Provider: AppIntentTimelineProvider {
    @MainActor func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), lists: fetchList(),configuration: ConfigurationAppIntent())
    }

    @MainActor func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        SimpleEntry(date: Date(),lists: fetchList() ,configuration: configuration)
    }
    
    @MainActor func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        let tl = Timeline(entries: [SimpleEntry(date: .now, lists: fetchList(), configuration: configuration)], policy: .atEnd)

        return tl
    }
    
    @MainActor
    func fetchList() -> [MyListViewModel]{
        guard let modelContainer = try? ModelContainer(for: MyListViewModel.self) else{
            return []
        }
        let descriptor = FetchDescriptor<MyListViewModel>()
        let lists = try? modelContainer.mainContext.fetch(descriptor)
        return lists ?? []
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let lists:[MyListViewModel]
    let configuration: ConfigurationAppIntent
}

struct ReminderWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            ForEach(entry.lists){ list in
                Text("\(list.name)")
            }
        }
    }
}

struct ReminderWidget: Widget {
    let kind: String = "ReminderWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            ReminderWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
    }
}

extension ConfigurationAppIntent {
    fileprivate static var smiley: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "😀"
        return intent
    }
    
    fileprivate static var starEyes: ConfigurationAppIntent {
        let intent = ConfigurationAppIntent()
        intent.favoriteEmoji = "🤩"
        return intent
    }
}

//#Preview(as: .systemSmall) {
//    ReminderWidget()
//} timeline: {
//    SimpleEntry(date: .now, configuration: .smiley)
//    SimpleEntry(date: .now, configuration: .starEyes)
//}
