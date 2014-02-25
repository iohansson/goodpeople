module LoginMacros
  def set_user_session(user)
    session[:user_id] = user.id
  end
  
  def unset_user_session
    session[:user_id] = nil
  end
  
  def sign_in_user(user)
    visit admin_login_path
    fill_in 'Почта', with: user.email
    fill_in 'Пароль', with: "pass"
    click_button 'Войти'
  end
  
  def create_user
    User.find_by_email('specific@mail.com') || FactoryGirl.create(:user, email: 'specific@mail.com') || User.create(email: 'specific@mail.com', password: 'pass', password_confirmation: 'pass')
  end
  
  def create_user_and_sign_in
    set_user_session create_user
  end
  
  def create_user_and_sign_in_via_form
    sign_in_user create_user
  end
  
  def require_admin_login
    unset_user_session
    get :index
    expect(response).to redirect_to(admin_login_url)
  end
end
