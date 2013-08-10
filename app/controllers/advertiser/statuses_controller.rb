class Advertiser::StatusesController < Advertiser::AdvertiserController
  def index
    @q = Advertiser::Status.order(:placement).search(params[:q])
    @advertiser_statuses = @q.result(distinct: true).paginate(per_page: 20, page: params[:page])
  end

  def new
    @advertiser_status = Advertiser::Status.new
  end

  def create
    @advertiser_status = Advertiser::Status.new(params[:advertiser_status])

    if @advertiser_status.save
      redirect_to @advertiser_status, notice: 'Successfully created.'
    else
      render action: "new"
    end
  end

  def edit
    @advertiser_status = Advertiser::Status.find(params[:id])
  end

  def show
    @advertiser_status = Advertiser::Status.find(params[:id])
  end

  def update
    @advertiser_status = Advertiser::Status.find(params[:id])

    if @advertiser_status.update_attributes(params[:advertiser_status])
      redirect_to @advertiser_status, notice: 'Successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @advertiser_status = Advertiser::Status.find(params[:id])
    @advertiser_status.destroy
    redirect_to @advertiser_status, notice: 'Successfully deleted.'
  end
end
