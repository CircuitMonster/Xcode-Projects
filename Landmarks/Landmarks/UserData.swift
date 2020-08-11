//
//  UserData.swift
//  Landmarks
//
//  Created by Brian Ackley on 1/9/20.
//  Copyright © 2020 CircuitMonster. All rights reserved.
//

import SwiftUI
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
    @Published var profile = Profile.default
}
