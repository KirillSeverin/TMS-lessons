//
//  cacheManager.swift
//  NetClassWork16
//
//  Created by Martynov Evgeny on 3.03.21.
//

import Foundation
import AlamofireImage

// не поддается наследованию и все его методы косвенным образом приобретают свойство final
final class CacheManager {
    static let shared = CacheManager()
    private init() { }
    
    let imageCache = AutoPurgingImageCache(
        memoryCapacity: 100_000_000,
        preferredMemoryUsageAfterPurge: 60_000_000
    )
}
