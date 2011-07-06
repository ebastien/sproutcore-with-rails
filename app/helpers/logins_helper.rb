module LoginsHelper
  
  def logged_user
    @logged_user || remembered_user
  end
  
  def force_user_in(user)
    self.logged_user = user
  end
  
  def log_user_in(login, password)
    if login == "John" && password == "secret"
      cookies.permanent.signed[:remember_token] = ["John ID", "John's salt"]
      self.logged_user = "John"
    end
  end
  
  def log_user_out
    cookies.delete :remember_token
    self.logged_user = nil
  end

  def logged_in?
    !logged_user.nil?
  end
  
  private
  
  def logged_user=(user)
    @logged_user = user
  end
  
  def remembered_user
    user_id, user_salt = cookies.signed[:remember_token] || [nil, nil]
    "John" if (user_id == "John ID" && user_salt == "John's salt")
  end
end
