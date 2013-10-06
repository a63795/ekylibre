# -*- coding: utf-8 -*-
# == License
# Ekylibre - Simple ERP
# Copyright (C) 2008-2011 Brice Texier, Thibaud Merigon
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
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

class Backend::LandParcelsController < BackendController
  manage_restfully

  unroll

  list() do |t|
    t.column :name, url: true
    t.column :identification_number
    t.column :work_number
    #t.column :description
    #t.column :real_quantity
    #t.column :unit
    #t.column :started_on
    #t.column :stopped_on
    # t.action :divide
    t.action :edit
    t.action :destroy
  end

  # Displays the main page with the list of land parcels
  def index
    # session[:viewed_on] = params[:viewed_on] = params[:viewed_on].to_date rescue Date.today
  end

  # list(:operations, :conditions => {:target_type => LandParcel.name, :target_id => 'params[:id]'.c}, :order => "planned_on ASC") do |t|
  #   t.column :name, url: true
  #   t.column :name, through: :nature
  #   t.column :label, through: :responsible, url: true
  #   t.column :planned_on
  #   t.column :moved_on
  #   t.column :equipments_list
  #   t.column :duration
  #   t.action :edit
  #   t.action :destroy
  # end

  # def divide
  #   return unless @land_parcel = find_and_check(:land_parcel)
  #   if request.xhr?
  #     render :partial => "subdivision_form"
  #     return
  #   end

  #   if request.post?
  #     if @land_parcel.divide(params[:subdivisions].values, params[:land_parcel][:stopped_on].to_date)
  #       redirect_to :action => :index
  #     end
  #   end
  #   # @land_parcel.stopped_on ||= (session[:viewed_on].to_date rescue Date.today) - 1
  #   t3e @land_parcel.attributes
  # end

  # def merge
  #   land_parcels = params[:land_parcel].select{|k, v| v.to_i == 1}.collect{|k, v| LandParcel.find(k.to_i)}
  #   child = land_parcels[0].merge(land_parcels[1..-1], session[:viewed_on])
  #   # redirect_to(:action => :show, :id => child.id)
  #   if child
  #     render :text => url_for(:action => :show, :id => child.id, :viewed_on => session[:viewed_on] + 1), :layout => false
  #   else
  #     render :text => url_for(:action => :index, :viewed_on => session[:viewed_on] + 1), :layout => false
  #   end
  # end

end
