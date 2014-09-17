class RandomPassword

  def self.get_byte
    random = File.new("/dev/random", 'r')
    random.read(1).ord
  end

  def generate(numchar=8, special=true, exclude=[])
    newpassword = ''
    charset = (('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a).join("")
    if special
      charset += '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~'
    end
    exclude.each do |letter|
      charset.replace(letter,"")
    end
    numchar.times do
      rand_num = self.get_byte
      while rand_num >= charset.length
        rand_num -= charset.length
      end
      newpassword += charset[rand_num]
    end
    return newpassword
  end

end
