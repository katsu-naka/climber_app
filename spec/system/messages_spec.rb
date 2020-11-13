require 'rails_helper'

RSpec.describe "メッセージ送信機能", type: :system do
  before do
    @task = FactoryBot.create(:task)
    @message = FactoryBot.build(:message)
  end
  context "メッセージが送信できる" do
    it "ログインユーザーはタスク詳細画面からメッセージの送信ができる" do
      #ログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @task.user.email
      fill_in 'パスワード', with: @task.user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path
      # タスク一覧画面に既に存在するタスクに詳細ボタンが存在するか確認する
      expect(page).to have_link('詳細'), href: task_path(@task)
      # 詳細ページに遷移する
      visit task_path(@task)
      # 詳細ページにメッセージフォームが存在するか確認する
      expect(page).to have_selector('.message-text-form')
      # メッセージフォームを入力する
      fill_in 'メッセージを入力', with: @message.message
      # メッセージを送信するとMessageモデルのカウントが１Upすることを確認する
      find('.message-submit-btn').click
      # 送信したメッセージがコメント欄に存在するか確認する
      expect(page).to have_content("#{@message.message}")
    end
  end
  context "メッセージが送信できない" do
    it 'ログインしていないとタスク詳細画面に遷移できずメッセージを送信できない' do
      # トップページに移動する
      visit root_path
      # トップページに詳細ボタンがないことを確認する
      expect(page).to have_no_link("詳細"), href: task_path(@task)
      # 直接URLにパスを打ち込んでも詳細画面に遷移できないことを確認する
      visit task_path(@task)
      # ログイン画面に遷移することを確認する
      expect(page).to have_selector('.devise-submit-btn')
    end
  end
end
