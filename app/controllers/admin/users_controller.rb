class Admin::UsersController < Admin::AdminController
  def index
    @q = Admin::User.search(params[:q])
    @admin_users = @q.result(distinct: true).paginate(per_page: 20, page: params[:page])
  end

  def new
    @admin_user = Admin::User.new
  end

  def create
    @admin_user = Admin::User.new(params[:admin_user])

    if @admin_user.save
      redirect_to @admin_user, notice: 'Successfully created.'
    else
      render action: "new"
    end
  end

  def edit
    @admin_user = Admin::User.find(params[:id])
  end

  def show
    @admin_user = Admin::User.find(params[:id])
  end

  def update
    @admin_user = Admin::User.find(params[:id])

    if @admin_user.update_attributes(params[:admin_user])
      redirect_to @admin_user, notice: 'Successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @admin_user = Admin::User.find(params[:id])
    @admin_user.destroy
    redirect_to @admin_user, notice: 'Successfully deleted.'
  end
end
