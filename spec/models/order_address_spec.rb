require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '住所情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address, user_id: user.id)
    end

    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        
      end
      it 'building_nameは空でも保存できること' do
        
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが体と保存できないこと' do
        
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do

      end
      it 'prefectureを選択していないと保存できないこと' do

      end
      it 'cityが空だと保存できないこと' do

      end
      it 'address1が空だと保存できないこと' do

      end
      it 'phone_numberが空だと保存できないこと' do

      end
    end
  end
end
