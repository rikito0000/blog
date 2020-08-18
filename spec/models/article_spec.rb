require 'rails_helper'

RSpec.describe Article, type: :model do
     let!(:user)do
      User.create!({
      name: 'test',
      email: 'test@example.com',
      password: 'example'
     })
    end
    
  context 'タイトルと内容が入力されている場合' do 
    let!(:user)do
      User.create!({
      name: 'test',
      email: 'test@example.com',
      password: 'example'
     })
    end
    
    let!(:article) do 
      user.articles.build({
      title: Faker::Lorem.characters(number: 30),
      content: Faker::Lorem.characters(number: 255)
     })
    end
  
    
    it '記事を保存できる' do
      expect(article).to be_valid
   end
  end
  
  context 'タイトルの文字が90字の場合' do
     let!(:article) do 
      user.articles.create({
      title: Faker::Lorem.characters(number: 60),
      content: Faker::Lorem.characters(number: 255)
     })
    end
    
    it '記事を保存できない' do
      expect(article.errors.messages[:title][0]).to eq('is too long (maximum is 50 characters)')
    end
  end 
end

