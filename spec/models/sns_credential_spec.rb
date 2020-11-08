require 'rails_helper'

RSpec.describe SnsCredential, type: :model do
  describe 'SNSアカウントログイン' do
    before do
      @sns_credential = FactoryBot.build(:sns_credential)
    end

    context 'SNSアカウントでのログインが成功する' do
      it '全ての項目が正しく入力されているとログインに成功する' do
        expect(@sns_credential).to be_valid
      end
    end

    context 'SNSアカウントでのログインに失敗する' do
      it "providerが空だとログイン出来ない" do
        @sns_credential.provider = ""
        @sns_credential.valid?
        expect(@sns_credential.errors.full_messages).to include("Provider can't be blank")
      end
      it "uidが空だとログイン出来ない" do
        @sns_credential.uid = ""
        @sns_credential.valid?
        expect(@sns_credential.errors.full_messages).to include("Uid can't be blank")
      end
    end
  end
end
