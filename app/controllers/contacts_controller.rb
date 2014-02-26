class ContactsController < ApplicationController

  def index
    ensure_ten
  end

  def new
  end

  def show
    @contact = Contact.find(params[:id])
    render :layout => request['ic-request'].blank?
  end

  def edit
    @contact = Contact.find(params[:id])
    render :layout => request['ic-request'].blank?
  end

  def update
    @contact = Contact.find(params[:id])
    if  @contact.update(params.require(:contact).permit(:email, :first_name, :last_name))
      flash[:notice] = 'Updated Contact...'
      render :layout => request['ic-request'].blank?, :action => :show unless request['ic-request'].blank?
    else
      flash[:alert] = 'Could Not Save Contact...'
      render :layout => request['ic-request'].blank?, :action => :edit
    end
  end

  def click_to_edit
    ensure_ten
    redirect_to contact_path Contact.first
  end

  def table
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
