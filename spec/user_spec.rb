require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it 'creates user if all feilds are filled properly' do
      @user = User.new
      @user.first_name = "Bob"
      @user.last_name = "Test"
      @user.email = "bob_test@test.com"
      @user.password = "test_pass1"
      @user.password_confirmation = "test_pass1"

      expect(@user).to be_valid
    end

    it 'does not create user without a first name' do
      @user = User.new
      @user.first_name = nil
      @user.last_name = "Test"
      @user.email = "bob_test@test.com"
      @user.password = "test_pass1"
      @user.password_confirmation = "test_pass1"

      expect(@user).to_not be_valid
    end

    it 'does not create user without a last name' do
      @user = User.new
      @user.first_name = "Bob"
      @user.last_name = nil
      @user.email = "bob_test@test.com"
      @user.password = "test_pass1"
      @user.password_confirmation = "test_pass1"

      expect(@user).to_not be_valid
    end

    it 'does not create user  without an email' do
      @user = User.new
      @user.first_name = "Bob"
      @user.last_name = "Test"
      @user.email = nil
      @user.password = "test_pass1"
      @user.password_confirmation = "test_pass1"

      expect(@user).to_not be_valid
    end

    it 'does not create user without a password' do
      @user = User.new
      @user.first_name = "Bob"
      @user.last_name = "Test"
      @user.email = "bob_test@test.com"
      @user.password = nil
      @user.password_confirmation = "test_pass1"

      expect(@user).to_not be_valid
    end

    it 'does not create user  without confirming the password' do
      @user = User.new
      @user.first_name = "Bob"
      @user.last_name = "Test"
      @user.email = "bob_test@test.com"
      @user.password = "test_pass1"
      @user.password_confirmation = nil

      expect(@user).to_not be_valid
    end

    it 'does not create user if password and password confirmation does not match' do
      @user = User.new
      @user.first_name = "Bob"
      @user.last_name = "Test"
      @user.email = "bob_test@test.com"
      @user.password = "test_pass1"
      @user.password_confirmation = "test_pass"

      expect(@user).to_not be_valid
    end

    it 'does not create user if password and password confirmation does not match' do
      @user = User.new
      @user.first_name = "Bob"
      @user.last_name = "Test"
      @user.email = "bob_test@test.com"
      @user.password = "test"
      @user.password_confirmation = "test"

      expect(@user).to_not be_valid
    end

    it 'does not create user if email is not unique' do
      @user = User.new
      @user.first_name = "Bob"
      @user.last_name = "Test"
      @user.email = "bob_test@test.com"
      @user.password = "test_pass1"
      @user.password_confirmation = "test_pass1"
      @user.password_digest = "test_pass1"

      @user2 = User.new
      @user2.first_name = "Alice"
      @user2.last_name = "Test"
      @user2.email = "boB_TeSt@test.com"
      @user2.password = "test_pass1"
      @user2.password_confirmation = "test_pass1"
      @user2.password_digest = "test_pass1"

      expect(@user2).to_not be_valid
      expect(@user).to be_valid
    end


  end

  describe '.authenticate_with_credentials' do
      it 'returns user if succesfully authenticated' do
        user = User.authenticate_with_credentials('bones@gamil.com', '888')
        expect(subject).eql? user
      end

      it 'returns nil if not successfully authenticated' do
        user = User.authenticate_with_credentials('bones@gamil.com', 'ggg')
        expect(user).eql? nil
      end

      it 'authenticates and users if user type white space before / after email' do
        user = User.authenticate_with_credentials(' bones@gamil.com ', '888')
        expect(subject).eql? user
      end

      it 'authenticates and users if users type lower and upper case in email' do
        user = User.authenticate_with_credentials('boNes@gAmil.com', '888')
        expect(subject).eql? user
      end
  end

end
