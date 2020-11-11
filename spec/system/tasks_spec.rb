require 'rails_helper'

RSpec.describe "タスク投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @task = FactoryBot.create(:task)
  end

  context 'タスク投稿ができる時' do
    it 'ログインしたユーザーは新規投稿ができる' do
    # ログインする
    visit new_user_session_path
    fill_in 'メールアドレス', with: @user.email
    fill_in 'パスワード', with: @user.password
    find('input[name="commit"]').click
    # # 新規タスク作成ページへのリンクがあることを確認する
    expect(page).to have_content('新規タスク作成')
    # 新規タスク作成ページへ遷移する
    visit new_task_path
    # フォームに情報を入力する
    fill_in 'task_title', with: @task.title
    fill_in 'task_text', with: @task.text
    # 投稿ボタンをクリックするとTaskモデルのカウントが１Upすることを確認する
    expect{
      find('.new-submit-btn').click
    }.to change { Task.count }.by(1)
    # 投稿完了後トップページに自動遷移し投稿したタスクが存在することを確認する
    expect(page).to have_content(@task.title)
    end
  end
  context 'タスク投稿が失敗するとき' do
    it 'ログインしていないと新規登録ページに遷移できない' do
      #トップページに遷移する
      visit root_path
      # 新規投稿ページへのリンクがない
      expect(page).to have_no_content('新規タスク作成')
    end

    it 'タスク情報が正しく入力できていないと登録できない' do
      # ログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      find('input[name="commit"]').click
      # # 新規タスク作成ページへのリンクがあることを確認する
      expect(page).to have_content('新規タスク作成')
      # 新規タスク作成ページへ遷移する
      visit new_task_path
      # フォームに情報を入力する
      fill_in 'task_date', with: ""
      fill_in 'task_title', with: ""
      fill_in 'task_text', with: ""
      # 投稿ボタンをクリックしてもタスクが追加されずカウントUpしないことを確認する
      expect{
        find('.new-submit-btn').click
      }.to change { Task.count }.by(0)
      # 投稿に失敗し新規タスク作成ページに留まることを確認する
      expect(current_path).to eq "/tasks"
      # 必須入力項目であるdateとtitleが入力されていないエラー文が表示される
      expect(page).to have_content("Title can't be blank")
      expect(page).to have_content("Date can't be blank")
    end
  end
end
