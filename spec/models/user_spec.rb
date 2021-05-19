require "rails_helper"

RSpec.describe User, type: :model do
  
  describe 'factory' do
    it "should have valid factory" do
      expect(FactoryBot.create(:user)).to be_valid
    end
  end

  describe "database table" do
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :tokens }
    it { is_expected.to have_db_column :encrypted_password }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :password }
  end

  describe 'relations' do
    it { is_expected.to have_many :car_data }
  end

  context "should not have an invalid email address" do
    emails = ["asdf@ ds.com", "@example.com", "test me @yahoo.com",
              "asdf@example", "ddd@.d. .d", "ddd@.d"]

    emails.each do |email|
      it { is_expected.not_to allow_value(email).for(:email) }
    end
  end

  context "should have a valid email address" do
    emails = ["asdf@ds.com", "hello@example.uk", "test1234@yahoo.si",
              "asdf@example.eu"]

    emails.each do |email|
      it { is_expected.to allow_value(email).for(:email) }
    end
  end

end
