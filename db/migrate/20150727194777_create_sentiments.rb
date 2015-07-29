class CreateSentiments < ActiveRecord::Migration
  def change
    create_table :sentiments do |t|
    	t.string :text
    	t.string :behavior 
    	t.float :rating
    	t.timestamps
    end
  end
end
