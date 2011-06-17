require 'rspec'
require 'oa-recruitmilitary'

describe OmniAuth::RecruitMilitary do

  describe OmniAuth::RecruitMilitary::Configuration do
    let(:config) { OmniAuth::RecruitMilitary::Configuration.new }

    it 'sets properties from the initializer' do
      config = OmniAuth::RecruitMilitary::Configuration.new(
        :site => 'http://localhost:3000',
        :authorize_path => '/oauth/authorize')

      config.site.should == 'http://localhost:3000'
      config.authorize_url.should == 'http://localhost:3000/oauth/authorize'
    end

    context 'without modification' do
      it 'has sane values' do
        config.authorize_url.should == 'http://connect.recruitmilitary.com/auth/authorize'
      end
    end

    context 'when modifying the site url' do
      it 'updates all related urls' do
        config.site = 'http://localhost:3000'

        config.authorize_url.should == 'http://localhost:3000/auth/authorize'
        config.access_token_url.should == 'http://localhost:3000/auth/access_token'
        config.user_data_url.should == 'http://localhost:3000/auth/user.json'
      end
    end

    context 'when modifying a path' do
      it 'preserves the original site' do
        config.authorize_path = '/oauth/authorize'

        config.authorize_url = config.site + '/oauth/authorize'
      end
    end

    it 'allows the url to be modified directly' do
      config.authorize_url = 'http://google.com'

      config.authorize_url.should == 'http://google.com'
    end

    context 'when the url has been modified' do
      it 'is modifiable by changing path' do
        config.authorize_url = 'http://google.com'

        config.authorize_path = '/blah/blah'

        config.authorize_url.should == config.site + '/blah/blah'
      end
    end
  end

end
