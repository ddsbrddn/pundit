class EventsController < ApplicationController
	before_action :set_event, only: [:show, :edit, :update, :destroy]

	def index
		@events = Event.all
	end

	def show
	end

	def new
		@event = Event.new
	end

	def create
		@event = current_user.events.build(event_params)
		if @event.save
			redirect_to @event
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		authorize @event
		if @event.update(event_params)
			redirect_to @event
		else
			render 'edit'
		end
	end

	def destroy
		authorize @event
		@event.destroy
		redirect_to events_path, notice: 'Event was successfully deleted'
	end

	private

		def set_event
			@event = Event.find(params[:id])
		end

		def event_params
			params.require(:event).permit(:name, :price, :description)
		end


end
