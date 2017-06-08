class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if current_user
      dreams_followed = current_user.following_dreams.sort_by do |dream|
        - dream.likes.count
      end

      all_dreams = Dream.all.sort_by do |dream|
        - dream.likes.count
      end

      @dreams = (dreams_followed + all_dreams).uniq
    else
      @dreams = Dream.all.sort_by do |dream|
        - dream.likes.count
      end
    end
  end
end
