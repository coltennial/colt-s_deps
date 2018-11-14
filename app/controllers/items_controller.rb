class ItemsController < ApplicationController
  before_action :set_department
  before_action :set_item, except: [:index, :new, :create]

  def index
    @items = @department.items
  end

  def show
  end

  def new
    @item = @department.items.new
    render partial: "form"
  end

  def create
    @item = @department.items.new(item_params)
    if @item.save
      redirect_to department_items_path
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update
    if @item.update(item_params)
      redirect_to department_items_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to department_items_path
  end

  private
    def set_department
      @department = Department.find(params[:sub_id])
    end

    def set_item
      @item = item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :body)
    end
end