FROM ruby:3.2

# 必要なパッケージのインストール
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && apt-get install -y nodejs yarn

# 作業ディレクトリを設定
WORKDIR /app

# 必要なファイルをコピー
COPY ./src /app

# Gemfile と Gemfile.lock をコピー
COPY ./src/Gemfile ./src/Gemfile.lock ./

# Bundlerを使って依存関係をインストール
RUN bundle install

# ポートを開放
EXPOSE 3000

# Railsアプリケーションを起動
CMD ["rails", "server", "-b", "0.0.0.0"]