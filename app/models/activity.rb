class Activity < ActiveRecord::Base
    def self.all_categories
		['Arts', 'Entertainment', 'Education', 'Sports', 'Outdoor', 'Others']
	end

	def self.with_categories(category_list)
		if !category_list.nil? 
			Activity.where("category in(?)", category_list) 
		else
			Activity.all
		end
	end
end
