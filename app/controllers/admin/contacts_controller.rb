class Admin::ContactsController < Admin::AdminController
  def index
    @q = Admin::Contact.active.search(params[:q])
    @admin_contacts = @q.result(distinct: true).order("id DESC").paginate(per_page: 20, page: params[:page])
  end

  def new
    @admin_contact = Admin::Contact.new
  end

  def create
    @admin_contact = Admin::Contact.new(params[:admin_contact])

    if @admin_contact.save
      redirect_to @admin_contact, notice: 'Successfully created.'
    else
      render action: "new"
    end
  end

  def edit
    @admin_contact = Admin::Contact.active.find(params[:id])
  end

  def show
    @admin_contact = Admin::Contact.find(params[:id])
    @notes = @admin_contact.notes.order("created_at DESC")
    @note = Note.new
  end

  def update
    @admin_contact = Admin::Contact.active.find(params[:id])

    if @admin_contact.update_attributes(params[:admin_contact])
      redirect_to @admin_contact, notice: 'Successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @admin_contact = Admin::Contact.active.find(params[:id])
    @admin_contact.mark_as_deleted
    @admin_contact.save
    redirect_to admin_contacts_path, notice: 'Successfully deleted.'
  end

  def add_note
    @admin_contact = Admin::Contact.find(params[:contact_id])
    @admin_contact.notes.create(user_id: admin_current_user.id, namespace: "admin", description: params[:note][:description], auto: false)
    redirect_to @admin_contact, notice: "Note successfully added"
  end
end
