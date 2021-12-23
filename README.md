# digit_widget

Displays number of specific radix (default is 10) as LED digit known from your electronics lab.(
It displays numbers 0-9 and hex digitd a-f
Special characters:
' ' (blank) - All segments off, ie. nothing
'-' (dash)  - Minus symbol
'=' (equal) - Equal symbol
'.' (decimal point)  - Decimal point

Usage:
Digit(
    context, - [BuildContext | https://api.flutter.dev/flutter/widgets/BuildContext-class.html]
    height,  - height,
    foreGroundColor - Color (color of digit segment), backGroundColor, barRadius)
