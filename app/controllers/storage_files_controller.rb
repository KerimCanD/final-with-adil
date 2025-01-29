class StorageFilesController < ApplicationController
  before_action :set_file, only: %i[edit update destroy]

  def upload
    @file = Storage::File.new
  end

  def create
    @user = current_user
    @file = Storage::File.new(file_params)
    if @file.save
      @file.storable = Storable.create(user: @user, storable: @file)
      redirect_to root_path
    else
      render :upload
    end
  end

  def index
    @folders = Storage::Folder.all
  end

  def update; end

  def destroy; end

  def edit; end

  private

  def set_file
    @file = Storage::File.find(params[:id])
  end

  def file_params
    params.require(:storage_file).permit(:file)
  end
end
