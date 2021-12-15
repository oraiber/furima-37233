require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it '全てが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'first_name半角文字が含まれている場合は登録できないこと' do
        @user.first_name = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name には全角文字を使用してください")
      end
      it 'family_name半角文字が含まれている場合は登録できないこと' do
        @user.family_name = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name には全角文字を使用してください")
      end
      it 'カタカナ以外の文字ひらがなが含まれている場合は登録できないこと' do
        @user.first_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana にはカタカナを使用してください")
      end
      it 'カタカナ以外の文字ひらがなが含まれている場合は登録できないこと' do
        @user.family_name_kana = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana にはカタカナを使用してください")
      end
      it 'カタカナ以外の文字漢字が含まれている場合は登録できないこと' do
        @user.first_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana にはカタカナを使用してください")
      end
      it 'カタカナ以外の文字漢字が含まれている場合は登録できないこと' do
        @user.family_name_kana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana にはカタカナを使用してください")
      end
      it '@が含まれていないと登録できないこと' do
        @user.email = 'testing.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '英字のみでは登録できないこと' do
        @user.password = 'asdzxc'
        @user.password_confirmation = 'asdzxc'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で設定してください')
      end
      it '数字のみでは登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で設定してください')
      end
      it '全角だと登録できないこと' do
        @user.password = 'ＡＢｃ１２３'
        @user.password_confirmation = 'ＡＢｃ１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数字混合で設定してください')
      end
    end
  end
end
