class Serie < ApplicationRecord
  include PgSearch
  include Higthlightable
  
  multisearchable again: [:title]
  belongs_to :category
  has_many :reviews, as: :reviewable
  has_many :episodes, ->{ order(:episode_number) }, class_name: 'Movie', dependent: :detroy
  belongs_to :last_whached_episode, class_name: 'Movie', optional: true
  validates: :title, presence: true
  validates: :description, presence: true
  validates: :thumbnail_key, presence: true
end
