class Recipe < ApplicationRecord
    belongs_to :user
    belongs_to :category 
    accepts_nested_attributes_for :category
    # reject_if: proc { |attributes| attributes['name'].blank? }

    # def category_attributes=(category_attributes)
    #     category_attributes.values.each do |category_attribute|
    #       category = Category.find_or_create_by(category_attribute)
    #       self.categories << category
    #     end
    # end

    # scope :with_long_instructions, -> { where("length(instructions) > 10") }
    scope :ordered_by_name, -> { order(name: :asc) }
    
    # validates :instructions, presence: true,
    #  length: { minimum: 5 }

    # validates :description, presence: true,
    #  length: { minimum: 5 }

    #  validates :ingredients, presence: true,
    #  length: { minimum: 5 }

      validates :name, presence: true,
      length: { minimum: 5 }


    def self.search(search)
        if search
         category_type = Category.find_by(name: search)
        if category_type
         self.where(category_id: category_type)
    else 
            @recipes = Recipe.all
        end
    else
            @recipes = Recipe.all
       end
    end

end