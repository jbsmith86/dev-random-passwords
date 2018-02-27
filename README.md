[![Gem Version](https://badge.fury.io/rb/dev-random-passwords.svg)](http://badge.fury.io/rb/dev-random-passwords)
# Dev-Random-Passwords

Passwords that need to be used long term and are randomly generated need more randomness than your standard random library. On Linux, Unix or OSX /dev/random can be used to create really secure passwords from random bytes. This gem provides an implementation to do just that.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dev-random-passwords'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dev-random-passwords

## Usage

### From command line

Simply install the gem and run "randompasswords"
```
$ randompasswords
ci+IUid(QVG1
```

dev-random-passwords by default creates a 12 character random password with uppercase and lowercase letters, numbers, and special characters. A password with these qualities would take centuries to brute force and ensure that you have very secure random passwords.

Use -l to specify chracter length
```
$ randompasswords -l 16
U[3wjY?]~h$26s!Q
```
Use -c to set which character types you want to use (uppercase, lowercase, digits or special)
```
$ randompasswords -l 16 -c lowercase,uppercase
cxtDCjIaTFmHnlba
```

Use -i to include certain characters or -e to exclude them
```
$ randompasswords -c digits -l 54 -e 23456789
010000101100100111000010000111101010011101110010011011
```

Run "randompasswords -h" for full set of options and description

### For programming
Require the gem

```ruby
require 'dev-random-passwords'
```

Set up a new instance
```ruby
rpg = DevRandomPasswords::Generator.new
```

Set some options for your password
```ruby
rpg.set_options({'lowercase' => true, 'uppercase' => true, 'digits' => true,  'length' => 18, 'requirements' => {'digits' => true, 'uppercase' => true, 'lowercase' => true}})
```

Generate a new password
```ruby
rpg.generate #=> "wdHHzTex47NWFyseN8"
```

Enjoy!

## Contributing

1. Fork it ( https://github.com/jbsmith86/dev-random-passwords/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
