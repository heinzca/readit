class Story < ApplicationRecord
  validates :name, :link, presence: true
  has_many :votes do
    def latest
      order('id DESC').limit(4)
    end
  end
  def to_param
    # Overrides the to_param method defined by ActiveRecord::Base class. For URLs
    # Replaces non-text with dashes and returns remainder of text in lower case
    "#{id}-#{name.gsub(/\W/, '-').downcase}"
  end
end
