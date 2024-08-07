//
//  FloatingTextfield.swift
//
//
//  Created by Jorge Martin Moreno on 7/8/24.
//

import SwiftUI

public struct FloatingTextfield: View {
    
    private let placeholder: String
    private let icon: String?
    
    @Binding private var text: String
    @FocusState private var keyboardFocused: Bool
    @Environment(\.clearButtonHidden) private var isClearButtonHidden: Bool
    @Environment(\.securedField) private var isSecured: Bool
    @Environment(\.isMandatory) private var isMandatory: Bool
    
    public init(_ placeholder: String, icon: String? = nil, text: Binding<String>, keyboardFocused: FocusState<Bool>? = nil) {
        self.placeholder = placeholder
        self.icon = icon
        self._text = text
        if let keyboardFocused {
            self._keyboardFocused = keyboardFocused
        }
    }
    
    public var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                if let icon {
                    Image(systemName: icon)
                        .foregroundStyle(unfocusedColor)
                }
                
                ZStack(alignment: .leading) {
                    Text(fieldTitle.capitalized)
                        .offset(x: text.isEmpty ? 0 : -10,
                                y: text.isEmpty ? 0 : -25)
                        .scaleEffect(text.isEmpty ? 1 : 0.8)
                        .animation(.easeInOut, value: text)
                        .focusable(false)
                        .foregroundColor(keyboardFocused ? .accentColor : unfocusedColor)
                    
                    Group {
                        if !isSecured {
                            TextField("", text: $text)
                                .focused($keyboardFocused)
                        } else {
                            SecureField("", text: $text)
                                .focused($keyboardFocused)
                        }
                    }
                    .autocorrectionDisabled()
                }
                
                if !isClearButtonHidden && !text.isEmpty {
                    Button(action: {
                        text = ""
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(unfocusedColor)
                    })
                }
            }
        }
        .padding(.vertical)
        .padding(.top, 20)
        .overlay(
            Rectangle()
                .frame(height: 1)
                .foregroundColor(unfocusedColor),
            alignment: .bottom
        )
    }
}

extension FloatingTextfield {
    private var unfocusedColor: Color {
        Color.gray
    }
    
    private var fieldTitle: String {
        isMandatory ? placeholder.appending("*") : placeholder
    }
}
