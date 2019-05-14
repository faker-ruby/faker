# Change log

## [v0.12.0] - 2018-12-09

### Added
* Add SystemPager#run_command for running pager command silently and capturing output

### Changed
* Change SystemPager#new to allow specifying more than one custom command
* Change SystemPager#page to check if pager command can be run with flags before paging content
* Change to update tty-screen and tty-which dependencies

### Fixed
* Fix SystemPager to page content with ANSI codes

## [v0.11.0] - 2018-01-11

### Added
* Add `pg` and `most` to executables lookup

### Changed
* Change verse to strings dependency
* Change SystemPager to make all class methods public
* Change SystemPager#available to #find_executable
* Change SystemPager#available? to #exec_available
* Change Pager#find_available to #select_pager and make class method

### Fixed
* Fix Pager throwing exception if git is not installed by Katelyn Schiesser(@slowbro)

## [v0.10.0] - 2017-10-29

### Changed
* Change tty-screen dependency version
* Change gemspec to require Ruby >= 2.0.0
* Remove encoding comments

## [v0.9.0] - 2017-08-18

### Changed
* Change SystemPager to stop using fork, instead execute pager in subprocess
  and make it portable across platforms including Windows
* Change SystemPager to work on jruby
* Change NullPager to only print to stdout on tty device
* Change Pager to select SystemPager when paging command exists
* Remove jruby? checks from pager selection

## [v0.8.0] - 2017-07-14

### Added
* Add :command option to SystemPager to enforce choice of pagination tool
* Add Error type for specific error notifications

### Changed
* Change SystemPager to prevent initialization if pager isn't supported

### Fixed
* Fix BasicPager to take terminal width into account when displaying page break messages
* Fix SystemPager on Windows by detecting fork implementation

## [v0.7.1] - 2017-04-09

### Fixed
* Fix SystemPager raises error when executable is blank string by Jacob Evelyn (@JacobEvelyn)

## [v0.7.0] - 2017-03-20

### Changed
* Change files loading
* Update tty-which dependency

## [v0.6.0] - 2017-03-19

### Changed
* Change SystemPager to support piped git pagers by @JacobEvelyn

## [v0.5.0] - 2016-12-19

### Changed
* Change to call TTY::Which#exist? new api
* Change to send fork message directly to SystemPager
* Update tty-which
* Update verse dependency

## [v0.4.0] - 2016-02-06

### Changed
* Update tty-screen dependency

## [v0.3.0] - 2015-09-20

### Changed
* Change to use new tty-screen dependency

## [v0.2.0] - 2015-06-27

### Changed
* Change SystemPager to correctly paginate inside a process.

### [v0.1.0] - 2015-05-31

* Initial release

[v0.12.0]: https://github.com/piotrmurach/tty-pager/compare/v0.11.0...v0.12.0
[v0.11.0]: https://github.com/piotrmurach/tty-pager/compare/v0.10.0...v0.11.0
[v0.10.0]: https://github.com/piotrmurach/tty-pager/compare/v0.9.0...v0.10.0
[v0.9.0]: https://github.com/piotrmurach/tty-pager/compare/v0.8.0...v0.9.0
[v0.8.0]: https://github.com/piotrmurach/tty-pager/compare/v0.7.1...v0.8.0
[v0.7.1]: https://github.com/piotrmurach/tty-pager/compare/v0.7.0...v0.7.1
[v0.7.0]: https://github.com/piotrmurach/tty-pager/compare/v0.6.0...v0.7.0
[v0.6.0]: https://github.com/piotrmurach/tty-pager/compare/v0.5.0...v0.6.0
[v0.5.0]: https://github.com/piotrmurach/tty-pager/compare/v0.4.0...v0.5.0
[v0.4.0]: https://github.com/piotrmurach/tty-pager/compare/v0.3.0...v0.4.0
[v0.3.0]: https://github.com/piotrmurach/tty-pager/compare/v0.2.0...v0.3.0
[v0.2.0]: https://github.com/piotrmurach/tty-pager/compare/v0.1.0...v0.2.0
[v0.1.0]: https://github.com/piotrmurach/tty-pager/compare/v0.1.0
