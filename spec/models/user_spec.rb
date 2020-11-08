require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録が成功する' do
        it "全ての項目が正しく入力されていると登録できる" do
          expect(@user).to be_valid
        end
        it "nameが全角文字だと登録できる" do
          @user.name = "テスト一郎"
          expect(@user).to be_valid
        end
        it 'emailに@が存在すれば登録できる' do
          @user.email = 'aaa@aaa'
          expect(@user).to be_valid
        end
        it "passwordが6文字以上であれば登録できる" do
          @user.password = 'aaaaaa1'
          @user.password_confirmation = 'aaaaaa1'
          expect(@user).to be_valid
        end
      end
    end

    context 'ユーザー登録が失敗する' do
      it 'nameが空だと登録出来ない' do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it "nameが全角文字以外だと登録出来ない" do
        @user.name = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name は全角で入力してください")
      end
      it "emailが空では登録出来ない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに＠がなければ登録できない' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合は登録出来ない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録出来ない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下だと登録出来ない" do
        @user.password = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password", "Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録出来ない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
