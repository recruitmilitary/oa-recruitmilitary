require 'rspec'
require 'oa-recruitmilitary'

describe OmniAuth::RecruitMilitary do

  describe OmniAuth::RecruitMilitary::Configuration do
    context 'without modification' do
      it 'has sane values' do
        config = OmniAuth::RecruitMilitary::Configuration.new

        config.authorize_url.should == 'http://connect.recruitmilitary.com/auth/authorize'
      end
    end

    context 'when modifying the site url' do
      it 'updates all related urls' do
        config = OmniAuth::RecruitMilitary::Configuration.new
        config.site = 'http://localhost:3000'

        config.authorize_url.should == 'http://localhost:3000/auth/authorize'
        config.access_token_url.should == 'http://localhost:3000/auth/access_token'
        config.user_data_url.should == 'http://localhost:3000/auth/user.json'
      end
    end
  end

end
