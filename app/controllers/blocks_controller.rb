class BlocksController < ApplicationController
  before_action :set_block, only: [:show, :edit, :update, :destroy]

  # GET /blocks
  # GET /blocks.json
  def index
    @column = Column.find(params[:column_id])
    @blocks = @column.blocks
  end

  # GET /blocks/1
  # GET /blocks/1.json
  def show
    column = Column.find(params[:column_id])
    @block = column.blocks.find(params[:id])
  end

  # GET /blocks/new
  def new
    column = Column.find(params[:column_id])
    @block = column.blocks.build
  end

  # GET /blocks/1/edit
  def edit
    column = Column.find(params[:column_id])
    @block = column.blocks.find(params[:id])
  end

  # POST /blocks
  # POST /blocks.json
  def create
    column = Column.find(params[:column_id])
    @block = column.blocks.create(block_params)

    respond_to do |format|
      if @block.save
        format.html { redirect_to [@block.column.section.page, @block.column.section, @block.column, @block], notice: 'Block was successfully created.' }
        format.json { render :show, status: :created, location: @block }
      else
        format.html { render :new }
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blocks/1
  # PATCH/PUT /blocks/1.json
  def update
    column = Column.find(params[:column_id])
    @block = column.blocks.find(params[:id])

    respond_to do |format|
      if @block.update(block_params)
        format.html { redirect_to [@block.column.section.page, @block.column.section, @block.column, @block], notice: 'Block was successfully updated.' }
        format.json { render :show, status: :ok, location: @block }
      else
        format.html { render :edit }
        format.json { render json: @block.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blocks/1
  # DELETE /blocks/1.json
  def destroy
    column = Column.find(params[:column_id])
    @block = column.blocks.find(params[:id])
    @block.destroy
    respond_to do |format|
      format.html { redirect_to blocks_url, notice: 'Block was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_block
      @block = Block.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def block_params
      params.require(:block).permit(:title, :content, :column_id)
    end
end
