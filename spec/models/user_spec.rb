# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
	
require 'spec_helper'

describe User do
	
	before(:each) do
		@attr = {name:"Example Name",email:"example@mail.ru"}
	end
	  
	it "should create a new instance given valid attributes" do
		User.create!(@attr)
	end
	
	it "should require a name" do
		no_name_user = User.new(@attr.merge(name:""))
	  	no_name_user.should_not be_valid
	end
		
	it "should reject names that are too long" do
		long_name_user = User.new(@attr.merge(name:"a"*51))
	  	long_name_user.should_not be_valid
	end
			
	it "should require an email" do
		no_email_user = User.new(@attr.merge(email:""))
	  	no_email_user.should_not be_valid
	end
	
	it "should accept valid email" do
		adr = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
		adr.each do |i|
			valid_email_user = User.new(@attr.merge(email:i))
     		valid_email_user.should be_valid
		end
	end	
	
	it "should reject invalid email" do
		adr = %w[user@foo,com user_at_foo.org example.user@foo.]
		adr.each do |i|
			invalid_email_user = User.new(@attr.merge(email:i))
     		invalid_email_user.should_not be_valid
		end
	end
	
	it "should reject duplicate email" do
		User.create!(@attr)
		user_with_duplicate_email = User.new(@attr)
    	user_with_duplicate_email.should_not be_valid
	end
	
	it "should reject email adress with uppercase" do
		upcased_email = @attr[:email].upcase
		User.create!(@attr.merge(:email => upcased_email))
    	user_with_duplicate_email = User.new(@attr)
    	user_with_duplicate_email.should_not be_valid
	end	
	
	
end
