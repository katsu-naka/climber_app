require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  describe '問い合わせ送信' do
    before do
      @inquiry = FactoryBot.build(:inquiry)
    end

    context '問い合わせ送信が成功する' do
      it "nameとtextが入力されていれば送信できる" do
        expect(@inquiry).to be_valid
      end
    end

    context '問い合わせ送信が失敗する' do
      it "nameが空だと送信出来ない" do
        @inquiry.name = ""
        @inquiry.valid?
        expect(@inquiry.errors.full_messages).to include("Name can't be blank")
      end
      it "textが空だと送信出来ない" do
        @inquiry.text = ""
        @inquiry.valid?
        expect(@inquiry.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end
