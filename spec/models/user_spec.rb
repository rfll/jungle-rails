require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    # validation examples here

    it 'should save successfully for name, last name, email, password' do
      @user = User.new
      @user.name = 'penny'
      @user.last_name = 'hardaway'
      @user.email = 'penny@lilpenny.com'
      @user.password = 'pppp'
      @user.password_confirmation = 'pppp'

      @user.save
      expect(@user).to be_valid
    end

    it 'is not valid without a first name' do
      @user = User.new
      @user.name = nil
      @user.last_name = 'hardaway'
      @user.email = 'penny@lilpenny.com'
      @user.password = 'pppp'
      @user.password_confirmation = 'pppp'

      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it 'is not valid without a last name' do
      @user = User.new
      @user.name = 'penny'
      @user.last_name = nil
      @user.email = 'penny@lilpenny.com'
      @user.password = 'pppp'
      @user.password_confirmation = 'pppp'

      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'is not valid without an email' do
      @user = User.new
      @user.name = 'penny'
      @user.last_name = 'hardaway'
      @user.email = nil
      @user.password = 'pppp'
      @user.password_confirmation = 'pppp'

      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'is not valid without a password' do
      @user = User.new
      @user.name = 'penny'
      @user.last_name = 'hardaway'
      @user.email = 'penny@lilpenny.com'
      @user.password = nil
      @user.password_confirmation = 'pppp'

      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'is not valid without a password confirmation' do
      @user = User.new
      @user.name = 'penny'
      @user.last_name = 'hardaway'
      @user.email = 'penny@lilpenny.com'
      @user.password = 'pppp'
      @user.password_confirmation = nil

      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'is not valid without matching password and password confirmation' do
      @user = User.new
      @user.name = 'penny'
      @user.last_name = 'hardaway'
      @user.email = 'penny@lilpenny.com'
      @user.password = 'pppp'
      @user.password_confirmation = 'pppp2'

      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'is not valid without a password at least 3 characters' do
      @user = User.new
      @user.name = 'penny'
      @user.last_name = 'hardaway'
      @user.email = 'penny@lilpenny.com'
      @user.password = 'pp'
      @user.password_confirmation = 'pp'

      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
    end    

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here

    it 'should authenticate with credentials' do
      @user = User.new
      @user.name = 'penny'
      @user.last_name = 'hardaway'
      @user.email = 'penny@lilpenny.com'
      @user.password = 'pppp'
      @user.password_confirmation = 'pppp'
      @user.save

      authenticate_user = User.authenticate_with_credentials('penny@lilpenny.com', 'pppp')
      expect(authenticate_user).to eql(@user)
    end

    it 'should authenticate with email characters in different case' do
      @user = User.new
      @user.name = 'penny'
      @user.last_name = 'hardaway'
      @user.email = 'penny@lilpenny.com'
      @user.password = 'pppp'
      @user.password_confirmation = 'pppp'
      @user.save

      authenticate_user = User.authenticate_with_credentials('peNNy@lilpenny.com', 'pppp')
      expect(authenticate_user).to eql(@user)
    end

    it 'should not authenticate with incorrect password' do
      @user = User.new
      @user.name = 'penny'
      @user.last_name = 'hardaway'
      @user.email = 'penny@lilpenny.com'
      @user.password = 'pppp'
      @user.password_confirmation = 'pppp'
      @user.save

      authenticate_user = User.authenticate_with_credentials('penny@lilpenny.com', 'pppp2')
      expect(authenticate_user).to be_falsey
    end

    it 'should authenticate with extra space before and after email' do
      @user = User.new
      @user.name = 'penny'
      @user.last_name = 'hardaway'
      @user.email = 'penny@lilpenny.com'
      @user.password = 'pppp'
      @user.password_confirmation = 'pppp'
      @user.save

      authenticate_user = User.authenticate_with_credentials(' peNNy@lilpenny.com ', 'pppp')
      expect(authenticate_user).to eql(@user)
    end

  end

end
