require 'rails_helper'

RSpec.describe Article, type: :model do
  let!(:user) { create(:user) } #factory_botでダミーデータ(user)を生成している
  
  context 'タイトルと本文が入力されている場合' do 

    let!(:article) { build(:article, user: user) }
    
    
    it '記事を保存できる' do
      expect(article).to be_valid
    end
  end
  
  context 'タイトルの文字が100字の場合' do
     let!(:article) { build(:article, title: Faker::Lorem.characters(number: 100), user: user)}
    
    before do
      article.save
    end
    
    it '記事を保存できない' do
      expect(article.errors.messages[:title][0]).to eq('は50文字以内で入力してください')
    end
  end 
end
