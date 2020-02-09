# README

## 積読とは？
未読の本を積んだままにしている状態のこと。

## 作成概要
下記条件を満たした仕組みのアプリを作ることで、読書アウトプットによるスキルアップを図ることを目的としたアプリ。
・読書の習慣化 × アウトプットの習慣化の仕組み<br>
・ウェアラブル性<br>

## 作成背景
・「レバレッジ・リーディング」（著：本田 直之 氏）より、読書を目的とせずに目的のための読書にして、埋もれる読書から自分に生かしていく読書にしていくべきであるとの考えから、アウトプットメモを作ろうと思ったのがきっかけです。

## Requirement
・ruby ：2.5.1<br>
・rails：5.2.3<br>

## E-R図
<img width="600" alt="tsundoku" src="https://gyazo.com/bc7d2dd3e44a8d3af582a30c1dcdedad.png">

# Userテーブル
|カラム名|タイプ|オプション|
|--|--|--|
| name      | string | null: false |
| email     | string | null: false, unique: true |
| password  | string | null: false |
| nickname  | string | null: false, unique: true |

### Association
- has_many : book
- has_many : comment

---
## Bookテーブル
|カラム名|タイプ|オプション|
|--|--|--|
| title   | string | null: false |
| content | text   | null: false |
| user_id | references | null: false, foreign_key: true |

### Association
- has_many   : tags
- has_many   : comments
- belongs_to : user

---
## Commentテーブル
|カラム名|タイプ|オプション|
|--|--|--|
| content  | string | null: false |
| user_id  | references | null: false, foreign_key: true |
| book_id  | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :book

---
## Tagテーブル
|カラム名|タイプ|オプション|
|--|--|--|
| tag      | string | null: false |
| tweet_id | references | null: false, foreign_key: true |

### Association
- belongs_to :book