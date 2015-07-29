class SentimentsController < ApplicationController

	def index
		@sentiments = Sentiment.all
	end

	def show
		@sentiment = Sentiment.find(params[:id])
	end

	def new
		@sentiment = Sentiment.new
	end

	def create
		@sentiment = Sentiment.create! :text => params[:sentiment][:text]
		alchemyapi = AlchemyAPI.new
		result = alchemyapi.sentiment('text', @sentiment.text)
		behavior = result["docSentiment"]["type"]
		@sentiment.behavior = behavior
		if @sentiment.save
			redirect_to @sentiment
		else
			render :new
		end
	end

	private
	def sentiment_params
		params.require(:sentiment).permit(:text, :behavior)
	end
end
