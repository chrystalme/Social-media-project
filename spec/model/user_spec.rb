require 'rails_helper'

RSpec.describe User, type: 'model' do
  let(:user) {User.new(email: 'chrys.afam@now.com', name: 'Chrys')}
  let(:posts_1) {Post.new(content: 'New Post body')}
  let(:posts_2) {Post.new(content: 'Second Post body')}

    describe 'association' do
    let(:user) {User.new(email: 'chrys.afam@now.com', name: 'Chrys')}
    it 'has many posts'
    expect(user).to respond_to(:posts)
  end
end