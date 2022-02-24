class PlantTagsController < ApplicationController

  def new
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  def create
    # {"plant_tag"=>{"tag"=>"10"}, "plant_id"=>"7"}
    @plant = Plant.find(params[:plant_id])
    @tag = Tag.find(params[:plant_tag][:tag])
    @plant_tag = PlantTag.new plant: @plant, tag: @tag
    if @plant_tag.save
      redirect_to garden_path(@plant.garden)
    else
      render :new
    end
  end

  def destroy
    @plant_tag = PlantTag.find(params[:id])
    @plant_tag.destroy
    redirect_to garden_path(@plant_tag.plant.garden)
  end
end
