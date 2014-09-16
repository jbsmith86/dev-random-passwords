import string

def getRandByte():
  with open("/dev/random", 'rb') as file:
    return ord(file.read(1))

def getPassword(numchar, special=True, exclude=[]):
  newpassword = ''
  charset = string.letters + string.digits
  if special:
    charset += string.punctuation
  for letter in exclude:
    charset.replace(letter,"")
  for i in range(numchar):
    rand_num = getRandByte()
    while (rand_num > len(charset)):
      rand_num -= len(charset)
    newpassword += charset[rand_num - 1]
  return newpassword
