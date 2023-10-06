# frozen_string_literal: true

class SearchReflex < ApplicationReflex
  def capitalize
    value = element.value.capitalize
    morph '#search-term', value
  end
end
