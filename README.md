# SwiftUI STKComponents

## Installation

To install this package, import `https://github.com/JorgeDVLP/STKComponents.git` in SPM.

## FloatingTextfield 

Textfield with a floating label which moves up when the user starts editing. 
The label color change to accent when the textfield is focused. The default unfocused color is gray.

#### Usage example


```swift

struct ContentView: View {

    var body: some View {
        VStack {
            FloatingTextfield("Username", icon: "person.fill", text: $username)
        }
    }
}


```

#### View Modifiers

Show clear text button
```swift
.clearButtonHidden(_ hidden: Bool = true)
```

Transform the default textfield into a SecureField

```swift
.secured(_ secured: Bool = true)
```

Simply mark placeholder text with * to indicate that is a mandatory field

```swift
.mandatory(_ mandatory: Bool = true)
```
