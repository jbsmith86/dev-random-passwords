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
rpg.set_options({'lowercase' => true, 'uppercase' => true, 'digits' => true,  'length' => 12, 'requirements' => {'digits' => true, 'uppercase' => true, 'lowercase' => true}})
```

Generate a new password
```ruby
rpg.generate #=> "J0jhBM9dAPwk"
```

Enjoy!

## Contributing

1. Fork it ( https://github.com/jbsmith86/dev-random-passwords/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
