//
//  MultiColumnList.swift
//  MulitiColumnListTesting
//
//  Created by Chr1s on 2021/8/29.
//

import SwiftUI

struct MultiColumnList: View {
    
    @StateObject var vm = MultiColumnListViewModel()

    @State var indexHeader: Int = 0
    @State var direction: Bool = false

    let offset: CGFloat = 5.0
  
    var body: some View {
        NavigationView {
            VStack(spacing: 0.0) {
                /// 固定的第一行列表，显示第一个Title
                MCListTitleRow(title: vm.titleData[self.indexHeader])
                
                /// 滚动列表
                ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false) {
                    VStack(spacing: 0) {
                        ForEach(1..<7) { i in
                            MCListRow(data: vm.listData[i])
                            Divider()
                        }
                        MCListTitleRow(title: vm.titleData[1])
                        ForEach(7..<15) { i in
                            MCListRow(data: vm.listData[i])
                            Divider()
                        }
                        MCListTitleRow(title: vm.titleData[2])
                        ForEach(15..<vm.listData.count) { i in
                            MCListRow(data: vm.listData[i])
                            Divider()
                        }
                    }
                }
                .gesture(
                   DragGesture().onChanged { value in
                      if value.translation.height > 0 {
                        self.direction = false
                      } else {
                        self.direction = true
                      }
                   }
                )
            }
            .navigationTitle("多列列表")
            .coordinateSpace(name: "VSTACK")
            .onPreferenceChange(ListRowPreferenceKey.self) { preferences in
                
                // 获得第一行标题栏中心点的Y坐标值
                let fixedMidY = preferences[0].rect.midY

                let sequence = (fixedMidY - offset...fixedMidY + offset)
                
                for i in 1..<preferences.count {
         
                    // 判断其他标题栏是否穿过第一行标题栏的位置
                    if sequence.contains(preferences[i].rect.midY) {
                        // 更新第一行标题栏显示
                        if self.direction {
                            // 向上滚动情况
                            DispatchQueue.main.async {
                                self.indexHeader = i
                            }
                            
                        } else {
                            // 向下滚动情况
                            DispatchQueue.main.async {
                                self.indexHeader = i - 1 < 0 ? 0 : i - 1
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            self.indexHeader = 0
        }
    }
}

struct MultiColumnList_Previews: PreviewProvider {
    static var previews: some View {
        MultiColumnList()
    }
}
