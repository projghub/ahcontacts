class Advertiser::EmailsController < Advertiser::AdvertiserController
  def index
    @q = Advertiser::Email.search(params[:q])
    @advertiser_emails = @q.result(distinct: true).paginate(per_page: 20, page: params[:page])
  end

  def new
    @advertiser_email = Advertiser::Email.new
  end

  def create
    @advertiser_email = Advertiser::Email.new(params[:advertiser_email])

    if @advertiser_email.save
      redirect_to @advertiser_email, notice: 'Successfully created.'
    else
      render action: "new"
    end
  end

  def edit
    @advertiser_email = Advertiser::Email.find(params[:id])
  end

  def show
    @advertiser_email = Advertiser::Email.find(params[:id])
  end

  def update
    @advertiser_email = Advertiser::Email.find(params[:id])

    if @advertiser_email.update_attributes(params[:advertiser_email])
      redirect_to @advertiser_email, notice: 'Successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @advertiser_email = Advertiser::Email.find(params[:id])
    @advertiser_email.destroy
    redirect_to @advertiser_email, notice: 'Successfully deleted.'
  end
end
