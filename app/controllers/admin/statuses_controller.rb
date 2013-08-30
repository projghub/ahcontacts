class Admin::StatusesController < Admin::AdminController
  def index
    @q = Admin::Status.search(params[:q])
    @admin_statuses = @q.result(distinct: true).order("id DESC").paginate(per_page: 20, page: params[:page])
  end

  def new
    @admin_status = Admin::Status.new
  end

  def create
    @admin_status = Admin::Status.new(params[:admin_status])

    if @admin_status.save
      redirect_to @admin_status, notice: 'Successfully created.'
    else
      render action: "new"
    end
  end

  def edit
    @admin_status = Admin::Status.find(params[:id])
  end

  def show
    @admin_status = Admin::Status.find(params[:id])
  end

  def update
    @admin_status = Admin::Status.find(params[:id])

    if @admin_status.update_attributes(params[:admin_status])
      redirect_to @admin_status, notice: 'Successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @admin_status = Admin::Status.find(params[:id])
    @admin_status.destroy
    redirect_to @admin_status, notice: 'Successfully deleted.'
  end
end
