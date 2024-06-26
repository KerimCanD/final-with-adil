class Api::V1::StorablesController < Api:V1:ApiController
  before_action :set_file, except: [:index]

  def index
    @storables = current_user.storables
  end

  def update
    if @storable.update(file_params)
      render json: @storable
    else
      render json: { errors: @storable.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @storable.destroy
      render json: { message: "File deleted" }
    else
      render json: { errors: @storable.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_file
    @storable = Storable.find(params[:id])
  end

  def file_params
    params.require(:storage_file)
  end
end
