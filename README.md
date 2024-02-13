<div align="center">
<p align="center">
    <a href="https://github.com/K1yoshiSho/rtf_textfield" align="center">
        <img src="https://github.com/K1yoshiSho/rtf_textfield/blob/main/assets/images/rich_text_field.png?raw=true" width="400px">
    </a>
</p>
</div>

<h2 align="center"> Flutter custom widget to create Rich TextField 🚀 </h2>

<p align="center">
Included RTFTextFieldController for customize text, hint and label TextSpan 😊
   <br>
   <span style="font-size: 0.9em"> Show some ❤️ and <a href="https://github.com/K1yoshiSho/rtf_textfield.git">star the repo</a> to support the project! </span>
</p>

<p align="center">
  <a href="https://pub.dev/packages/rtf_textfield"><img src="https://img.shields.io/pub/v/rtf_textfield.svg" alt="Pub"></a>
  <a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="License: MIT"></a>
  <a href="https://github.com/K1yoshiSho/rtf_textfield"><img src="https://hits.dwyl.com/K1yoshiSho/rtf_textfield.svg?style=flat" alt="Repository views"></a>
  <a href="https://github.com/K1yoshiSho/rtf_textfield"><img src="https://img.shields.io/github/stars/K1yoshiSho/rtf_textfield?style=social" alt="Pub"></a>
</p>
<p align="center">
  <a href="https://pub.dev/packages/rtf_textfield/score"><img src="https://img.shields.io/pub/likes/rtf_textfield?logo=flutter" alt="Pub likes"></a>
  <a href="https://pub.dev/packages/rtf_textfield/score"><img src="https://img.shields.io/pub/popularity/rtf_textfield?logo=flutter" alt="Pub popularity"></a>
  <a href="https://pub.dev/packages/rtf_textfield/score"><img src="https://img.shields.io/pub/points/rtf_textfield?logo=flutter" alt="Pub points"></a>
</p>

<br>

## 📌 Features

- ✅ Customizable hint
- ✅ Customizable label
- ✅ Data serialization *(Store and fetch styled text in JSON format)*
- ✅ Customizable text features with `RTFTextFieldController` *(change color, style, size, wight, etc.)*

## 📌 Getting Started
Follow these steps to use this package

### Add dependency

```yaml
dependencies:
  rtf_textfield: ^1.0.1
```

### Add import package

```dart
import 'package:rtf_textfield/rtf_textfield.dart';
```

### Easy to use
Simple example of use `RTFTextField`<br>
Put this code in your project at an screen and learn how it works 😊

<div style="display: flex; flex-direction: row; align-items: flex-start; justify-content: flex-start;">
  <img src="https://github.com/K1yoshiSho/rtf_textfield/blob/main/assets/images/screenshot1.png?raw=true" 
  alt="Screenshot" width="250" style="margin-right: 10px;"/>
    <img src="https://github.com/K1yoshiSho/rtf_textfield/blob/main/assets/images/screenshot2.png?raw=true" 
  alt="Screenshot" width="250" style="margin-right: 10px;"/>
      <img src="https://github.com/K1yoshiSho/rtf_textfield/blob/main/assets/images/screenshot3.png?raw=true" 
  alt="Screenshot" width="250" style="margin-right: 10px;"/>
</div>

&nbsp;

Widget part:
```dart
RTFTextField(
   onTapOutside: (event) {
      FocusManager.instance.primaryFocus?.unfocus();
   },
   decoration: const RichInputDecoration(
      border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
   ),
      enabledBorder: OutlineInputBorder(
         borderSide: BorderSide(
            color: Colors.grey,
         ),
         borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      labelTextSpan: TextSpan(
         text: 'Enter your name',
         children: [
            TextSpan(
               text: ' *',
               style: TextStyle(
                  color: Colors.red,
               ),
            ),
         ],
      ),
      hintTextSpan: TextSpan(
         text: 'Yelaman',
         ),
      ),
   controller: controller,
),
```

Change text weight using `RTFTextFieldController`:

```dart
controller.toggleBold();
```


### 📌 Examples
You can check more examples of using this package [here](example/lib)

<br>
<div align="center" >
  <p>Thanks to all contributors of this package</p>
  <a href="https://github.com/K1yoshiSho/rtf_textfield/graphs/contributors">
    <img src="https://contrib.rocks/image?repo=K1yoshiSho/rtf_textfield" />
  </a>
</div>
<br>