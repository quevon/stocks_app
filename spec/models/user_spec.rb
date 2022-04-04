require 'rails_helper'

Rspec.describe User,type: :model do
    email 'validations' do
            it 'is a not valid user' do
                user = User.new
                user.email = 'test@email.com'

                expect(email).to_not be_valid
                expect(email.errors).to be_present
                expect(article.errors.to_hash.keys).to include(:email)
    end
end