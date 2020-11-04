# アプリケーション名

**Climber（クライマー）**

# アプリケーション概要

- Climberはビジネスパーソンユースを想定した進捗管理用タスク管理アプリケーションとなります。
- Climberの特徴として、ユーザー同士でプロジェクトを作成する機能があります。メンバー同士はタスク内容や進捗状況の確認が可能となり、各メンバーの業務進捗状況をスムースに把握することが可能です。
- また、プロジェクトメンバーのタスクにはメッセージを送ることが可能です。タスクについてのアドバイスや質問、フィードバックなどのコミュニケーションを円滑に行うことができます。
- もちろん個人のタスク管理アプリとしても使用できます。

## ユーザー新規登録・ログイン機能

- Climberを利用するにはユーザ登録が必要です。
- 新規ユーザーはEmailもしくはSNSアカウント（Facebook、Google）での登録が可能です。
- 登録、ログインが成功した場合はマイページへアクセス可能です。

## タスク作成・閲覧・管理機能

- ユーザーは日付を選択してタスクを作成することができます。
- マイページでは当日のタスクをリスト形式で確認することができます。
- マイページから各タスクは詳細を確認することができます。詳細ページでは既に作成したタスクの内容修正や削除を行うことができます。
- 完了したタスクは「完了」ボタンをクリックすることで「完了済」にすることができます。
- マイページで当日のタスクの総数・完了数・進捗率（％）を確認することができます。

## プロジェクト作成機能
- 登録しているユーザー同士でプロジェクトルームを作成することができます。
- プロジェクトメンバーのタスクは自由に閲覧したり、メッセージを送ることができます。
- 他メンバーのタスクは閲覧のみ可能です。タスク作成、編集、削除、進捗状況は本人しか変更できません。

## メッセージ機能
- プロジェクトメンバーのタスク詳細画面ではユーザー同士の交流が可能です。
- タスクについてのアドバイスや、質問などを行うことができます。

# Climberへアクセスする

- Climberへは下記URLよりアクセス可能です。
coming soon  
※アクセス時のユーザー認証とテスト用ログインアカウントは下記をご参照ください。

# テストログイン用アカウント

- ユーザー認証用ID、パスワード  

ユーザーID： admin  
パスワード： 2222  

- テストログイン用アカウント①

Email: test1@test.co.jp  
Password: test0001
ユーザー名： テスト一郎  
※ユーザー名はログイン後にマイページに表示される名前です。

- テストログイン用アカウント②

Email: test2@test.co.jp  
Password: test0002  
ユーザー名： テスト二郎  
※ユーザー名はログイン後にマイページに表示される名前です.  
※コメント機能などの操作確認にはテスト用ログインアカウント②でのタスク作成が必要です。

# テーブル設計

## usersテーブル

| Column    | Type   | Options    |
| --------- | ------ | ---------- |
| email     | string | null false |
| password  | string | null false |
| name      | string | null false |

### Association

- has_many :tasks
- has_many :messages
- has_many :projects
- has_many :project_users

## tasksテーブル

| Column | Type       | Options                     |
| ------ | ---------- | --------------------------- |
| title  | string     | null false                  |
| text   | text       |                             |
| date   | date       | null false                  |
| done   | integer    | null false                  |
| user   | references | null false,foreign_key:true |

### Association

- belongs_to :user
- has_many :messages

## messagesテーブル

| Column  | Type       | Options                     |
| ------- | ---------- | --------------------------- |
| message | text       | null false                  |
| user    | references | null false,foreign_key:true |
| task    | references | null false,foreign_key:true |

### Association

- belongs_to :user
- belongs_to :task

## projectsテーブル

| Column       | Type   | Options    |
| ------------ | ------ | ---------- |
| project_name | string | null false |

### Association

- has_many :project_users
- has_many :users

## project_userテーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| project | references | foreign_key: true |
| user    | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :project