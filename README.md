# KGRippleAnimation

`KGRippleAnimation` is ripple animations for button click.

# Installation

## Cocoapods

Install Cocoapods if need be.

```bash
$ gem install cocoapods
```

Add `KGRippleAnimation` in your `Podfile`.

```ruby
use_frameworks!

pod 'KGRippleAnimation'
```

Then, run the following command.

```bash
$ pod install
```
## Carthage

Install Carthage if need be.

```bash
$ brew update
$ brew install carthage
```

Add `KGRippleAnimation` in your `Cartfile`.

```ruby
github "Gypsyan/KGRippleAnimation"
```

Run `carthage` to build the framework and drag the built `KGRippleAnimation.framework` into your Xcode project.



# Usage

Firstly, import `KGRippleAnimation`.

```swift
import KGRippleAnimation
```

## Initialization

```
let button = KGRippleButton(frame: CGRect(x: 100, y: 90, width: 200, height: 100))
self.view.addSubview(button)
```

## Add properties

You can properties for the button.

```
let button = KGRippleButton(frame: CGRect(x: 100, y: 90, width: 200, height: 100))
button.addTarget(self, action: #selector(yourAction), for: .touchUpInside)
button.setTitle("Here you Go", for: .normal);
button.backgroundColor = UIColor.yellow;
button.setTitleColor(UIColor.blue, for: .normal)
self.view.addSubview(button)
```

# License

Copyright 2016 Ananth.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
