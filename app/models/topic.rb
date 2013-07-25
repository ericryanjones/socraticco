class Topic < ActiveRecord::Base
  extend FriendlyId
  friendly_id :topic, use: :slugged

  acts_as_taggable
  acts_as_taggable_on :keywords

  acts_as_commentable

  belongs_to :user

  attr_accessible :is_private, :topic, :user_id, :keyword_list, :detail

end
