//
//  File.swift
//  
//
//  Created by Jorge Martin Moreno on 7/8/24.
//

import SwiftUI

extension View {
    public func clearButtonHidden(_ hidden: Bool = true) -> some View {
        environment(\.clearButtonHidden, hidden)
    }
    
    public func secured(_ secured: Bool = true) -> some View {
        environment(\.securedField, secured)
    }
    
    public func mandatory(_ mandatory: Bool = true) -> some View {
        environment(\.isMandatory, mandatory)
    }
}

struct CCATextFieldMandatoryKey: EnvironmentKey {
    static var defaultValue: Bool = false
}

struct CCATextFieldKey: EnvironmentKey {
    static var defaultValue: Bool = false
}

struct CCASecureTextFieldKey: EnvironmentKey {
    static var defaultValue: Bool = false
}

extension EnvironmentValues {
    var clearButtonHidden: Bool {
        get {
            self[CCATextFieldKey.self]
        }
        set {
            self[CCATextFieldKey.self] = newValue
        }
    }
    
    var securedField: Bool {
        get {
            self[CCASecureTextFieldKey.self]
        }
        set {
            self[CCASecureTextFieldKey.self] = newValue
        }
    }
    
    var isMandatory: Bool {
        get {
            self[CCATextFieldMandatoryKey.self]
        }
        set {
            self[CCATextFieldMandatoryKey.self] = newValue
        }
    }
}
