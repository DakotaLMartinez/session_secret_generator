RSpec.describe SessionSecretGenerator do
  it "has a version number" do
    expect(SessionSecretGenerator::VERSION).not_to be nil
  end

  it "creates random hexadecimal strings" do
    secret_1 = SessionSecretGenerator::Generator.make_secret
    secret_2 = SessionSecretGenerator::Generator.make_secret
    expect(secret_1).not_to eq(secret_2)
  end

  it "creates hexadecimal strings that are 128 characters long" do 
    secret_1 = SessionSecretGenerator::Generator.make_secret
    expect(secret_1.length).to eq(128)
  end
end
