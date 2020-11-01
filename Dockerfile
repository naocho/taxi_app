FROM ruby:2.6.5
# Dockerイメージビルド時に、Dockerコンテナ内で実行するコマンドを定義
RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
                       libpq-dev \        
                       nodejs           

# 作業ディレクトリの作成
# 多分ここのディレクトリの作成の記述が間違っている気がする。
RUN taxi_app
# Dockerfileをもとに生成したDockerコンテナ内で使える環境変数を指定
ENV taxi_app
WORKDIR $taxi_app

# ホストからGemfileをコンテナ上にコピー
ADD ./Gemfile $taxi_app/Gemfile
ADD ./Gemfile.lock $taxi_app/Gemfile.lock

# Gemfileをbundle install
RUN bundle install
ADD . $taxi_app