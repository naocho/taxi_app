require 'rails_helper'
describe Taxi, type: :model do
  before do
    @taxi = FactoryBot.build(:taxi)
    @taxi.image = fixture_file_upload('app/assets/images/taku2.png')
    end

  describe '投稿機能' do
    context '投稿機能がうまくいくとき' do
      it "カラムが全て存在すれば登録できる" do
        expect(@taxi).to be_valid
      end
      it "URLがある" do
        @taxi.departure  = "https://businesspress.jp/theme/document/#static-page"
        expect(@taxi).to be_valid
      end
      it "一言コメント" do
        @taxi.arrival = "マジ直まじ"
        expect(@taxi).to be_valid
      end
      it "タイトルの記述がある" do
        @taxi.title  = "マジ直まじ"
        expect(@taxi).to be_valid
      end
      it "詳細の記述がある" do
        @taxi.text  = "マジ直まじか"
        expect(@taxi).to be_valid
      end
    end

    context '投稿が上手く行かない時' do
  
      it "URLが必須" do
        @taxi.departure = nil
        @taxi.valid?
        expect(@taxi.errors.full_messages).to include("Departure can't be blank")
      end

      it "入力が英字である時" do
        @taxi.departure = "aaaaaaaaa"
        @taxi.valid?
        expect(@taxi.errors.full_messages).to include("Departure ちゃんとURLを入力してください。")
      end

      it "入力が平仮名である時" do
        @taxi.departure = "tyannt"
        @taxi.valid?
        expect(@taxi.errors.full_messages).to include("Departure ちゃんとURLを入力してください。")
      end

      it "コメントの入力がない" do
        @taxi.arrival= nil
        @taxi.valid?
        expect(@taxi.errors.full_messages).to include("Arrival can't be blank")
      end

      it "英字は登録出来ない" do
        @taxi.arrival= "aaaaa"
        @taxi.valid?
        expect(@taxi.errors.full_messages).to include("Arrival コメントは9文字ま")
      end

      it "タイトルがない" do
        @taxi.title = nil
        @taxi.valid?
        expect(@taxi.errors.full_messages).to include("Title can't be blank")
      end

      it "英字は登録出来ない" do
        @taxi.title = "aaaaaa"
        @taxi.valid?
        expect(@taxi.errors.full_messages).to include("Title タイトルは7文字まで")
      end

      it "詳細がない時" do
        @taxi.text = nil
        @taxi.valid?
        expect(@taxi.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end