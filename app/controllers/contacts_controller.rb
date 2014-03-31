class ContactsController < ApplicationController

  def index
    ensure_ten
    render :layout => request['ic-request'].blank?
  end

  def new
    @contact = Contact.new
    render :layout => request['ic-request'].blank?
  end

  def show
    @contact = Contact.find(params[:id])
    render :layout => request['ic-request'].blank?
  end

  def edit
    @contact = Contact.find(params[:id])
    render :layout => request['ic-request'].blank?
  end

  def inline_validation
    @contact = Contact.find(params[:id])
    render :layout => request['ic-request'].blank?
  end

  def email_input
    @contact = Contact.find(params[:id])
    @contact.email = params[:contact][:email]
    @contact.valid?
    render partial:'email_input'
  end

  def create
    @contact = Contact.new(params.require(:contact).permit(:email, :first_name, :last_name))
    if  @contact.save
      flash[:notice] = 'Created Contact...'
      response.header['X-IC-Redirect'] = url_for @contact # use a client-side redirect for now...
      render nothing:true
    else
      flash[:alert] = 'Could Not Save Contact...'
      response.header['X-IC-Transition'] = 'none'
      render :layout => request['ic-request'].blank?, :action => :new
    end
  end

  def update
    @contact = Contact.find(params[:id])
    if  @contact.update(params.require(:contact).permit(:email, :first_name, :last_name))
      flash[:notice] = 'Updated Contact...'
      render :layout => request['ic-request'].blank?, :action => :show
    else
      flash[:alert] = 'Could Not Save Contact...'
      response.header['X-IC-Transition'] = 'none'
      render :layout => request['ic-request'].blank?, :action => :edit
    end
  end

  def click_to_edit
    ensure_ten
    redirect_to contact_path Contact.first
  end

  def contacts_table
    if request.post?
      if params[:ids]
        if params['ic-element-id'] == 'activate_btn'

          Contact.find(params[:ids]).each &:activate!
          flash[:notice] = "Activated #{params[:ids].count} contacts!"

        elsif params['ic-element-id'] == 'deactivate_btn'

          Contact.find(params[:ids]).each &:deactivate!
          flash[:notice] = "Deactivated #{params[:ids].count} contacts!"

        else
          flash[:alert] = 'Bad Action!'
        end
      else
        flash[:alert] = 'Please select some items.'
      end
      render nothing:true
    else
      render :partial => 'contacts/contacts_table'
    end
  end

private

  def ensure_ten
    i = 10 - Contact.count
    if i > 0
      i.times do
        Contact.create!({
                         :first_name => "Joe",
                         :email => "joe_#{SecureRandom.hex(5)}@example.com",
                         :last_name => "Smith",
                         :status => "Active",
                       })

      end
    end
  end

end
