module DevRandomPasswords
  class Generator

    attr_accessor :charset
    attr_accessor :char_length

    LOWERCASE_CHARS = ('a'..'z').to_a.join("")
    UPPERCASE_CHARS = ('A'..'Z').to_a.join("")
    DIGITS = ('0'..'9').to_a.join("")
    SPECIAL_CHARS = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~'

    def initialize
      @charset = LOWERCASE_CHARS + UPPERCASE_CHARS + DIGITS + SPECIAL_CHARS
      @char_length = 8
      @requirements = nil
    end

    def get_byte
      if File.exist?('/dev/hwrng')
        if File.readable?('/dev/hwrng')
          random_file = File.new('/dev/hwrng', 'r')
          random_byte = random_file.read(1).ord
          random_file.close
          return random_byte
        else
          raise "/dev/hwrng is not readable by the current user please change permissions on this file"
        end

      elsif File.exist?('/dev/random')
        if File.readable?('/dev/random')
          random_file = File.new('/dev/random', 'r')
          random_byte = random_file.read(1).ord
          random_file.close
          return random_byte
        else
          raise "/dev/random is not readable by the current user please change permissions on this file"
        end

      else
        raise "Could not find a random number generator on your system"
      end
    end

    def set_options(options={
      'lowercase' => true,
      'uppercase' => true,
      'digits' => true,
      'special' => true,
      'include' => nil,
      'exclude' => nil,
      'length' => 8,
      'requirements' => nil})

      new_set = ""

      if options['lowercase']
        new_set += LOWERCASE_CHARS
      end

      if options['uppercase']
        new_set += UPPERCASE_CHARS
      end

      if options['digits']
        new_set += DIGITS
      end

      if options['special']
        new_set += SPECIAL_CHARS
      end

      if options['include']
        if options['include'].respond_to? :each
          options['include'].each do |char|
            unless new_set.include? char
              new_set.insert(-1, char)
            end
          end
        elsif options['include'].respond_to? :split
          options['include'].split("").each do |char|
            unless new_set.include? char
              new_set.insert(-1, char)
            end
          end
        end
      end

      if options['exclude']
        if options['exclude'].respond_to? :each
          options['exclude'].each do |char|
            if new_set.include? char
              new_set = new_set.tr(char, '')
            end
          end
        elsif options['exclude'].respond_to? :split
          options['exclude'].split("").each do |char|
            if new_set.include? char
              new_set = new_set.tr(char, '')
            end
          end
        end
      end

      @charset = new_set

      if options['length']
        if options['length'].respond_to? :to_i
          @char_length = options['length'].to_i
        end
      end

      if options['requirements']
        @requirements = options['requirements']
      end

    end

    def requirements_met?(password)

      if @requirements
        if @requirements['uppercase']
          if (password.split("") & UPPERCASE_CHARS.split("")).empty?
            return false
          end
        end

        if @requirements['lowercase']
          if (password.split("") & LOWERCASE_CHARS.split("")).empty?
            return false
          end
        end

        if @requirements['digits']
          if (password.split("") & DIGITS.split("")).empty?
            return false
          end
        end

        if @requirements['special']
          if (password.split("") & SPECIAL_CHARS.split("")).empty?
            return false
          end
        end
      end

      return true

    end

    def generate
      new_password = ""

      @char_length.times do
        rand_num = get_byte
        while rand_num >= @charset.length
          rand_num -= @charset.length
        end
        new_password += @charset[rand_num]
      end

      if requirements_met? new_password
        return new_password
      else
        return generate
      end

    end

  end
end
