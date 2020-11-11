require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録が成功する' do
    it '正しい情報を入力すればユーザー登録ができてトップページに遷移する' do
      # トップページに移動する
      visit root_path
      # トップページに新規登録画面へ遷移するボタンがあることを確認する
      expect(page).to have_content("新規登録")
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'メールアドレス', with: @user.email
      fill_in '氏名（フルネーム）', with: @user.name
      fill_in 'パスワード', with: @user.password
      fill_in 'パスワード（再入力）', with: @user.password_confirmation
      # 新規登録ボタンを押すとユーザーモデルのカウントが１UPすることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      # トップページに遷移する
      expect(current_path).to eq root_path
      # プルダウンメニューをクリックするととログアウトボタンが表示されることを確認する
      find('.btn').click
      expect(page).to have_content("ログアウト")
      # 新規登録画面へ遷移するボタンや、ログイン画面に遷移するボタンがないか確認する
      expect(page).to have_no_link('新規登録')
      expect(page).to have_no_link('ログイン')
    end

    it '誤った情報では新規登録が失敗し新規登録ページに留まる' do
      # トップページに移動する
      visit root_path
      # トップページに新規登録画面へ遷移するボタンがあることを確認する
      expect(page).to have_content("新規登録")
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'メールアドレス', with: ""
      fill_in '氏名（フルネーム）', with: ""
      fill_in 'パスワード', with: ""
      fill_in 'パスワード（再入力）', with: ""
      # 新規登録ボタンを押してもユーザーモデルのカウントが上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(0)
      # 新規ページに留まることを確認する
      expect(current_path).to eq "/users"
      # エラーメッセージが表示されることを確認する
      expect(page).to have_content("Email can't be blank")
      expect(page).to have_content("Password can't be blank")
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Name は全角で入力してください")
    end
  end
end
