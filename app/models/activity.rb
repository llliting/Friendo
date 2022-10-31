class Activity < ActiveRecord::Base
    def self.all_categories
		['Arts', 'Entertainment', 'Education', 'Sports', 'Outdoor', 'Others']
	end

	def self.with_categories(category_list, sort_by)
		if !category_list.nil? 
			Activity.where("category in(?)", category_list).order sort_by 
		else
			Activity.all.order sort_by
		end
	end
end
