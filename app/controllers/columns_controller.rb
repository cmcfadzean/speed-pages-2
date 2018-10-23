class ColumnsController < ApplicationController
  before_action :set_column, only: [:show, :edit, :update, :destroy]

  # GET /columns
  # GET /columns.json
  def index
    @section = Section.find(params[:section_id])
    @columns = @section.columns
  end

  # GET /columns/1
  # GET /columns/1.json
  def show
    section = Section.find(params[:section_id])
    @column = section.columns.find(params[:id])
  end

  # GET /columns/new
  def new
    section = Section.find(params[:section_id])
    @column = section.columns.build
  end

  # GET /columns/1/edit
  def edit
    section = Section.find(params[:section_id])
    @column = section.columns.find(params[:id])
  end

  # POST /columns
  # POST /columns.json
  def create
    section = Section.find(params[:section_id])
    @column = section.columns.create(column_params)

    respond_to do |format|
      if @column.save
        format.html { redirect_to [@column.section.page, @column.section, @column], notice: 'Column was successfully created.' }
        format.json { render :show, status: :created, location: @column }
      else
        format.html { render :new }
        format.json { render json: @column.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /columns/1
  # PATCH/PUT /columns/1.json
  def update
    section = Section.find(params[:section_id])
    @column = section.columns.find(params[:id])

    respond_to do |format|
      if @column.update(column_params)
        format.html { redirect_to [@column.section.page, @column.section, @column], notice: 'Column was successfully updated.' }
        format.json { render :show, status: :ok, location: @column }
      else
        format.html { render :edit }
        format.json { render json: @column.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /columns/1
  # DELETE /columns/1.json
  def destroy
    section = Section.find(params[:section_id])
    @column = section.columns.find(params[:id])
    @column.destroy
    respond_to do |format|
      format.html { redirect_to [@column.section.page, @column.section, @column], notice: 'Column was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_column
      @column = Column.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def column_params
      params.require(:column).permit(:title, :width, :section_id)
    end
end
