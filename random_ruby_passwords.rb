def getRandByte
  random = File.new("/dev/random", 'r')
  random.read(1).ord
end

def getPassword(numchar, special=true, exclude=[])
  newpassword = ''
  charset = (('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a).join("")
  if special
    charset += '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~'
  end
  exclude.each do |letter|
    charset.replace(letter,"")
  end
  numchar.times do
    rand_num = getRandByte
    while rand_num > charset.length
      rand_num -= charset.length
    end
    newpassword += charset[rand_num - 1]
  end
  return newpassword
end
