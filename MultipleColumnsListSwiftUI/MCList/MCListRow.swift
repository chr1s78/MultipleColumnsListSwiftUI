//
//  MCListRow.swift
//  MulitiColumnListTesting
//
//  Created by Chr1s on 2021/8/29.
//

import SwiftUI

struct ListRowPreferenceKey: PreferenceKey {
    typealias Value = [ListRowPreferenceData]

    static var defaultValue: [ListRowPreferenceData] = []
    
    static func reduce(value: inout [ListRowPreferenceData], nextValue: () -> [ListRowPreferenceData]) {
        value.append(contentsOf: nextValue())
    }
}


struct ListRowPreferenceData: Equatable {
    let rect: CGRect
}

// MARK: 列表标题行
struct MCListTitleRow: View {
    var title: String
    var body: some View {
        GeometryReader { geo in
      
                Text(title).font(.title).bold()
                    .frame(width: UIScreen.main.bounds.width, height: 60)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .SetPreference(geo: geo, save: true)
    
        }
        .frame(width: UIScreen.main.bounds.width, height: 60)
    }
}

// MARK: 列表内容行
struct MCListRow: View {
    
    var data: MultiColumnListData = MultiColumnListData()
    
    init(data: MultiColumnListData) {
        self.data = data
        self.data.column = self.data.rowData.count == 0 ? 1 : self.data.rowData.count

        if self.data.widths.count == 0 {
            let widthAverage = UIScreen.main.bounds.width / CGFloat(self.data.column)
            for _ in 0..<self.data.column {
                self.data.widths.append(widthAverage)
            }
        }
    }
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<data.column) { i in
      
                    Text(data.rowData[i])
                        .frame(width: data.widths[i], height: 50)
                        .background(((i % 2) == 0) ? Color.white : Color.gray.opacity(0.3))
  
            }
        }
        .frame(height: 50)
    }
}

/// 获得子视图 列表标题栏的大小
/// 将perference定义为modifier模式
struct setPreference: ViewModifier {
    var geo: GeometryProxy
    var save: Bool
    func body(content: Content) -> some View {
        if save {
             content
                .preference(key: ListRowPreferenceKey.self,
                            value:
                                [ ListRowPreferenceData(rect: geo.frame(in: .named("VSTACK"))) ])
        } else {
             content
        }
    }
}

extension View {
    func SetPreference(geo: GeometryProxy, save: Bool) -> some View {
        self.modifier(setPreference(geo: geo, save: save))
    }
}

struct MCListRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MCListRow(data: MultiColumnListData(rowData: ["1","Lex","24"]))
                .previewLayout(.sizeThatFits)
            MCListTitleRow(title: "前锋")
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
}
    }
}
