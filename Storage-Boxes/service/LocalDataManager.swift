//
//  LocalDataManager.swift
//  Storage-Boxes
//

import Foundation

public class LocalDataManager {
    static fileprivate func getLocalDir () -> URL {
        if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            return url
        }

        fatalError("Unable to access Local Document Directory")
    }
    
    static func save<T: Encodable> (_ object: T, with filename: String) {
        let url = getLocalDir().appendingPathComponent(filename, isDirectory: false)
        let encoder = JSONEncoder()
        
        do {
            let data = try encoder.encode(object)
            if FileManager.default.fileExists(atPath: url.path) {
                try FileManager.default.removeItem(at: url)
            }
            FileManager.default.createFile(atPath: url.path, contents: data, attributes: nil)
            
        } catch {
            fatalError("Unable save data")
        }
    }

    static func loadDataFromFile (_ filename: String) -> Data {
        let url = getLocalDir().appendingPathComponent(filename, isDirectory: false)
        
        if !FileManager.default.fileExists(atPath: url.path) {
            fatalError("No data @ \(url.path)")
        }
        
        if let data = FileManager.default.contents(atPath: url.path) {
            return data
        }
        
        fatalError("Unable to load data")
    }
    
    static func load<T: Decodable> (_ filename: String, with type: T.Type) -> T {
        let url = getLocalDir().appendingPathComponent(filename, isDirectory: false)

        if !FileManager.default.fileExists(atPath: url.path) {
            fatalError("No data @ \(url.path)")
        }
        
        if let data = FileManager.default.contents(atPath: url.path) {
            do {
                let model = try JSONDecoder().decode(type, from: data)
                return model
            } catch {
                fatalError("Unable to Decode from a file")
            }
        } else {
            fatalError("Unable to Load a file")
        }
    }
    
    static func loadAll<T: Decodable> (_ type: T.Type) -> [T] {
        do {
            let files = try FileManager.default.contentsOfDirectory(atPath: getLocalDir().path)
            var models = [T]()
            
            for file in files {
                models.append(load(file, with: type))
            }
            return models
        } catch {
            fatalError("Could not load files")
        }
    }
    
    static func delete (_ filename: String) {
        let url = getLocalDir().appendingPathComponent(filename, isDirectory: false)
        
        do {
            if FileManager.default.fileExists(atPath: url.path) {
                try FileManager.default.removeItem(at: url)
            }
        } catch {
            fatalError("Unable to delete an item")
        }
    }
}
