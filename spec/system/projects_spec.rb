require 'rails_helper'

RSpec.describe "プロジェクト作成", type: :system do
  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @task1 = FactoryBot.create(:task)
    @task2 = FactoryBot.create(:task)
    @project = FactoryBot.build(:project)
  end
  context 'プロジェクト作成ができる時' do
    it 'ログインユーザーはプロジェクトを作成することができる' do
      #タスク１ユーザーでログインする
      visit new_user_session_path
      fill_in 'メールアドレス', with: @task1.user.email
      fill_in 'パスワード', with: @task1.user.password
      find('input[name="commit"]').click
      # トップページにプロジェクト選択ボタンが存在することを確認する
      expect(page).to have_link('プロジェクト選択')
      # プロジェクト一覧画面に遷移する
      visit projects_path
      # プロジェクト作成ボタンが存在することを確認する
      expect(page).to have_link('プロジェクト作成')
      # プロジェクト作成画面に遷移することを確認する
      visit new_project_path
      # プロジェクト名のフォームを入力する
      fill_in 'project_project_name', with: "テストルーム"
      # ユーザーを選択する
      select 'テスト太郎', form: 'project_project_name'
      # find('name="project[user_ids][]"').click
      binding.pry
      # 作成ボタンをクリックするとProjectモデルのカウントが１Upすることを確認する
      # 作成完了後プロジェクト一覧ページに遷移して作成したプロジェクトが存在することを確認する
    end
  end
  context 'プロジェクト作成ができない時' do
    it 'ログインしていないとプロジェクト作成画面に遷移できない' do
    end
    it 'プロジェクト情報が正しく入力できていないと作成できない' do
    end
  end
end
