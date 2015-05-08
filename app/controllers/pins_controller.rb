class PinsController < ApplicationController
before_action :set_pin, :only => [:show,:edit,:update,:destroy]
	#before_action :authenticate_user!, :except => [:index, :show]
	def index
		  @pins = Pin.all.order("created_at DESC")
		  # @pins = Pin.all.order("created_at DESC")
	end

	def new
		@pin = current_user.pins.build
	end

	def show
	end

	def create
		@pin = current_user.pins.build(pin_params)
		if @pin.save
			redirect_to @pin, notice: "successfully created new Pin"
		else
			render "new"
		end
	end

	def edit

	end

	def update
		if @pin.update(pin_params)
			redirect_to @pin, notice: "Pin updated successfully"
		else
			render "edit"
		end
	end

	def destroy
		if @pin.destroy
			redirect_to pins_path, notice: "Pin deleted sucessfully"
		end
	end

	private

	def set_pin
		@pin = Pin.find(params[:id])
	end

	def pin_params
		#params.require(:Pin).permit!
		params.require(:pin).permit!
	end


end
