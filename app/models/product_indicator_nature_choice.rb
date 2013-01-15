# = Informations
# 
# == License
# 
# Ekylibre - Simple ERP
# Copyright (C) 2009-2013 Brice Texier, Thibaud Merigon
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see http://www.gnu.org/licenses.
# 
# == Table: product_indicator_nature_choices
#
#  comment      :string(255)      
#  created_at   :datetime         not null
#  creator_id   :integer          
#  id           :integer          not null, primary key
#  lock_version :integer          default(0), not null
#  name         :string(255)      not null
#  nature_id    :integer          not null
#  position     :integer          
#  updated_at   :datetime         not null
#  updater_id   :integer          
#  value        :string(255)      
#


class ProductIndicatorNatureChoice < CompanyRecord
  attr_accessible :name, :position
  belongs_to :nature, :inverse_of => :choices
  has_many :data, :class_name => "ProductIndicator", :foreign_key => :choice_value_id
  acts_as_list :scope => :product_indicator_nature

  #[VALIDATORS[ Do not edit these lines directly. Use `rake clean:validations`.
  validates_length_of :comment, :name, :value, :allow_nil => true, :maximum => 255
  validates_presence_of :name, :nature
  #]VALIDATORS]

  before_validation do
    self.value = self.name.to_s.codeize # if self.value.blank?
  end

  protect(:on => :destroy) do
    return self.data.count.zero?
  end

  def to_s
    self.name
  end

end
