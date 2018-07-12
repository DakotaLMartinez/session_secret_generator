require 'securerandom'
class SessionSecretGenerator::Generator
  def self.make_secret 
    hex = SecureRandom.hex(64)
    puts hex 
    hex
  end
end