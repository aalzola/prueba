class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  

  # render new.rhtml
  def new
    @user = User.new
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
      redirect_back_or_default('/')
      flash[:notice] = "¡Gracias por participar!  Te hemos enviado un correo electrónico con tu código de activación."
    else
      flash[:error]  = "Lo sentimos, pero no hemos podido crear la cuenta. Contacta con nosotros para solucionar el problema."
      render :action => 'new'
    end
  end

  def activate
    logout_keeping_session!
    user = User.find_by_activation_code(params[:activation_code]) unless params[:activation_code].blank?
    case
    when (!params[:activation_code].blank?) && user && !user.active?
      user.activate!
      flash[:notice] = "¡Cuenta activada! Conectate para comenzar."
      redirect_to '/login'
    when params[:activation_code].blank?
      flash[:error] = "El código de activación no es válido. Prueba con el código que hemos enviado por correo, por favor."
      redirect_back_or_default('/')
    else 
      flash[:error]  = "No podemos encontrar el usuario de este código -- ¿Quizá ya está activado? Intenta conectarte"
      redirect_back_or_default('/')
    end
  end
end
