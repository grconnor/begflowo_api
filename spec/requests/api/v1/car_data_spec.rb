RSpec.describe Api::V1::CarDataController, type: :request do
  let(:user) { create(:user) }
  let(:credentials) { user.create_new_auth_token }
  let(:headers) { { HTTP_ACCEPT: 'application/json' }.merge!(credentials) }

  describe 'POST /api/v1/car_data' do
    before do
      post '/api/v1/car_data',
      params: {
        car_data: {
          data: {
            "regnum" => "ABC123",
            "ordernum" => "00001",
            "make" => "Mercedes",
            "model" => "C63 AMG",
            "year" => 2021,
            "color" => "Black",
            "mileage" => "1020 km"
          }
        }
      },
      headers: headers
    end

    it 'returns a 200 response status' do
      expect(response).to have_http_status 200
    end

    it 'successfully creates data entries' do
      entry = CarData.last
      expect(entry.data).to eq "color"=>"Black", "make"=>"Mercedes", "mileage"=>"1020 km", "model"=>"C63 AMG", "ordernum"=>"00001", "regnum"=>"ABC123", "year"=>"2021"
    end

  end
end