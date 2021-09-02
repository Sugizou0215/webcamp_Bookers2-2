class SearchController < ApplicationController

  def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    @records = search_for(@model, @content, @method)
  end

  private
  def search_for(model, content, method)
    if model == 'user'
      if method == 'match'
        User.where(name: content)
      elsif method == 'forward'
        User.where('name LIKE ?', content+'%')
      elsif method == 'backward'
        User.where('name LIKE ?', '%'+content)
      else
        User.where('name LIKE ?', '%'+content+'%')
      end
    elsif model == 'book'
      if method == 'match'
        Book.where(opinion: content)
      elsif method == 'forward'
        Book.where('opinion LIKE ?', content+'%')
      elsif method == 'backward'
        Book.where('opinion LIKE ?', '%'+content)
      else
        Book.where('opinion LIKE ?', '%'+content+'%')
      end
    end
  end

end
