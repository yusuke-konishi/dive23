class TagsController < ApplicationController
  def index
    @all_tag_list = ActsAsTaggableOn::Tag.all.pluck(:name)
  end
end
