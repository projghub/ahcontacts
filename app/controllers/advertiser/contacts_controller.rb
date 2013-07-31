class Advertiser::ContactsController < Advertiser::AdvertiserController
  def index
    @q = Advertiser::Contact.active.search(params[:q])
    @advertiser_contacts = @q.result(distinct: true).paginate(per_page: 20, page: params[:page])
  end

  def new
    @advertiser_contact = Advertiser::Contact.new
  end

  def create
    @advertiser_contact = Advertiser::Contact.new(params[:advertiser_contact])

    if @advertiser_contact.save
      redirect_to @advertiser_contact, notice: 'Successfully created.'
    else
      render action: "new"
    end
  end

  def edit
    @advertiser_contact = Advertiser::Contact.active.find(params[:id])
  end

  def show
    @advertiser_contact = Advertiser::Contact.find(params[:id])
    @notes = @advertiser_contact.notes.order("created_at DESC")
    @note = Note.new
  end

  def update
    @advertiser_contact = Advertiser::Contact.active.find(params[:id])

    if @advertiser_contact.update_attributes(params[:advertiser_contact])
      redirect_to @advertiser_contact, notice: 'Successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @advertiser_contact = Advertiser::Contact.active.find(params[:id])
    @advertiser_contact.mark_as_deleted
    @advertiser_contact.save
    redirect_to advertiser_contacts_path, notice: 'Successfully deleted.'
  end

  def add_note
    @advertiser_contact = Advertiser::Contact.find(params[:contact_id])
    @advertiser_contact.notes.create(user_id: advertiser_current_user.id, namespace: "advertiser", description: params[:note][:description], auto: false)
    redirect_to @advertiser_contact, notice: "Note successfully added"
  end

end
