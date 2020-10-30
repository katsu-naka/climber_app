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