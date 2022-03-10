class Api::V1::EventsController < Api::V1::GraphitiController
  def index
    events = EventResource.all(params)
    respond_with(events)
  end

  def show
    event = EventResource.find(params)
    respond_with(event)
  end

  def create
    event = EventResource.build(params)

    if event.save
      render jsonapi: event, status: :created
    else
      render jsonapi_errors: event
    end
  end

  def update
    event = EventResource.find(params)

    if event.update_attributes
      render jsonapi: event
    else
      render jsonapi_errors: event
    end
  end

  def destroy
    event = EventResource.find(params)

    if event.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: event
    end
  end
end
