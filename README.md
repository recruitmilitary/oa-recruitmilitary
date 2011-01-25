# oa-recruitmilitary

OmniAuth integration for RecruitMilitary Connect.

## Rails Integration

### Gemfile

    gem 'omniauth'
    gem 'devise', :git => "http://github.com/plataformatec/devise.git"

### Devise

    rails generate devise:install
    rails generate devise MODEL

### Initializer

    Devise.setup do |config|
      # ...
      config.omniauth :recruitmilitary, RECRUITMILITARY_APP_ID, RECRUITMILITARY_SECRET
    end

### Routes

    devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

### Controllers

    class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
      def recruitmilitary
        @user = User.find_for_recruitmilitary_oauth(env["omniauth.auth"], current_user)

        if @user.persisted?
          flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "RecruitMilitary"
          sign_in_and_redirect @user, :event => :authentication
        else
          session["devise.recruitmilitary_data"] = env["omniauth.auth"]
          redirect_to new_user_registration_url
        end
      end
    end

### Models

    class User < ActiveRecord::Base
      devise :database_authenticatable, :rememberable, :omniauthable

      def self.find_for_recruitmilitary_oauth(access_token, signed_in_resource=nil)
        data = access_token['extra']
        if user = User.find_by_email(data["email"])
          user
        else # Create an user with a stub password.
          User.create!(:email => data["email"], :password => Devise.friendly_token[0,20])
        end
      end
    end

## TODO

* unit tests
* integration tests with sample Rails app
