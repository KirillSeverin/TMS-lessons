//
//  ViewController.swift
//  FileManagerClassWork
//
//  Created by Martynov Evgeny on 26.04.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fileNameTF: UITextField!
    @IBOutlet weak var fileTextView: UITextView!
    @IBOutlet weak var infoTextView: UITextView!

    let fileManager = FileManager()
    let tempDir = NSTemporaryDirectory()
    var fileName: String {
        fileNameTF.text ?? "default.txt"
    }
    var contentsOfFile: String {
        fileTextView.text ?? "Some Text Here"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func createFile() {
        let path = (tempDir as NSString).appendingPathComponent(fileName)
        // Записываем в файл
        do {
            try contentsOfFile.write(toFile: path, atomically: true, encoding: String.Encoding.utf8)
            infoTextView.text = "File \(fileName) created at temp directory"
        } catch let error as NSError {
            infoTextView.text = "could't create file \(fileName) because of error: \(error)"
        }
    }

    @IBAction func deleteFile() {

        let directoryWithFiles = checkDirectory() ?? "Empty"
        do {
            let path = (tempDir as NSString).appendingPathComponent(directoryWithFiles)
            try fileManager.removeItem(atPath: path)
            print("file deleted")
        } catch let error as NSError {
            print("error occured while deleting file: \(error.localizedDescription)")
        }
    }

    @IBAction func readFile() {
        // Читаем
        let directoryWithFiles = checkDirectory() ?? "Empty"

        let path = (tempDir as NSString).appendingPathComponent(directoryWithFiles)

        do {
            let contentsOfFile = try NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue)
            infoTextView.text = "content of the file is: \(contentsOfFile)"
        } catch let error as NSError {
            infoTextView.text = "there is an file reading error: \(error)"
        }
    }

    @IBAction func seeDir() {
        infoTextView.text = getDirectoryFiles()?.debugDescription
    }

    func checkDirectory() -> String? {
        do {
            let filesInDirectory = try fileManager.contentsOfDirectory(atPath: tempDir)

            if !filesInDirectory.isEmpty {
                let files = filesInDirectory.filter({ fileNameDir -> Bool in
                    fileNameDir == fileName
                })
                if !files.isEmpty {
                    print("\(fileName) found")
                    return files.first
                } else {
                    print("\(fileName) not found")
                    return nil
                }
            }
        } catch let error as NSError {
            print(error)
        }
        return nil
    }

    func getDirectoryFiles() -> [String]? {
        do {
            let filesInDirectory = try fileManager.contentsOfDirectory(atPath: tempDir)
            return filesInDirectory
        } catch let error as NSError {
            print(error)
        }
        return nil
    }
}

