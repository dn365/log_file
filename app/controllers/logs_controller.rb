class LogsController < ApplicationController
  # GET /logs
  # GET /logs.json
  def index
    @logs = Log.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @logs }
    end
  end

  # GET /logs/1
  # GET /logs/1.json
  def show
    @log = Log.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @log }
    end
  end

  # GET /logs/new
  # GET /logs/new.json
  def new
    @node = current_node
    @log = Log.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @log }
    end
  end

  # GET /logs/1/edit
  def edit
    @node = current_node
    @log = Log.find(params[:id])
  end

  # POST /logs
  # POST /logs.json
  def create
    @node = current_node
    @log = Log.new(params[:log])
    
    @log.add_line_item_from_log(params[:node_id],@log)    
    respond_to do |format|
      if @log.save
        format.html { redirect_to node_line_items_path, notice: 'Log was successfully created.' }
        format.json { render json: @log, status: :created, location: @log }
      else
        format.html { render action: "new" }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /logs/1
  # PUT /logs/1.json
  def update
    @log = Log.find(params[:id])

    respond_to do |format|
      if @log.update_attributes(params[:log])
        format.html { redirect_to node_line_items_path, notice: 'Log was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logs/1
  # DELETE /logs/1.json
  def destroy
    @log = Log.find(params[:id])
    @log.destroy
    @log.delete_line_item_from_log(params[:id])

    respond_to do |format|
      format.html { redirect_to node_line_items_path }
      format.json { head :no_content }
    end
  end
end
