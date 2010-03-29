class PasswordMailer < ActionMailer::Base
  def forgot_password(password)
    setup_email(password.user)
    @subject <<  I18n.t("solicitud_cambio_contraseña")
    @body[:url] = "#{APP_CONFIG[:site_url]}/change_password/#{password.reset_code}"
  end
 
  def reset_password(user)
    setup_email(user)
    @subject << I18n.t("contraseña_reseteada") 
  end
 
  protected
  
  def setup_email(user)
    @recipients = "#{user.email}"
    @from = APP_CONFIG[:admin_email]
    @subject = "[#{APP_CONFIG[:site_name]}] "
    @sent_on = Time.now
    @body[:user] = user
  end
end