//
//  MultiColumnListViewModel.swift
//  MulitiColumnListTesting
//
//  Created by Chr1s on 2021/8/30.
//

import SwiftUI

struct MultiColumnListData: Identifiable, Hashable, Codable {
    var id = UUID()
    var column: Int = 1
    var widths: [CGFloat] = []
    var rowData: [String] = []
}

class MultiColumnListViewModel: ObservableObject {
    @Published var listData: [MultiColumnListData] = []
    @Published var titleData: [String] = ["前锋", "中场", "后卫"]
    @Published var listColumn: Int = 1
    
    init() {

        listData.append(MultiColumnListData(rowData: ["7号", "格列兹曼", "30岁"]))
        listData.append(MultiColumnListData(rowData: ["9号", "德佩", "24岁"]))
        listData.append(MultiColumnListData(rowData: ["11号", "登贝莱", "24岁"]))
        listData.append(MultiColumnListData(rowData: ["7号", "格列兹曼", "30岁"]))
        listData.append(MultiColumnListData(rowData: ["9号", "德佩", "24岁"]))
        listData.append(MultiColumnListData(rowData: ["11号", "登贝莱", "24岁"]))
 
  
        listData.append(MultiColumnListData(rowData: ["5号", "布斯克茨", "33岁"]))
        listData.append(MultiColumnListData(rowData: ["21号", "德容", "22岁"]))
        listData.append(MultiColumnListData(rowData: ["20号", "比达尔", "30岁"]))
        listData.append(MultiColumnListData(rowData: ["8号", "皮亚尼奇", "25岁"]))
        listData.append(MultiColumnListData(rowData: ["5号", "布斯克茨", "33岁"]))
        listData.append(MultiColumnListData(rowData: ["21号", "德容", "22岁"]))
        listData.append(MultiColumnListData(rowData: ["20号", "比达尔", "30岁"]))
        listData.append(MultiColumnListData(rowData: ["8号", "皮亚尼奇", "25岁"]))
        
        listData.append(MultiColumnListData(rowData: ["3号", "皮克", "33岁"]))
        listData.append(MultiColumnListData(rowData: ["18号", "阿尔巴", "30岁"]))
        listData.append(MultiColumnListData(rowData: ["24号", "埃里克加西", "30岁"]))
        listData.append(MultiColumnListData(rowData: ["23号", "乌姆蒂蒂", "25岁"]))
        listData.append(MultiColumnListData(rowData: ["3号", "皮克", "33岁"]))
        listData.append(MultiColumnListData(rowData: ["18号", "阿尔巴", "30岁"]))
        listData.append(MultiColumnListData(rowData: ["24号", "埃里克加西", "30岁"]))
        listData.append(MultiColumnListData(rowData: ["23号", "乌姆蒂蒂", "25岁"]))
        listData.append(MultiColumnListData(rowData: ["24号", "埃里克加西", "30岁"]))
        listData.append(MultiColumnListData(rowData: ["23号", "乌姆蒂蒂", "25岁"]))
        listData.append(MultiColumnListData(rowData: ["3号", "皮克", "33岁"]))
        listData.append(MultiColumnListData(rowData: ["18号", "阿尔巴", "30岁"]))
        listData.append(MultiColumnListData(rowData: ["24号", "埃里克加西", "30岁"]))
        listData.append(MultiColumnListData(rowData: ["23号", "乌姆蒂蒂", "25岁"]))
        
    }
}
