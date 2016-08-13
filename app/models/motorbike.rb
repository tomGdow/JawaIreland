class Motorbike < ActiveRecord::Base
  attr_accessible :category, :description, :engineSize, :image, :make, :mileage, :model, :price, :year, :remote_image_url


      mount_uploader :image, ImageUploader


     belongs_to :user
     has_many :line_items
     has_many  :orders, through: :line_items

    validates :make,
              :model,
              :category,
              :description,
              :price,
              :year,
              :engineSize,
              :presence => true

  validates :description,
            :length => { :minimum => 20 }

  validates :engineSize,
            :year,
            :numericality => true

  validates :price,
            :numericality => {:greater_than_or_equal_to => 1 }









  def self.search(search_query, search)

    if search == "search_make"

      find(:all, :conditions => ["make LIKE ?", "%#{search_query}%"])

    elsif search == "search_category"
      find(:all, :conditions => ["category LIKE ?", "%#{search_query}%"])
    elsif search == "search_description"
      find(:all, :conditions => ["description LIKE ?", "%#{search_query}%"])
    elsif search == "search_all"
      find(:all, :conditions => ["category LIKE ? OR description LIKE ? OR enginesize LIKE ? OR make LIKE
      ? OR mileage LIKE ? OR model LIKE ? OR price LIKE ? OR year LIKE ?",
    "%#{search_query}%", "%#{search_query}%", "%#{search_query}%",
    "%#{search_query}%", "%#{search_query}%", "%#{search_query}%", "%#{search_query}%", "%#{search_query}%"])


    else

      find (:all)

    end
  end


end

