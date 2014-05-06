# == Schema Information
#
# Table name: blogs
#
#  id                     :integer          not null, primary key
#  title                  :string(255)
#  content                :text

class Blog < ActiveRecord::Base
end
