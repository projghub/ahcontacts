class Admin::EmailsController < Admin::AdminController
  def index
    @q = Admin::Email.search(params[:q])
    @admin_emails = @q.result(distinct: true).order("id DESC").paginate(per_page: 20, page: params[:page])
  end

  def new
    @admin_email = Admin::Email.new
  end

  def create
    @admin_email = Admin::Email.new(params[:admin_email])

    if @admin_email.save
      redirect_to @admin_email, notice: 'Successfully created.'
    else
      render action: "new"
    end
  end

  def edit
    @admin_email = Admin::Email.find(params[:id])
  end

  def show
    @admin_email = Admin::Email.find(params[:id])
  end

  def update
    @admin_email = Admin::Email.find(params[:id])

    if @admin_email.update_attributes(params[:admin_email])
      redirect_to @admin_email, notice: 'Successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @admin_email = Admin::Email.find(params[:id])
    @admin_email.destroy
    redirect_to @admin_email, notice: 'Successfully deleted.'
  end
end
