# DB設計

# users テーブル
| Column              | Type     | Options                   |
| ------------------- | -------- | ------------------------- |
| email               | string   | null: false, unique: true |
| encrypted_password  | string   | null: false               |
| nickname            | string   | null: false               |

### Association

- has_many :ranking_users
- has_many :ranking, through: ranking_users
- has_many :votes

# rankings テーブル
| Column     | Type          | Options     |
| ---------- | ------------- | ----------- |
| title      | string        | null: false |
| category   | string        |             |
| choice     | string        | null: false |

### Association
- has_many :ranking_users
- has_many :users, through: ranking_users
- has_many :votes

# ranking_users テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| ranking     | references | null: false, foreign_key: true |

### Association
- belongs_to :ranking
- belongs_to :user

# votes テーブル
| Column      | Type          | Options     |
| ----------  | ------------- | ----------- |
| vote        | string        | null: false |
| user        | references    | null: false, foreign_key: true |
| ranking     | references    | null: false, foreign_key: true |

### Association
- belongs_to :ranking
- belongs_to :user