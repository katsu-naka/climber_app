require 'rails_helper'

# RSpec.describe "タスク投稿", type: :system do
#   before do
#     @user = FactoryBot.create(:user)
#     @task = FactoryBot.create(:task)
#   end

#   context 'タスク投稿ができる時' do
#     it 'ログインしたユーザーは新規投稿ができる' do
#     # ログインする
#     visit new_user_session_path
#     fill_in 'メールアドレス', with: @user.email
#     fill_in 'パスワード', with: @user.password
#     find('input[name="commit"]').click
#     # # 新規タスク作成ページへのリンクがあることを確認する
#     expect(page).to have_content('新規タスク作成')
#     # 新規タスク作成ページへ遷移する
#     visit new_task_path
#     # フォームに情報を入力する
#     fill_in 'task_title', with: @task.title
#     fill_in 'task_text', with: @task.text
#     # 投稿ボタンをクリックするとTaskモデルのカウントが１Upすることを確認する
#     expect{
#       find('.new-submit-btn').click
#     }.to change { Task.count }.by(1)
#     # 投稿完了後トップページに自動遷移し投稿したタスクが存在することを確認する
#     expect(page).to have_content(@task.title)
#     end
#   end
#   context 'タスク投稿が失敗するとき' do
#     it 'ログインしていないと新規登録ページに遷移できない' do
#       #トップページに遷移する
#       visit root_path
#       # 新規投稿ページへのリンクがない
#       expect(page).to have_no_content('新規タスク作成')
#     end
#     it 'タスク情報が正しく入力できていないと登録できない' do
#       # ログインする
#       visit new_user_session_path
#       fill_in 'メールアドレス', with: @user.email
#       fill_in 'パスワード', with: @user.password
#       find('input[name="commit"]').click
#       # # 新規タスク作成ページへのリンクがあることを確認する
#       expect(page).to have_content('新規タスク作成')
#       # 新規タスク作成ページへ遷移する
#       visit new_task_path
#       # フォームに情報を入力する
#       fill_in 'task_date', with: ""
#       fill_in 'task_title', with: ""
#       fill_in 'task_text', with: ""
#       # 投稿ボタンをクリックしてもタスクが追加されずカウントUpしないことを確認する
#       expect{
#         find('.new-submit-btn').click
#       }.to change { Task.count }.by(0)
#       # 投稿に失敗し新規タスク作成ページに留まることを確認する
#       expect(current_path).to eq "/tasks"
#       # 必須入力項目であるdateとtitleが入力されていないエラー文が表示される
#       expect(page).to have_content("Title can't be blank")
#       expect(page).to have_content("Date can't be blank")
#     end
#   end
# end

# RSpec.describe 'タスク編集', type: :system do
#   before do
#     @task1 = FactoryBot.create(:task)
#   end
#   context "タスクの編集が成功する" do
#     it 'ログインしたユーザーは自分が投稿したタスクの編集ができる' do
#       # タスク１を投稿したユーザーでログインする
#       visit new_user_session_path   
#       fill_in 'メールアドレス', with: @task1.user.email
#       fill_in 'パスワード', with: @task1.user.password
#       find('input[name="commit"]').click
#       expect(current_path).to eq root_path
#       # タスク一覧のツイート１に詳細ボタンがあることを確認する
#       expect(page).to have_link("詳細"), href: task_path(@task1)
#       # タスク１詳細ページへ遷移する
#       visit task_path(@task1)
#       # タスク１詳細ページに編集ボタンがあることを確認する
#       expect(page).to have_link("編集"), href: edit_task_path(@task1)
#       # 編集ページへ遷移する
#       visit edit_task_path(@task1)
#       # 既に投稿済みのタスク内容がフォームに入っていることを確認する
#       expect(
#         find('#task_title').value
#       ).to eq @task1.title
#       expect(
#         find('#task_text').value
#       ).to eq @task1.text
#       # タスク内容を編集する
#       fill_in 'task_title', with: "#{@task1.title}+編集したタイトル"
#       fill_in 'task_text', with: "#{@task1.text}+編集したテキスト"
#       # 編集してもTaskモデルのカウントが変わらないことを確認する
#       expect{
#         find('input[name="commit"]').click
#       }.to change { Task.count }.by(0)
#       # 更新後再度タスク１詳細ページに遷移する
#       expect(current_path).to eq task_path(@task1)
#       # 詳細ページの内容が更新されていることを確認する
#       expect(page).to have_content("#{@task1.title}+編集したタイトル")
#       expect(page).to have_content("#{@task1.text}+編集したテキスト")
#       # トップページに遷移する
#       visit root_path
#       # トップページに先ほど更新した内容のタスクが存在することを確認する
#       expect(page).to have_content("#{@task1.title}+編集したタイトル")
#     end
#   end
#   context "タスクの編集が失敗する" do
#     it 'ログインしていないとツイートの編集画面に遷移できない' do
#       # トップページに遷移する
#       visit root_path
#       # 編集ボタンがないことを確認
#       expect(page).to have_no_link("編集"), href: edit_task_path(@task1)
#       # 直接パスを打ち込んでもページ遷移しないことを確認
#       visit edit_task_path(@task1)
#       # ログイン画面に戻されたことを確認
#       expect(page).to have_selector('.devise-submit-btn')
#     end
#   end
# end