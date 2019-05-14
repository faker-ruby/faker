# Changelog

## master (unreleased)

## 0.1.2 (2018-06-10)

* Changed `String#remove_prefix` to return the original string if the parameter is not a prefix.
+* Changed `String#remove_prefix!`to return the original string if the parameter is not a prefix.
+* Changed `String#remove_suffix` to return the original string if the parameter is not a suffix.
+* Changed `String#remove_suffix!` to return the original string if the parameter is not a suffix.

## 0.1.1 (2015-05-04)

No user-visible changes.

## 0.1.0 (2015-01-25)

* Added `String#remove_prefix`
* Added `String#remove_prefix!`
* Added `String#remove_suffix`
* Added `String#remove_suffix!`

## 0.0.9 (2013-10-22)

* Added `String#remove`
* Added `String#remove!`
* Added `String#ascii_only`
* Added `String#ascii_only!`

## 0.0.8 (2013-09-13)

### New features

* Added `Enumerable#exactly?`
* Added `Enumerable#average`
* Added `Numeric#hundred`
* Added `Numeric#thousand`
* Added `Numeric#million`
* Added `Numeric#billion`
* Added `Numeric#trillion`
* Added `Numeric#quadrillion`

### Changes

* Renamed `Array#tail` to `Array#butfirst`
* `Enumerable#take_last_while` returns the result in the same order as `Enumerable#take_last`
