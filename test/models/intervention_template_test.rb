# = Informations
#
# == License
#
# Ekylibre - Simple agricultural ERP
# Copyright (C) 2008-2009 Brice Texier, Thibaud Merigon
# Copyright (C) 2010-2012 Brice Texier
# Copyright (C) 2012-2017 Brice Texier, David Joulin
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see http://www.gnu.org/licenses.
#
# == Table: intervention_templates
#
#  active                   :boolean          default(TRUE)
#  campaign_id              :integer
#  created_at               :datetime         not null
#  description              :string
#  id                       :integer          not null, primary key
#  name                     :string
#  preparation_time_hours   :integer
#  preparation_time_minutes :integer
#  procedure_name           :string
#  updated_at               :datetime         not null
#  workflow                 :decimal(, )
#
require 'test_helper'

class InterventionTemplateTest < ActiveSupport::TestCase
  test 'have a validate factory' do
    intervention_template = build(:intervention_template)
    assert true, intervention_template.valid?
  end
end
