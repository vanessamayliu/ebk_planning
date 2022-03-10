class Api::V1::NonprofitsController < Api::V1::GraphitiController
  def index
    nonprofits = NonprofitResource.all(params)
    respond_with(nonprofits)
  end

  def show
    nonprofit = NonprofitResource.find(params)
    respond_with(nonprofit)
  end

  def create
    nonprofit = NonprofitResource.build(params)

    if nonprofit.save
      render jsonapi: nonprofit, status: :created
    else
      render jsonapi_errors: nonprofit
    end
  end

  def update
    nonprofit = NonprofitResource.find(params)

    if nonprofit.update_attributes
      render jsonapi: nonprofit
    else
      render jsonapi_errors: nonprofit
    end
  end

  def destroy
    nonprofit = NonprofitResource.find(params)

    if nonprofit.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: nonprofit
    end
  end
end
