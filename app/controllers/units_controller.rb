class UnitsController < ApplicationController
	before_action :set_unit, only: [:show]

	def index
		@units = Unit.all
	end

	def show
	end

	def new
		@unit = Unit.new
	end

	def create
		@unit = current_user.units.build(unit_params)
		if @unit.save
			redirect_to @unit
		else
			render 'new'
		end
	end


	private

		def set_unit
			@unit = Unit.find(params[:id])
		end

		def unit_params
			params.require(:unit).permit(:title, :description)
		end
end
