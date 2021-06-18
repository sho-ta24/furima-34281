require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it '記入欄全て存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとencrypted_passwordが英数字混合の6文字以上であれば登録できる' do
        @user.password = '00q0000'
        @user.encrypted_password = '000q000'
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
      it 'ニックネームが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailがある場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに＠がない場合は登録できない' do
        @user.email = 'testtestgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank", 'Password is invalid')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.encrypted_password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include
      end
      it 'passwordとpassword_confirmationが同じでなければ登録できない' do
        @user.password = '123456'
        @user.encrypted_password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordは半角英数字混合でなければ登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが五文字以下だと登録できない' do
        @user.password = '00a00'
        @user.encrypted_password = '00a00'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが数字だけだと登録できない' do
        @user.password = '00000'
        @user.encrypted_password = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)', 'Password is invalid')
      end
      it 'passwordが全角だと登録できない' do
        @user.password = 'ａａａａａ１'
        @user.encrypted_password = 'ａａａａａ１'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it '名字が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid')
      end
      it '名前が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name is invalid')
      end
      it '名字、名前が全角（漢字、ひらがな、カタカナ）でなければ登録できない' do
        @user.first_name = 'kana'
        @user.last_name = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid', 'First name is invalid')
      end
      it 'フリガナの名字が空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana is invalid')
      end
      it 'フリガナの名前が空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", 'Last name kana is invalid')
      end
      it '名字、名前のフリガナが全角カタカナでなければ登録できない' do
        @user.first_name = 'かな'
        @user.last_name = 'かな'
        @user.valid?
        expect(@user.errors.full_messages).to include
      end
      it '生年月日が空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
