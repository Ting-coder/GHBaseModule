//
//  GHViewModel.swift
//  GHBaseModule_Example
//
//  Created by haoguanhao on 08/10/2018.
//  Copyright (c) 2018 haoguanhao. All rights reserved.
//

import UIKit

protocol GHViewModel {
    associatedtype Input
    associatedtype Output
    
    func transform(input : Input) -> Output
    
}
