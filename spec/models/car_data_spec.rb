require 'rails_helper'

RSpec.describe CarData, type: :model do
  describe 'factory' do
    it 'should have a valid factory' do
      expect(FactoryBot.create(:car_data)).to be_valid
    end
  end

  describe 'database table' do
    it { is_expected.to have_db_column :data }
    it { is_expected.to have_db_column :regnum }
    it { is_expected.to have_db_column :ordernum }
    it { is_expected.to have_db_column :make }
    it { is_expected.to have_db_column :model }
    it { is_expected.to have_db_column :year }
    it { is_expected.to have_db_column :color }
    it { is_expected.to have_db_column :mileage }
  end

  describe 'relations' do
    it { is_expected.to belong_to :user}
  end
end
