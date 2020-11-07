# アプリケーション名

**Climber（クライマー）**

# アプリケーション概要

Climberはビジネスパーソンユースを想定した進捗管理用タスク管理アプリケーションとなります。  
Climberの特徴として、ユーザー同士でプロジェクトを作成する機能があります。メンバー同士はタスク内容や進捗状況の確認が可能となり、各メンバーの業務進捗状況をスムースに把握することが可能です。  
また、プロジェクトメンバーのタスクにはメッセージを送ることが可能です。タスクについてのアドバイスや質問、フィードバックなどのコミュニケーションを円滑に行うことができます。  
もちろん個人のタスク管理アプリとしても使用できます。

### ユーザー新規登録・ログイン機能

- Climberを利用するにはユーザ登録が必要です。
- 新規ユーザーはEmailもしくはSNSアカウント（Google）での登録が可能です。
- 登録、ログインが成功した場合はマイページへアクセス可能です。

### タスク作成・閲覧・管理機能

- ユーザーは日付を選択してタスクを作成することができます。
- マイページでは当日のタスクをリスト形式で確認することができます。
- マイページから各タスクは詳細を確認することができます。詳細ページでは既に作成したタスクの内容修正や削除を行うことができます。
- 完了したタスクは「完了」ボタンをクリックすることで「完了済」にすることができます。
- マイページで当日のタスクの総数・完了数・進捗率（％）を確認することができます。

### プロジェクト作成機能
- 登録しているユーザー同士でプロジェクトルームを作成することができます。
- プロジェクトメンバーのタスクは自由に閲覧したり、メッセージを送ることができます。
- 他メンバーのタスクは閲覧のみ可能です。タスク作成、編集、削除、進捗状況は本人しか変更できません。

### メッセージ機能
- プロジェクトメンバーのタスク詳細画面ではユーザー同士の交流が可能です。
- タスクについてのアドバイスや、質問などを行うことができます。

# Climberへアクセスする

Climberへは下記URLよりアクセス可能です。

[http://climber-app.org](http://climber-app.org)

※アクセス時のユーザー認証とテスト用ログインアカウントは下記をご参照ください。

# テストログイン用アカウント
- ユーザー認証が完了したらトップページ右上の「ログインしてプロジェクトに参加する」からログインしてください。  
- テスト用ログインアカウントでの操作が完了したらタスクボード右上のプルダウンメニューよりログアウトボタンをクリックしてログアウトしてください。

- ユーザー認証用ID、パスワード  

ユーザーID： admin  
パスワード： 2222  

- テスト用ログインアカウント

Email: test1@test.co.jp  
Password: test0001  
ユーザー名： テスト一郎  

# アプリの使用方法

アプリの使用方法については、下記の利用説明を参考にしてください。  
※説明中に使用している画像はアプリのアップデート等により実際の画面とは若干異なる場合が御座います。

### ログイン／ログアウト
- [http://climber-app.org](http://climber-app.org)へアクセスしてください。  
- ユーザー認証を求められたら、上記に記載した認証IDとパスワードを入力してください。
- ログイン操作
![climber-info](https://user-images.githubusercontent.com/71310171/98444182-af2e9580-2153-11eb-916e-5232641dba30.jpg)
![sign-in_form](https://user-images.githubusercontent.com/71310171/98444186-b8b7fd80-2153-11eb-9d53-aeade882c9ef.jpg)
![sign-in_success](https://user-images.githubusercontent.com/71310171/98444191-be154800-2153-11eb-8107-4782aac9cd8b.jpg)
- ログアウト操作
![sign-out](https://user-images.githubusercontent.com/71310171/98444193-c077a200-2153-11eb-9766-d8fa5afb9fc4.jpg)
### 新規タスクを作成する
- 新規タスク作成操作
![new-task-top](https://user-images.githubusercontent.com/71310171/98444354-94105580-2154-11eb-87f7-1f8e0e4f6602.jpg)
![new-task-form](https://user-images.githubusercontent.com/71310171/98444357-970b4600-2154-11eb-8fae-4c2f7dd87508.jpg)
![new-task-success](https://user-images.githubusercontent.com/71310171/98444359-983c7300-2154-11eb-8b8b-8c8b5abc9d2f.jpg)
### タスク詳細確認と編集、削除機能
- タスク詳細表示操作
![show-top](https://user-images.githubusercontent.com/71310171/98444657-40067080-2156-11eb-9e56-7ad0ed5a3fb0.jpg)
![task-show](https://user-images.githubusercontent.com/71310171/98444665-4d235f80-2156-11eb-8afa-0483b5e0406a.jpg)
- タスク編集操作
![edit](https://user-images.githubusercontent.com/71310171/98444672-5280aa00-2156-11eb-9a8f-dc91405e9d27.jpg)
![edit-success](https://user-images.githubusercontent.com/71310171/98444669-50b6e680-2156-11eb-9ef5-48af9270c3c5.jpg)
### タスクボードその他の機能

### プロジェクトを作成する

### プロジェクトメンバーのタスクを閲覧する

### メッセージを送る

### お問い合わせフォームについて

# テーブル設計
![climber-er-map](https://user-images.githubusercontent.com/71310171/98438581-8647d980-212e-11eb-9e69-0f28d6063d06.png)
