class KkController < ApplicationController
  def kk
    KkMailer.deliver_welcome_email('Felipe')
  end
end
