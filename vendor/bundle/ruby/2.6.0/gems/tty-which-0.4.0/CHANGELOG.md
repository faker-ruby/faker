# Change log

## [v0.4.0] - 2018-10-13

### Added
* Add ability to specify search paths for #which and #exist? calls

### Changed
* Change to freeze all strings
* Change gemspec to require Ruby >= 2.0.0
* Change gemspec to load files without calling git
* Change gemspec to add rspec as dev dependency

## [v0.3.0] - 2017-03-20

### Changed
* Change #extensions to use file path separator
* Change files loading
* Remove search paths caching

## [v0.2.2] - 2017-02-06

### Fixed
* Fix File namespacing issue

## [v0.2.1] - 2016-12-26

### Changed
* Change to stop shadowing path var in Which#search_paths

## [v0.2.0] - 2016-07-01

### Added
* Add Which#exist? to check if file exists based on found path

### Changed
* Change Which#search_paths to allow for paths argument
* Rename Which#executable_file_with_ext? to #file_with_exec_ext?
* Rename Which#path_with_executable_file? to #file_with_path?

### Fixed
* Fix bug with Which#file_with_exec_ext? when comparing extensions

## [v0.1.0] - 2015-05-30

* Initial implementation and release

[v0.4.0]: https://github.com/piotrmurach/tty-which/compare/v0.3.0...v0.4.0
[v0.3.0]: https://github.com/piotrmurach/tty-which/compare/v0.2.2...v0.3.0
[v0.2.2]: https://github.com/piotrmurach/tty-which/compare/v0.2.1...v0.2.2
[v0.2.1]: https://github.com/piotrmurach/tty-which/compare/v0.2.0...v0.2.1
[v0.2.0]: https://github.com/piotrmurach/tty-which/compare/v0.1.0...v0.2.0
[v0.1.0]: https://github.com/piotrmurach/tty-which/compare/v0.1.0
