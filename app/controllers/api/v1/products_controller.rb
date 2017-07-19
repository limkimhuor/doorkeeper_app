module Api
  module V1
    class ProductsController < ApplicationApiController
      before_action :set_product, only: [:show, :update, :destroy]
      def index
        @products = Product.all
        json_response @products
      end

      def show
        json_response @product
      end

      def create
        respond_with Product.create(params[:product])
        @product.create! product_params
        json_response(@product, :created)
      end

      def update
        @product.update product_params
        head :no_content
      end

      def destroy
        @product.destroy product_params
        head :no_content
      end

      private
      def set_product
        @product = Product.find params[:id]
      end

      def product_params
        params.permit(:name, :price, :released_on, :category_id)
      end
    end
  end
end
