# RunTimeValidationTextField

RTVTextField is a UITextField library with floating placeholder, validations as seperator and text below  handled at run time.

Floating placeholder inspired from JVFloatLabeledTextField 

## Example

Clone the repo install require pods and run the workspace project from the directory.

### Requirements

*  Xcode 9.0+
* Swift 4.0+

## Built With

* [JVFloatLabeledTextField](https://github.com/jverdi/JVFloatLabeledTextField) - To show floating lables in textfields.
* [IQKeyboardManagerSwift](https://github.com/hackiftekhar/IQKeyboardManager) - Handle autoscroll, next and previous for textfields.
* [Cartography](https://github.com/robb/Cartography) - To add programatic contraints.

## Usage

1. Open a storyboard or Xib file.  
2. Drag and drop a `UITextField` to a ViewController.  
3. In Identity Inspector, replace the class from `UITextField` to `RTVTextField` and the module to `RTVTextField`.  

## Properties

| Property name | Type | Remark |
| ------------- |------------- | ----- |
| isValidationsEnable | Bool | To enable disable validations from textfield |
| customtextColor | UIColor | sets textColor of RTVTextField |
| validationText | String | sets validation text to show below separator |
| activeSeparatorColor | UIColor | To show separator below textfield |
| rtvFloatingLabelTextColor | UIColor | To change color of floating lable in textfield |
| rtvFloatingLabelActiveColor | UIColor | To change color of floating lable in active textfield |
| validationColor | UIColor | To change color of validation lable below the separator |
| floatingLabelYPadding | CGFloat | sets y padding to textfield |

### Important Properties

| Property name | Type | Remark |
| ------------- |------------- | ----- |
| cornerRadius | CGFloat | sets corner radius in RTVTextField |
| isValidationsEnable | Bool | To enable disable validations from textfield |

## Methods

| Method Name | Remark |
| ------------|--------|
| showValidationError(_ validationText: String) | To show validation text in validationLabel(pass validation text in validationText parameter) |
| removeValidationError() | to hide validation message |


## Authors

* **Hemant Maii**

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details



