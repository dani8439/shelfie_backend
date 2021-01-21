class Quote < ApplicationRecord
  belongs_to :book


  # def changed_for_autosave?
  #   super || example_file.changed_for_autosave?
  # end

end
