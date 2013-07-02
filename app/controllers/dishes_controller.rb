class DishesController < InheritedResources::Base
  def set_is_today
    @dish = Dish.find(params[:id])

    t = Time.new
    date = t.strftime("%Y-%m-%d")

    respond_to do |format|
        @dish.is_today = 1
        @dish.set_date = date
        @dish.save
        format.html { redirect_to dishes_path, notice: @dish.name + ' selected!' }
        format.json { head :no_content }
    end
  end

  def unset_is_today
    @dish = Dish.find(params[:id])

    respond_to do |format|
      @dish.is_today = 0
      @dish.set_date = ''
      @dish.save
      format.html { redirect_to dishes_path, notice: @dish.name + ' unselected!' }
      format.json { head :no_content }
    end
  end
end
