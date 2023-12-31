class Api::V1::GroupsController < ApplicationController
  before_action :set_group, only: %i[ show update destroy ]

  # GET /api/v1/groups
  def index
    @groups = Group.all

    render json: @groups
  end

  # GET /api/v1/groups/1
  def show
    render json: @group
  end

  # POST /api/v1/groups
  def create
    @group = Group.new(group_params)

    if @group.save
      render json: @group, status: :created, location: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/groups/1
  def update
    if @group.update(group_params)
      render json: @group
    else
      render json: @group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/groups/1
  def destroy
    @group.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def group_params
      params.require(:group).permit(:name)
    end
end
