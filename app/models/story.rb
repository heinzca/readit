class Story < ApplicationRecord
  after_create :create_initial_vote
  validates :name, :link, presence: true
  belongs_to :user
  has_many :votes do
    def latest
      order('id DESC').limit(4)
    end
  end

  scope :upcoming, -> { where("votes_count < 5").order("votes_count DESC")}
  scope :popular, -> { where("votes_count >= 5").order("id DESC")}

  def to_param
    # Overrides the to_param method defined by ActiveRecord::Base class. For URLs
    # Replaces non-text with dashes and returns remainder of text in lower case
    "#{id}-#{name.gsub(/\W/, '-').downcase}"
  end

  protected
    def create_initial_vote
      votes.create user: user
    end
end
