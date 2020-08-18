require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'タイトルと内容が入力されている場合' do 
    before do
      user = User.create!({
      name: 'test',
      email: 'test@example.com',
      password: 'example'
     })
      @article = user.articles.build({
      title: Faker::Lorem.characters(number: 10),
      content: Faker::Lorem.characters(number: 300)
     })
    end
    
    it '記事を保存できる' do
    
   end
  end
end
