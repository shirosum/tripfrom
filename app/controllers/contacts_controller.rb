class ContactsController < ApplicationController
  def new
    @contact = contact
  end

  def create
    @contact = ContactMailer.new(contact_params)
    if @contact.save
      ContactMailer.contact_mailer(@contact).deliver
      flash[:notice] = "お問い合わせを送信しました"
      redirect_to contacts_new_path
    else
      render 'new'
    end
  end

  def contact_pramas
    params.require(:contact).permit(:email, :message)
  end
end
