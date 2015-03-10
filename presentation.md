# AWS CLI を使ってみよう
# (*ﾟ∀ﾟ)ノ

---

# 実行環境を作りましょう

---

# 今回の実行環境
- OS
Red Hat Enterprise Linux 7.0 (HVM)
- Instance Type
t2.micro

---

# 前準備

---

# 時刻設定
- 現状の確認
$ date
2014年 12月 14日 日曜日 20:25:24 EST

## ESTなので日本時間では無いことが確認できました。必要に応じて日本時間を適用させましょう

---

- 時刻設定のシンボリックリンクを修正
$ ls -l /etc/localtime
lrwxrwxrwx. 1 root root 38 10月 17 14:38/etc/localtime-> ../usr/share/zoneinfo/America/New_York
$ sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
$ ls -l /etc/localtime
lrwxrwxrwx. 1 root root 30 12月 15 11:34/etc/localtime-> /usr/share/zoneinfo/Asia/Tokyo


---

- 修正後の確認
$ date
2014年 12月 15日 月曜日 11:39:58 JST

## JSTになっていることを確認∠( ﾟдﾟ)／

---


# 実準備！

---

###  今回インストールするもの一覧

- zlib-devel
- openssl-devel
- gcc
- wget
- Python3
- pip
- AWS CLI

---

- zlib-develのインストール
$ sudo yum install zlib-devel

- openssl-develのインストール
$ sudo yum install openssl-devel


- gccのインストール
$ sudo yum install gcc

- wgetのインストール
$ sudo yum install wget

---

### Python3 のインストール

- ファイルの用意
$ cd /usr/local/src
$ sudo wget https://www.python.org/ftp/python/3.3.6/Python-3.3.6.tgz
$ sudo tar -zxvf Python-3.3.6.tgz
$ cd Python-3.3.6

---

- インストールディレクトリを指定してmake install
$ sudo ./configure --prefix=/opt/python3.3.6
$ sudo make
$ sudo make install


(詳細はこちら)
http://docs.aws.amazon.com/cli/latest/userguide/installing.html#install-with-pip

---

- pipインストール(pythonのパッケージ管理ツール)
$ curl -kL https://raw.github.com/pypa/pip/master/contrib/get-pip.py | sudo /opt/python3.3.6/bin/python3

---

- AWS CLI をインストール
$ sudo /opt/python3.3.6/bin/pip3 install awscli

---

- aws cli を実行するユーザやリージョンを設定
$ /opt/python3.3.6/bin/aws configure
AWS Access Key ID [None]: 
AWS Secret Access Key [None]: 
Default region name [None]: ap-northeast-1
Default output format [None]: json

- 必要に応じてpython3 のPATHを追加
$ export PATH=/opt/python3.3.6/bin:$PATH

---

# 環境構築完了
## ／＾o＾＼ﾌｯｼﾞｻｰﾝ

---

- aws cli を実際に動かしてみましょう
$ /opt/python3.3.6/bin/aws ec2 describe-instances

---
# 　　
##   　　　ずらずらと情報が表示されれば成功！！
                               ＼　　　　　　　　　　　　　　　　(／o^)　　　　　　　　　　　　　　( ／　　　　　　　　　　　　　　／ く 　

---

## あとはリファレンスで確認しながら
## 好きなコマンドを実行
### http://docs.aws.amazon.com/cli/latest/index.html

---

## ex) redshift でクラスタを作成するのであれば、下記の手順でリファレンスが見れるので、そのとおりに実行

1. redshift を選択
2. create-cluster を選択

---

- クラスタ名:hoge
- クラスタイプ：シングル
- ノードタイプ：dw2.large（一番安いやつ）

$ aws redshift create-cluster --cluster-identifier <value> --cluster-type single-node --node-type dw2.large --master-username hogehoge --master-user-password fugafuga

---


もちろん各パラメタについては理解してから使いましょう
日本語ドキュメントとかもあるので活用しましょ(*ﾟ∀ﾟ)

http://docs.aws.amazon.com/ja_jp/redshift/latest/mgmt/managing-clusters-console.html

---

# おしまい＼(^o^)／

---
