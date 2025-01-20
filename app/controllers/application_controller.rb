class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # サインアップ時に受け付ける追加のパラメータを指定
    devise_parameter_sanitizer.permit(:sign_up, keys: [
                                        :nickname, # ニックネーム
                                        :email,                     # メールアドレス
                                        :password,                  # パスワード
                                        :password_confirmation,     # パスワード確認
                                        :identity_verification,     # 本人確認（例: 画像、本人証明書番号等）
                                        :full_name,                 # お名前（全角）
                                        :full_name_kana,            # お名前カナ（全角）
                                        :birthdate                  # 生年月日
                                      ])
  end
end
