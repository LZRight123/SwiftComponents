//
//  DiskCache.swift
//  JadeSocial
//
//  Created by liangze on 2020/4/4.
//  Copyright © 2020 Rick. All rights reserved.
//

import KakaJSON

protocol DiskCache {
    var disk_file_name: String { get }
}

extension Convertible where Self: DiskCache {
    
    func cacheOnDisk(folder: String = "JDModelCacheFiles", for directory: FileManager.SearchPathDirectory = .cachesDirectory) {
        let file = fileURL(forFolder: folder, for: directory)
        write(self, to: file)
    }
    
    func getForDisk(folder: String = "JDModelCacheFiles", for directory: FileManager.SearchPathDirectory = .cachesDirectory) -> Self? {
        let file = fileURL(forFolder: folder, for: directory)
        return read(Self.self, from: file)
    }
    
    private func fileURL(forFolder folder: String, for directory: FileManager.SearchPathDirectory) -> URL {
        let type = String(describing: Self.self)
        let file = "\(type)-\(disk_file_name)"
        let folderURL = FileManager.default.createFolder(folderName: folder, for: directory)
        let fileURL = folderURL.appendingPathComponent(file)
        return fileURL
    }
}



