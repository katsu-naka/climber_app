# アプリケーション名

Climber（クライマー）

# アプリケーション概要

・Climberはビジネスパーソン向けのタスク管理アプリケーションとなります。
・個人のタスク管理のほか、ユーザー同士でプロジェクトを作成して互いのタスクを確認したり、コメント機能でアドバイスや質問などを行うことができます。
・

## ユーザー新規登録・ログイン機能

・Climberを利用するにはユーザ登録が必要です。
・新規ユーザーはEmailもしくはSNSアカウント（Facebook、Google）での登録が可能です。
・登録、ログインが成功した場合はマイページへアクセス可能です。

## タスク作成・閲覧・管理機能

・ユーザーは日付を選択してタスクを作成することができます。
・マイページでは当日のタスクをリスト形式で確認することができます。
・マイページから各タスクは詳細を確認することができます。詳細ページでは既に作成したタスクの内容修正や削除を行うことができます。
・完了したタスクは「完了」ボタンをクリックすることで「完了済」にすることができます。
・マイページで当日のタスクの総数・完了数・進捗率（％）を確認することができます。

## プロジェクト作成機能
・登録しているユーザー同士でプロジェクトルームを作成することができます。
・プロジェクトメンバーのタスクは自由に閲覧することができます。
・他メンバーのタスクは閲覧のみ可能です。タスク作成、編集、削除、進捗状況は本人しか変更できません。

## メッセージ機能
・各ユーザーのタスク詳細画面ではユーザー同士の交流が可能です。
・タスクについてのアドバイスや、質問などを行うことができます。

# テーブル設計

## usersテーブル

| Column    | Type   | Options    |
| --------- | ------ | ---------- |
| email     | string | null false |
| password  | string | null false |
| name      | string | null false |

### Association

has_many :tasks
has_many :messages
has_many :projects
has_many :project_users

## tasksテーブル

| Column | Type       | Options                     |
| ------ | ---------- | --------------------------- |
| title  | string     | null false                  |
| text   | text       |                             |
| date   | date       | null false                  |
| done   | integer    | null false                  |
| user   | references | null false,foreign_key:true |

### Association

belongs_to :user
has_many :messages

## messagesテーブル

| Column  | Type       | Options                     |
| ------- | ---------- | --------------------------- |
| message | text       | null false                  |
| user    | references | null false,foreign_key:true |
| task    | references | null false,foreign_key:true |

### Association

belongs_to :user
belongs_to :task

## projectsテーブル

| Column       | Type   | Options    |
| ------------ | ------ | ---------- |
| project_name | string | null false |

### Association

has_many :project_users
has_many :users

## project_userテーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| project | references | foreign_key: true |
| user    | references | foreign_key: true |

### Association

belongs_to :user
belongs_to :project