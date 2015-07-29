class Sentiment < ActiveRecord::Base
	validates :text, presence: true
end 

