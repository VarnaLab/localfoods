class Item < ActiveRecord::Base
	belongs_to :inventory, :foreign_key => "inventory_id"
	has_attached_file :item_photo, :url => "/system/item_photos/:id/:style/:basename.:extension", :styles => {
		:thumb => "50x50>",
		:medium => "300x300>",
		:small => "150x150>"
	}

	attr_accessible :name, :description, :totalquantity, :minorder, :maxorder, :item_photo ,:price, :available, :units

	validates :name, :presence => true
	validates :description, :presence => true
	validates :minorder, :presence => true
	validates :price, :presence => true
	validates :units, :presence => true
	validates :totalquantity, :presence => true
	
	validates :minorder, :maxorder, :totalquantity, :numericality => { :only_integer => true }
	validates :maxorder, :numericality => {:greater_than => :minorder}, :allow_blank => true

	before_validation :format_values


	def is_available?
		if self.available && ApplicationState.orders_open?
			"Yes"
		else
			"No"
		end
	end

	private

	def format_values
		if(self.units.nil? || self.units.empty?)
			self.units = "units"
		end
		self.units.downcase
	end

	def order(quantity)
		if (ApplicationState.orders_open? && (available && valid_quantity?(quantity)))
			self.totalordered += quantity
		end
	end

	def valid_quantity?(quantity)
		(quantity >= minorder) && (quantity <= maxorder) && (quantity <= self.num_remaining)
	end

	def update_availability
		self.available = (self.num_remaining >= minorder)
  		#must return true because before_save cancels save if this method returns false
  		return true
	end

	def num_remaining
		totalquantity - totalordered
	end

	def reset_quantity
		self.totalordered = 0
		self.available = true
	end
end
