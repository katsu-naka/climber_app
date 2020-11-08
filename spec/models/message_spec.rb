require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'メッセージ送信' do
    before do
      @message = FactoryBot.build(:message)
    end

    context 'メッセージ送信が成功する' do
      it "全ての項目が正しく入力されていれば送信できる" do
        expect(@message).to be_valid
      end
    end

    context 'メッセージ送信が失敗する' do
      it "messageが空だと送信出来ない" do
        @message.message = ""
        @message.valid?
        expect(@message.errors.full_messages).to include("Message can't be blank")
      end
      it "nameが空だと送信出来ない" do
        @message.name = ""
        @message.valid?
        expect(@message.errors.full_messages).to include("Name can't be blank")
      end
      it "datetimeが空だと送信出来ない" do
        @message.datetime = ""
        @message.valid?
        expect(@message.errors.full_messages).to include("Datetime can't be blank")
      end
    end
  end
end
