class SearchesController < ApplicationController
	def new
		@search = Search.new
	end

	def create
		@search = Search.create!(paramas[:search])
		redirect_to @search
	end

	def show
		@search = Search.find(params[:id])
	end
	
end
