# frozen_string_literal: true

module Api
  module V1
    class ItemsController < ApplicationController
      def index
        @items = Item.all
        render json: ItemsRepresenter.new(@items).as_json
      end

      def update
        @item = Item.find(params[:id])
        @item.update(price: params[:price])
        render json: { message: 'Item price updated' }, status: :ok
      end

      def check_price
        bad_string = []
        total = 0
        params[:items_code].gsub(',', '').split(' ').each do |item|
          if Item.pluck(:code).include?(item)
            total += Item.find_by(code: item).price.to_f
          else
            bad_string << item
          end
        end
        error_message = bad_string.empty? ? '' : "The following code don't exist: #{bad_string.join(', ')}"
        render json: { Total: "#{format('%.2f', total)}#{Item.first.currency}",
                       message: if error_message == ''
                                  'success'
                                else
                                  error_message
                                end }, status: :ok
      end

      def apply_discount
        items_code = params[:items_code].gsub(',', '').split(' ')
        shirt_count = 0
        shirt_total = 0
        mug_count = 0
        mug_total = 0
        total = 0

        items_code.each do |item|
          item_obj = Item.find_by(code: item)
          case item_obj.code
          when 'TSHIRT'
            shirt_count += 1
            shirt_total += item_obj.price.to_f
          when 'MUG'
            mug_count += 1
            mug_total += item_obj.price.to_f
          else
            total += item_obj.price.to_f
          end
        end

        shirt_count >= 3 && shirt_total -= shirt_total * 0.3
        mug_count >= 2 && mug_total -= Item.find_by(code: 'MUG').price.to_f

        total += shirt_total + mug_total

        render json: { Total: "#{format('%.2f', total)}#{Item.first.currency}" }, status: :ok
      end
    end
  end
end
