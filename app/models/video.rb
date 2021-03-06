# frozen_string_literal: true

class Video < ApplicationRecord
  has_many :user_videos, dependent: :destroy
  has_many :users, through: :user_videos
  belongs_to :tutorial

  validates_presence_of :title
  validates_presence_of :description

  def self.vidoes_by_tutorial
    order('position ASC').group_by(&:tutorial_id)
  end
end
