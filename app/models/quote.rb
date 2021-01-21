class Quote < ApplicationRecord
  belongs_to :book


  def changed_for_autosave?
    super || Quote.changed_for_autosave?
  end

end
