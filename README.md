# SwiftUI STKComponents

## Installation

To install this package, import `https://github.com/JorgeDVLP/STKComponents.git` in SPM.

## FloatingTextfield 

Textfield with a floating label which moves up when the user starts typing. The label is set to the accent color of your project when the textfield is being edited.

## Usage example

```swift

struct ContentView: View {

    var body: some View {
        VStack {
             FloatingTextfield("Username", icon: "person.fill", text: $username)
        }
    }
}


```

There are a few modifiers for configuring the component:

    .clearButtonHidden(_ hidden: Bool = true) -> enables the textfield clear button
    .secured(_ secured: Bool = true) -> transform the default textfield into a SecureField
    .mandatory(_ mandatory: Bool = true) -> mark textfield placeholder with * to indicate that is a mandatory textfield
